import 'package:cotacao_moedas_internacionais/models/cotacao_model.dart';
import 'package:cotacao_moedas_internacionais/services/cotacao_service.dart';
import 'package:get/get.dart';

class ListCurrenciesController extends GetxController {
  CotacaoService cotacaoService = CotacaoService();

  var isLoading = false.obs;

  var listCurrenciesObs = <CotacaoModel>[].obs;

  static ListCurrenciesController get listCurrencies => Get.find();

  Future<dynamic> listCurrenciesAsync() async {
    isLoading.value = true;
    var list = await cotacaoService.fetchListCurrenciesModel();
    listCurrenciesObs.value = list.listCurrenciesModel;
    isLoading.value = false;
    return listCurrenciesObs;
  }
}
