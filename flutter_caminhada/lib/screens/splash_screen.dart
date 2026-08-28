import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  final bool modoEscuro;
  final VoidCallback alternarTema;

  const SplashScreen({
    super.key,
    required this.modoEscuro,
    required this.alternarTema,
  });

  @override
  Widget build(BuildContext context) {
    Color corPrimaria = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      modoEscuro ? Icons.dark_mode : Icons.light_mode,
                      color: AppColors.cinza,
                    ),
                    Switch(
                      value: modoEscuro,
                      activeColor: corPrimaria,
                      onChanged: (valor) => alternarTema(),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 3),
              CircleAvatar(
                radius: 55,
                backgroundColor: corPrimaria.withOpacity(0.2),
                child: Icon(Icons.directions_walk, size: 60, color: corPrimaria),
              ),
              const SizedBox(height: 24),
              const Text(
                'Caminhadas x Calorias',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Registre suas caminhadas e acompanhe\nas calorias gastas',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.cinza),
              ),
              const Spacer(flex: 4),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          modoEscuro: modoEscuro,
                          alternarTema: alternarTema,
                        ),
                      ),
                    );
                  },
                  child: const Text('Entrar'),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
