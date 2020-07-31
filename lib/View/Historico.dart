import 'package:exameflutter/Controller/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class Historico extends StatefulWidget {
  Historico({Key key}) : super(key: key);

  @override
  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  HomeController controller = Get.put(HomeController());

  @override
  void setState(fn) {
    controller.getHistorico();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[700],
          leading: Padding(
            padding: EdgeInsets.only(right: Get.width * 0.02),
            child: Center(
                child: FlatButton(
                    child: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back())),
          ),
          title: Text(
            "Histórico de conversões",
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
          actions: <Widget>[
            controller.listaHistorico.length == 0
                ? Container()
                : FlatButton(
                    child: Icon(Icons.delete_forever, color: Colors.white),
                    onPressed: () async => {
                          await Get.defaultDialog(
                              title: "EXLCUIR?",
                              middleText:
                                  "Tem certeza que deseja excluir o histórico?",
                              confirmTextColor: Colors.white,
                              textConfirm: "Excluir",
                              textCancel: "Cancelar",
                              onConfirm: () async => {
                                    await controller.zera(),
                                    Get.back(),
                                    this.setState(() {
                                      controller.getHistorico();
                                    })
                                  }),
                          // controller.getHistorico()
                        })
          ],
        ),
        body: Container(
          color: Colors.white,
          width: Get.width,
          height: Get.height * 0.9,
          child: controller.listaHistorico.length == 0
              ? Center(
                  child: Text(
                    "Você ainda não efetuou nenhum cálculo",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Observer(
                  builder: (_) => Container(
                    child: ListView.builder(
                      itemCount: controller.listaHistorico.length,
                      itemBuilder: (_, index) {
                        var item = controller.listaHistorico[index];
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            width: Get.width * 0.9,
                            height: Get.height * 0.1,
                            decoration:
                                BoxDecoration(color: Colors.yellow[700]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  width: Get.width * 0.4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(item['moeda_origem'],
                                          style: TextStyle(fontSize: 20)),
                                      Text(
                                        " " + item['valor_origem'],
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    width: Get.width * 0.1,
                                    child: Text(" = ",
                                        style: TextStyle(fontSize: 30))),
                                Container(
                                  width: Get.width * 0.4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(item["moeda_converter"],
                                          style: TextStyle(fontSize: 20)),
                                      Text(" " + item["valor_convertido"],
                                          style: TextStyle(fontSize: 20)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ));
  }
}
