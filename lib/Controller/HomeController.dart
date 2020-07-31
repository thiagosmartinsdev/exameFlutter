import 'dart:convert';
import 'package:exameflutter/DB/BD.dart';
import 'package:exameflutter/Model/Rates.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

part 'HomeController.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  ObservableList<DropdownMenuItem> listaMoedasOrigem =
      ObservableList<DropdownMenuItem>();

  ObservableList<DropdownMenuItem> listaMoedasDesejada =
      ObservableList<DropdownMenuItem>();

  @observable
  double valorTipoMoeda;

  @observable
  double valorMoedaDesejada;

  @observable
  String moedaOrigem;

  @observable
  double moedaDestino;

  @observable
  double valor;

  @observable
  Future<Rates> rates;

  @observable
  double valorParaConversao;

  @observable
  double resultado = .0;

  ObservableList listaHistorico = ObservableList();

  Map<String, double> mapMoedas = Map();

  @action
  Future<void> iniciar() async {
    await getListaMoedas();
    await getListaMoedasDesejada();
  }

  @action
  getListaMoedas() async {
    if (moedaOrigem == null) moedaOrigem = "BRL";
    Rates rate = await fetchAPI(moedaOrigem);

    rate.rates.forEach((key, value) {
      listaMoedasOrigem.add(DropdownMenuItem(
        child: Text(key.toString()),
        value: (key), //value
      ));
    });
  }

  @action
  getListaMoedasDesejada() async {
    // if (moedaDestino == null) moedaDestino = "USD" ;
    Rates rate = await fetchAPI(moedaOrigem);

    resetLista();

    rate.rates.forEach((key, value) {
      if (key == "USD") valorMoedaDesejada = value;

      mapMoedas[key] = value;

      listaMoedasDesejada.add(DropdownMenuItem(
        child: Text(key.toString()),
        value: (value), //value
      ));
    });
  }

  @action
  resetLista() {
    listaMoedasDesejada.removeRange(0, listaMoedasDesejada.length);
  }

  @action
  void setTipoMoeda(valor) {
    valorTipoMoeda = valor;
  }

  @action
  void setMoedaOrigem(valor) {
    moedaOrigem = valor;
  }

  @action
  void setMoedaDestino(valor) {
    moedaDestino = valor;
  }

  @action
  void setTipoMoedaDesejada(valor) {
    valorMoedaDesejada = valor;
  }

  @action
  void setValorParaConversao(valor) {
    valorParaConversao = valor;
  }

  @action
  Future<Rates> fetchAPI(moeda) async {
    var url = "https://api.exchangeratesapi.io/latest?base=" + '$moeda';

    var resp = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    if (resp.statusCode == 200) {
      return Rates.fromJson(json.decode(resp.body));
    } else {
      throw Exception(resp.statusCode);
    }
  }

  @action
  double converter() {
    double format(double value, int places) {
      double mod = pow(10.0, places);
      return ((value * mod).round().toDouble() / mod);
    }

    return resultado = format(valorParaConversao * valorMoedaDesejada, 2);
  }

  @action
  gravarHistorico() async {
    String moedaConvertida = "";

    mapMoedas.forEach((key, value) {
      if (value == valorMoedaDesejada) moedaConvertida = key;
    });

    Map<String, dynamic> historico = Map();
    historico['moeda_origem'] = moedaOrigem;
    historico['valor_origem'] = valorParaConversao;
    historico['moeda_converter'] = moedaConvertida;
    historico['valor_convertido'] = resultado;

    var banco = new BD();
    await banco.gravarHistorico(historico);
  }

  @action
  getHistorico() async {
    var bd = BD();
    listaHistorico = await bd.getHistorico();
  }

  @action
  zera() async {
    var bd = BD();
    await bd.zeraBanco();
    
  }
}
