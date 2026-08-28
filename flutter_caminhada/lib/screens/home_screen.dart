import 'package:flutter/material.dart';
import '../models/caminhada.dart';
import '../services/storage_service.dart';
import '../widgets/caminhada_card.dart';
import '../widgets/caminhada_form.dart';
import '../widgets/caminhadas_chart.dart';
import '../widgets/empty_state.dart';

class HomeScreen extends StatefulWidget {
  final bool modoEscuro;
  final VoidCallback alternarTema;

  const HomeScreen({
    super.key,
    required this.modoEscuro,
    required this.alternarTema,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StorageService storageService = StorageService();
  List<Caminhada> caminhadas = [];
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    carregarCaminhadas();
  }

  void carregarCaminhadas() async {
    List<Caminhada> lista = await storageService.carregarCaminhadas();
    setState(() {
      caminhadas = lista;
      carregando = false;
    });
  }

  void salvarLista() async {
    await storageService.salvarCaminhadas(caminhadas);
  }

  void abrirFormulario({Caminhada? caminhadaExistente}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return CaminhadaForm(
          caminhadaExistente: caminhadaExistente,
          aoSalvar: (caminhada) {
            setState(() {
              if (caminhadaExistente != null) {
                int indice = caminhadas.indexWhere((c) => c.id == caminhada.id);
                caminhadas[indice] = caminhada;
              } else {
                caminhadas.add(caminhada);
              }
            });
            salvarLista();
          },
        );
      },
    );
  }

  void excluirCaminhada(Caminhada caminhada) async {
    bool? confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir caminhada'),
        content: const Text('Deseja realmente excluir esta caminhada?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Excluir', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmar == true) {
      setState(() {
        caminhadas.removeWhere((c) => c.id == caminhada.id);
      });
      salvarLista();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.directions_walk, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            const Text('Caminhadas'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: widget.alternarTema,
            icon: Icon(widget.modoEscuro ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => abrirFormulario(),
        child: const Icon(Icons.add),
      ),
      body: carregando
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (caminhadas.isEmpty)
                  const EmptyState()
                else
                  for (var caminhada in caminhadas)
                    CaminhadaCard(
                      caminhada: caminhada,
                      aoTocar: () => abrirFormulario(caminhadaExistente: caminhada),
                      aoExcluir: () => excluirCaminhada(caminhada),
                    ),
                const SizedBox(height: 20),
                const Text(
                  'Comparativo das Caminhadas',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                if (caminhadas.isEmpty)
                  const Text('Cadastre suas caminhadas para acompanhar seu desempenho.')
                else
                  CaminhadasChart(caminhadas: caminhadas),
              ],
            ),
    );
  }
}
