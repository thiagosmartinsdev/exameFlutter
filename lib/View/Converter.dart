import 'package:exameflutter/Controller/HomeController.dart';
import 'package:exameflutter/View/Historico.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:get/get.dart';

class Converter extends StatefulWidget {
  Converter({Key key}) : super(key: key);

  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  HomeController controller = Get.put(HomeController());
  TextEditingController valueController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    controller.iniciar();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(right: Get.width * 0.02),
            child: Center(
                child: FlatButton(
                    child: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back())),
          ),
          title: Text("Conversão de Moeda"),
          backgroundColor: Colors.yellow[700],
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: Get.width * 0.02),
              child: Center(
                  child: FlatButton(
                child: Text("Histórico", style: TextStyle(color: Colors.white)),
                onPressed: () async =>
                    {await controller.getHistorico(), Get.to(Historico())},
              )),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: Get.width * 0.05),
                      child: Text("TIPO MOEDA"),
                    ),
                  ],
                ),
                Container(
                  height: Get.height * 0.07,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.5, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                  width: Get.width * 0.9,
                  padding: EdgeInsets.only(
                      top: Get.height * 0.006,
                      bottom: Get.height * 0.006,
                      left: Get.width * 0.03,
                      right: Get.width * 0.03),
                  child: Observer(
                    builder: (_) => DropdownButton(
                      isExpanded: true,
                      value: controller.moedaOrigem,
                      items: controller.listaMoedasOrigem,
                      onChanged: (value) {
                        setState(() {
                          controller.setMoedaOrigem(value);
                          controller.getListaMoedasDesejada();
                        });
                      },
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Container(
                  height: Get.height * 0.11,
                  width: Get.width * 0.9,
                  child: Container(
                    height: Get.height * 0.09,
                    child: TextFormField(
                      cursorColor: Colors.black87,
                      controller: valueController,
                      onChanged: (text) {
                        controller.setValorParaConversao(text);
                      },
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(color: Colors.yellow[700])),
                          labelText: 'Valor R\u0024 ',
                          labelStyle: TextStyle(color: Colors.black87),
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(15.0),
                              borderSide:
                                  new BorderSide(color: Colors.yellow[700]))),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Informe um valor";
                        }
                      },
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: Get.height * 0.1)),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: Get.width * 0.05),
                      child: Text("MOEDA DESEJADA"),
                    ),
                  ],
                ),
                Container(
                  width: Get.width * 0.9,
                  height: Get.height * 0.07,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.5, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                  padding: EdgeInsets.only(
                      top: Get.height * 0.006,
                      bottom: Get.height * 0.006,
                      left: Get.width * 0.03,
                      right: Get.width * 0.03),
                  child: Observer(
                    builder: (_) => DropdownButton(
                        isExpanded: true,
                        value: controller.valorMoedaDesejada,
                        items: controller.listaMoedasDesejada,
                        onChanged: (value) {
                          setState(() {
                            controller.setTipoMoedaDesejada(value);
                          });
                        }),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Container(
                  height: Get.height * 0.07,
                  width: Get.width * 0.9,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.5, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Observer(
                      builder: (_) => Text(
                            '${controller.resultado}',
                            style: TextStyle(fontSize: 20),
                          )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.05),
                  child: Container(
                    width: Get.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(10)),
                    child: FlatButton(
                        child: Text(
                          "CONVERTER",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async => {
                              if (_formKey.currentState.validate())
                                {
                                  controller.valorParaConversao =
                                      double.parse(valueController.text),
                                  controller.converter(),
                                  await controller.gravarHistorico(),
                                  await controller.getHistorico()
                                }
                            }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
