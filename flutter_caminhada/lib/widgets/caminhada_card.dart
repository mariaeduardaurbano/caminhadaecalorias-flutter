import 'package:flutter/material.dart';
import '../models/caminhada.dart';

class CaminhadaCard extends StatelessWidget {
  final Caminhada caminhada;
  final VoidCallback aoTocar;
  final VoidCallback aoExcluir;

  const CaminhadaCard({
    super.key,
    required this.caminhada,
    required this.aoTocar,
    required this.aoExcluir,
  });

  @override
  Widget build(BuildContext context) {
    double calorias = caminhada.caloriasGastas;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        onTap: aoTocar,
        contentPadding: const EdgeInsets.all(12),
        title: Text(
          caminhada.data,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${caminhada.partida} → ${caminhada.chegada}'),
              const SizedBox(height: 4),
              Text('${caminhada.distanciaEmKm} km   •   ${caminhada.pesoAtualKg} kg'),
              const SizedBox(height: 4),
              Text(
                '${calorias.toStringAsFixed(1)} kcal',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: aoExcluir,
        ),
      ),
    );
  }
}
