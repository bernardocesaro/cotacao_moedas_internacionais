import 'package:cotacao_moedas_internacionais/controllerBinding.dart';
import 'package:flutter/material.dart';
import 'package:cotacao_moedas_internacionais/screens/home_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  ControllerBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cotador de Moedas Internacionais',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Página Inicial'),
    );
  }
}
