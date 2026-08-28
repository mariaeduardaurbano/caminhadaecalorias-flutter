import 'package:flutter/material.dart';
import 'services/storage_service.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const CaminhadasApp());
}

class CaminhadasApp extends StatefulWidget {
  const CaminhadasApp({super.key});

  @override
  State<CaminhadasApp> createState() => _CaminhadasAppState();
}

class _CaminhadasAppState extends State<CaminhadasApp> {
  final StorageService storageService = StorageService();
  bool modoEscuro = false;
  bool carregado = false;

  @override
  void initState() {
    super.initState();
    carregarTema();
  }

  void carregarTema() async {
    bool valorSalvo = await storageService.carregarTema();
    setState(() {
      modoEscuro = valorSalvo;
      carregado = true;
    });
  }

  void alternarTema() async {
    setState(() {
      modoEscuro = !modoEscuro;
    });
    await storageService.salvarTema(modoEscuro);
  }

  @override
  Widget build(BuildContext context) {
    if (!carregado) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caminhadas x Calorias',
      theme: temaClaro,
      darkTheme: temaEscuro,
      themeMode: modoEscuro ? ThemeMode.dark : ThemeMode.light,
      home: SplashScreen(
        modoEscuro: modoEscuro,
        alternarTema: alternarTema,
      ),
    );
  }
}
