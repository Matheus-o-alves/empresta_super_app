class HealthInsuranceModel {
  final String chave;
  final String valor;

  HealthInsuranceModel({required this.chave, required this.valor});

  factory HealthInsuranceModel.fromJson(Map<String, dynamic> json) {
    return HealthInsuranceModel(
      chave: json['chave'],
      valor: json['valor'],
    );
  }
}
