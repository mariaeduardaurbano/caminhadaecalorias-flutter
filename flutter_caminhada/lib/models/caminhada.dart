class Caminhada {
  final String id;
  final String data; // formato dd/MM/yyyy
  final String partida;
  final String chegada;
  final double distanciaEmKm;
  final double pesoAtualKg;

  Caminhada({
    required this.id,
    required this.data,
    required this.partida,
    required this.chegada,
    required this.distanciaEmKm,
    required this.pesoAtualKg,
  });

  // calorias = 0.7 * peso * distancia
  double get caloriasGastas => 0.7 * pesoAtualKg * distanciaEmKm;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'data': data,
      'partida': partida,
      'chegada': chegada,
      'distanciaEmKm': distanciaEmKm,
      'pesoAtualKg': pesoAtualKg,
    };
  }

  factory Caminhada.fromJson(Map<String, dynamic> json) {
    return Caminhada(
      id: json['id'],
      data: json['data'],
      partida: json['partida'],
      chegada: json['chegada'],
      distanciaEmKm: json['distanciaEmKm'].toDouble(),
      pesoAtualKg: json['pesoAtualKg'].toDouble(),
    );
  }
}
