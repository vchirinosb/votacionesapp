class Partido {
  final String id;
  final String nombre;
  final String representante;
  final String logoUrl;
  final int votos;

  Partido({
    required this.id,
    required this.nombre,
    required this.representante,
    required this.logoUrl,
    required this.votos,
  });

  factory Partido.fromMap(Map<String, dynamic> data, String documentId) {
    return Partido(
      id: documentId,
      nombre: data['nombre'],
      representante: data['representante'],
      logoUrl: data['logoUrl'],
      votos: data['votos'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'representante': representante,
      'logoUrl': logoUrl,
      'votos': votos,
    };
  }
}
