import 'package:cotacao_moedas_internacionais/components/PaisCotacaoCard.dart';
import 'package:cotacao_moedas_internacionais/controllers/list_currencies_controller.dart';
import 'package:cotacao_moedas_internacionais/screens/price_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money2/money2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = ListCurrenciesController.listCurrencies;

  @override
  void initState() {
    super.initState();
    controller.listCurrenciesAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Obx(() => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: controller.listCurrenciesObs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            Get.to(PriceDetailsPage(
                                cotacaoModel:
                                    controller.listCurrenciesObs[index]));
                          },
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: PaisCotacaoCard(
                                image:
                                    'assets/imagens_moedas/${controller.listCurrenciesObs[index].symbol}.png',
                                width: 50),
                          ),
                          title: Text(Money.fromNum(
                                  controller.listCurrenciesObs[index].buy,
                                  isoCode: controller
                                      .listCurrenciesObs[index].symbol)
                              .toString()),
                          trailing: Icon(Icons.chevron_right),
                        ),
                      );
                    }),
              )));
  }
}
