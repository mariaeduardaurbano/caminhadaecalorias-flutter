# 🚶 Controle de Caminhadas

Aplicativo desenvolvido em Flutter para registrar e acompanhar o histórico de caminhadas.

## 📱 Sobre o projeto

O aplicativo permite cadastrar caminhadas e acompanhar informações como a distância percorrida e a quantidade aproximada de calorias gastas.

Os dados das caminhadas são armazenados localmente no dispositivo.

## ✨ Funcionalidades

- Cadastro de caminhadas
- Edição de registros
- Exclusão de registros
- Cálculo de calorias gastas
- Histórico de caminhadas
- Gráfico comparativo das caminhadas
- Tema claro e escuro
- Armazenamento local dos dados

## 🧮 Cálculo de calorias

O gasto calórico médio é calculado considerando **0,7 calorias por quilo corporal e por quilômetro percorrido**.

A fórmula utilizada é:

`Peso atual × Distância percorrida × 0,7`

**Exemplo:**

Se uma pessoa pesa 70 kg e percorre 5 km:

`70 × 5 × 0,7 = 245 calorias`

## 🛠️ Tecnologias utilizadas

- Flutter
- Dart
- SharedPreferences
- FL Chart

## ▶️ Como executar o projeto

1. Clone este repositório:

    git clone <link-do-repositorio>

2. Entre na pasta do projeto:

    cd nome-do-projeto

3. Instale as dependências:

    flutter pub get

4. Execute o aplicativo:

    flutter run

## 📂 Estrutura do projeto

    lib/
    ├── main.dart
    ├── models/
    ├── screens/
    ├── services/
    └── widgets/

## 🎨 Interface

O aplicativo utiliza principalmente tons de **rosa-queimado e rosa-claro**, criando uma interface leve, agradável e relacionada ao tema de caminhadas e bem-estar.

## 👩‍💻 Desenvolvido por Maria Eduarda Urbano

Projeto desenvolvido como atividade de aprendizado utilizando Flutter.
