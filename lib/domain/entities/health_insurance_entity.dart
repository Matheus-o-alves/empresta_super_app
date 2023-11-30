class HealthInsuranceEntity {
  final String chave;
  final String valor;

  HealthInsuranceEntity({required this.chave, required this.valor});

  factory HealthInsuranceEntity.fromJson(Map<String, dynamic> json) {
    return HealthInsuranceEntity(
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
