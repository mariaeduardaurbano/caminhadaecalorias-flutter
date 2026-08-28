import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/caminhada.dart';

// Gráfico de barras simples mostrando as calorias de cada caminhada
class CaminhadasChart extends StatelessWidget {
  final List<Caminhada> caminhadas;

  const CaminhadasChart({super.key, required this.caminhadas});

  @override
  Widget build(BuildContext context) {
    Color cor = Theme.of(context).colorScheme.primary;

    double maiorCaloria = 0;
    for (var c in caminhadas) {
      if (c.caloriasGastas > maiorCaloria) maiorCaloria = c.caloriasGastas;
    }

    List<BarChartGroupData> barras = [];
    for (int i = 0; i < caminhadas.length; i++) {
      barras.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: caminhadas[i].caloriasGastas,
              color: cor,
              width: 16,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          maxY: maiorCaloria * 1.3,
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 34),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (valor, meta) {
                  int i = valor.toInt();
                  if (i < 0 || i >= caminhadas.length) return const SizedBox();
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text('Cam. ${i + 1}', style: const TextStyle(fontSize: 10)),
                  );
                },
              ),
            ),
          ),
          barGroups: barras,
        ),
      ),
    );
  }
}
