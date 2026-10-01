import 'package:flutter/cupertino.dart';

class PaisCotacaoCard extends StatelessWidget {
  const PaisCotacaoCard({super.key, required this.image, required this.width});

  final String image;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
          tag: image,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/imagens_moedas/not-found.png',
                fit: BoxFit.contain,
              );
            },
          )),
    );
  }
}
