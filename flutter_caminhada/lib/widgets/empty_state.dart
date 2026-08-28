import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    Color cor = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          Icon(Icons.directions_walk, size: 60, color: cor),
          const SizedBox(height: 16),
          const Text(
            'Nenhuma caminhada registrada ainda.',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Clique no botão + para registrar sua primeira caminhada.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.cinza),
          ),
        ],
      ),
    );
  }
}
