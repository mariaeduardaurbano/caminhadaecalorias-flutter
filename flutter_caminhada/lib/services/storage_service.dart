import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/caminhada.dart';

class StorageService {
  static const chaveCaminhadas = 'caminhadas';
  static const chaveTema = 'tema_escuro';

  Future<void> salvarCaminhadas(List<Caminhada> caminhadas) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> listaJson = caminhadas.map((c) => c.toJson()).toList();
    await prefs.setString(chaveCaminhadas, jsonEncode(listaJson));
  }

  Future<List<Caminhada>> carregarCaminhadas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? textoJson = prefs.getString(chaveCaminhadas);
    if (textoJson == null) return [];

    List<dynamic> lista = jsonDecode(textoJson);
    return lista.map((item) => Caminhada.fromJson(item)).toList();
  }

  Future<void> salvarTema(bool temaEscuro) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(chaveTema, temaEscuro);
  }

  Future<bool> carregarTema() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(chaveTema) ?? false;
  }
}
