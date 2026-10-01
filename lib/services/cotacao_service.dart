import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cotacao_moedas_internacionais/models/list_currencies_model.dart';

class CotacaoService {
  String url = "https://blockchain.info/ticker";
  dynamic _response;

  CotacaoService() {
    _response = "";
  }

  Future<ListCurrenciesModel> fetchListCurrenciesModel() async {
    _response = await http.get(Uri.parse(url));
    if (_response.statusCode == 200) {
      Map<String, dynamic> retorno = jsonDecode(_response.body);
      return ListCurrenciesModel.fromJson(retorno);
    } else {
      throw Exception('Falhou ao Carregar!!!');
    }
  }
}
