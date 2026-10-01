import 'package:cotacao_moedas_internacionais/components/PaisCotacaoCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';
import '../models/cotacao_model.dart';

class PriceDetailsPage extends StatefulWidget {
  PriceDetailsPage({super.key, required this.cotacaoModel});

  final CotacaoModel cotacaoModel;

  @override
  _PriceDetailPageState createState() => _PriceDetailPageState();
}

class _PriceDetailPageState extends State<PriceDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
      ),
      body: Container(
        child: Column(
          children: [
            PaisCotacaoCard(
              image: "assets/imagens_moedas/${widget.cotacaoModel.symbol}.png",
              width: 50,
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text("Compra"),
                    leading: Text(widget.cotacaoModel.symbol),
                    trailing: Text(Money.fromNum(widget.cotacaoModel.buy,
                            isoCode: widget.cotacaoModel.symbol)
                        .toString()),
                  ),
                  ListTile(
                    title: Text("Venda"),
                    leading: Text(widget.cotacaoModel.symbol),
                    trailing: Text(Money.fromNum(widget.cotacaoModel.sell,
                        isoCode: widget.cotacaoModel.symbol)
                        .toString()),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
