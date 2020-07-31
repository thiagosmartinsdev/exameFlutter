// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$valorTipoMoedaAtom = Atom(name: 'HomeControllerBase.valorTipoMoeda');

  @override
  double get valorTipoMoeda {
    _$valorTipoMoedaAtom.reportRead();
    return super.valorTipoMoeda;
  }

  @override
  set valorTipoMoeda(double value) {
    _$valorTipoMoedaAtom.reportWrite(value, super.valorTipoMoeda, () {
      super.valorTipoMoeda = value;
    });
  }

  final _$valorMoedaDesejadaAtom =
      Atom(name: 'HomeControllerBase.valorMoedaDesejada');

  @override
  double get valorMoedaDesejada {
    _$valorMoedaDesejadaAtom.reportRead();
    return super.valorMoedaDesejada;
  }

  @override
  set valorMoedaDesejada(double value) {
    _$valorMoedaDesejadaAtom.reportWrite(value, super.valorMoedaDesejada, () {
      super.valorMoedaDesejada = value;
    });
  }

  final _$moedaOrigemAtom = Atom(name: 'HomeControllerBase.moedaOrigem');

  @override
  String get moedaOrigem {
    _$moedaOrigemAtom.reportRead();
    return super.moedaOrigem;
  }

  @override
  set moedaOrigem(String value) {
    _$moedaOrigemAtom.reportWrite(value, super.moedaOrigem, () {
      super.moedaOrigem = value;
    });
  }

  final _$moedaDestinoAtom = Atom(name: 'HomeControllerBase.moedaDestino');

  @override
  double get moedaDestino {
    _$moedaDestinoAtom.reportRead();
    return super.moedaDestino;
  }

  @override
  set moedaDestino(double value) {
    _$moedaDestinoAtom.reportWrite(value, super.moedaDestino, () {
      super.moedaDestino = value;
    });
  }

  final _$valorAtom = Atom(name: 'HomeControllerBase.valor');

  @override
  double get valor {
    _$valorAtom.reportRead();
    return super.valor;
  }

  @override
  set valor(double value) {
    _$valorAtom.reportWrite(value, super.valor, () {
      super.valor = value;
    });
  }

  final _$ratesAtom = Atom(name: 'HomeControllerBase.rates');

  @override
  Future<Rates> get rates {
    _$ratesAtom.reportRead();
    return super.rates;
  }

  @override
  set rates(Future<Rates> value) {
    _$ratesAtom.reportWrite(value, super.rates, () {
      super.rates = value;
    });
  }

  final _$valorParaConversaoAtom =
      Atom(name: 'HomeControllerBase.valorParaConversao');

  @override
  double get valorParaConversao {
    _$valorParaConversaoAtom.reportRead();
    return super.valorParaConversao;
  }

  @override
  set valorParaConversao(double value) {
    _$valorParaConversaoAtom.reportWrite(value, super.valorParaConversao, () {
      super.valorParaConversao = value;
    });
  }

  final _$resultadoAtom = Atom(name: 'HomeControllerBase.resultado');

  @override
  double get resultado {
    _$resultadoAtom.reportRead();
    return super.resultado;
  }

  @override
  set resultado(double value) {
    _$resultadoAtom.reportWrite(value, super.resultado, () {
      super.resultado = value;
    });
  }

  final _$iniciarAsyncAction = AsyncAction('HomeControllerBase.iniciar');

  @override
  Future<void> iniciar() {
    return _$iniciarAsyncAction.run(() => super.iniciar());
  }

  final _$getListaMoedasAsyncAction =
      AsyncAction('HomeControllerBase.getListaMoedas');

  @override
  Future getListaMoedas() {
    return _$getListaMoedasAsyncAction.run(() => super.getListaMoedas());
  }

  final _$getListaMoedasDesejadaAsyncAction =
      AsyncAction('HomeControllerBase.getListaMoedasDesejada');

  @override
  Future getListaMoedasDesejada() {
    return _$getListaMoedasDesejadaAsyncAction
        .run(() => super.getListaMoedasDesejada());
  }

  final _$fetchAPIAsyncAction = AsyncAction('HomeControllerBase.fetchAPI');

  @override
  Future<Rates> fetchAPI(dynamic moeda) {
    return _$fetchAPIAsyncAction.run(() => super.fetchAPI(moeda));
  }

  final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase');

  @override
  dynamic resetLista() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.resetLista');
    try {
      return super.resetLista();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTipoMoeda(dynamic valor) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setTipoMoeda');
    try {
      return super.setTipoMoeda(valor);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMoedaOrigem(dynamic valor) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setMoedaOrigem');
    try {
      return super.setMoedaOrigem(valor);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMoedaDestino(dynamic valor) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setMoedaDestino');
    try {
      return super.setMoedaDestino(valor);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTipoMoedaDesejada(dynamic valor) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setTipoMoedaDesejada');
    try {
      return super.setTipoMoedaDesejada(valor);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValorParaConversao(dynamic valor) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setValorParaConversao');
    try {
      return super.setValorParaConversao(valor);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double converter() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.converter');
    try {
      return super.converter();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valorTipoMoeda: ${valorTipoMoeda},
valorMoedaDesejada: ${valorMoedaDesejada},
moedaOrigem: ${moedaOrigem},
moedaDestino: ${moedaDestino},
valor: ${valor},
rates: ${rates},
valorParaConversao: ${valorParaConversao},
resultado: ${resultado}
    ''';
  }
}
