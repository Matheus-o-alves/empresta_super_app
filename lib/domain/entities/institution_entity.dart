class InstitutionEntity {
  final String chave;
  final String valor;

  InstitutionEntity({
    required this.chave,
    required this.valor,
  });

  factory InstitutionEntity.fromJson(Map<String, dynamic> json) {
    return InstitutionEntity(
      chave: json['chave'],
      valor: json['valor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chave': chave,
      'valor': valor,
    };
  }
}
