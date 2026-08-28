import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/caminhada.dart';

class CaminhadaForm extends StatefulWidget {
  final Caminhada? caminhadaExistente;
  final Function(Caminhada) aoSalvar;

  const CaminhadaForm({
    super.key,
    this.caminhadaExistente,
    required this.aoSalvar,
  });

  @override
  State<CaminhadaForm> createState() => _CaminhadaFormState();
}

class _CaminhadaFormState extends State<CaminhadaForm> {
  final formKey = GlobalKey<FormState>();
  final formatoData = DateFormat('dd/MM/yyyy');

  late TextEditingController dataController;
  late TextEditingController partidaController;
  late TextEditingController chegadaController;
  late TextEditingController distanciaController;
  late TextEditingController pesoController;

  bool get editando => widget.caminhadaExistente != null;

  @override
  void initState() {
    super.initState();
    Caminhada? c = widget.caminhadaExistente;

    dataController = TextEditingController(text: c?.data ?? '');
    partidaController = TextEditingController(text: c?.partida ?? '');
    chegadaController = TextEditingController(text: c?.chegada ?? '');
    distanciaController = TextEditingController(text: c != null ? c.distanciaEmKm.toString() : '');
    pesoController = TextEditingController(text: c != null ? c.pesoAtualKg.toString() : '');
  }

  Future<void> escolherData() async {
    DateTime? dataEscolhida = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2100),
    );
    if (dataEscolhida != null) {
      setState(() {
        dataController.text = formatoData.format(dataEscolhida);
      });
    }
  }

  void salvar() {
    if (!formKey.currentState!.validate()) return;

    double distancia = double.parse(distanciaController.text.replaceAll(',', '.'));
    double peso = double.parse(pesoController.text.replaceAll(',', '.'));

    Caminhada novaCaminhada = Caminhada(
      id: widget.caminhadaExistente?.id ?? const Uuid().v4(),
      data: dataController.text,
      partida: partidaController.text,
      chegada: chegadaController.text,
      distanciaEmKm: distancia,
      pesoAtualKg: peso,
    );

    widget.aoSalvar(novaCaminhada);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                editando ? 'Editar caminhada' : 'Nova caminhada',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: dataController,
                readOnly: true,
                onTap: escolherData,
                decoration: const InputDecoration(labelText: 'Data'),
                validator: (valor) => valor == null || valor.isEmpty ? 'Escolha uma data' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: partidaController,
                decoration: const InputDecoration(labelText: 'Local de partida'),
                validator: (valor) => valor == null || valor.isEmpty ? 'Informe o local de partida' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: chegadaController,
                decoration: const InputDecoration(labelText: 'Local de chegada'),
                validator: (valor) => valor == null || valor.isEmpty ? 'Informe o local de chegada' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: distanciaController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Distância (km)'),
                validator: (valor) {
                  double? numero = double.tryParse((valor ?? '').replaceAll(',', '.'));
                  if (numero == null) return 'Digite uma distância válida';
                  if (numero <= 0) return 'A distância deve ser maior que zero';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: pesoController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Peso atual (kg)'),
                validator: (valor) {
                  double? numero = double.tryParse((valor ?? '').replaceAll(',', '.'));
                  if (numero == null) return 'Digite um peso válido';
                  if (numero <= 0) return 'O peso deve ser maior que zero';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: salvar,
                child: Text(editando ? 'Salvar alterações' : 'Salvar caminhada'),
              ),
              if (editando)
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
