class SimulationModelResponseEntity {
  final String institution;
  final double requestedValue;
  final String installmentXValue;
  final String interestRate;

  SimulationModelResponseEntity({
    required this.institution,
    required this.requestedValue,
    required this.installmentXValue,
    required this.interestRate,
  });

  factory SimulationModelResponseEntity.fromJson(Map<String, dynamic> json) {
    return SimulationModelResponseEntity(
      institution: json['instituicao'],
      requestedValue: json['valor_solicitado'].toDouble(),
      installmentXValue: json['parcelas_x_valor'],
      interestRate: json['taxa_juros'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instituicao': institution,
      'valor_solicitado': requestedValue,
      'parcelas_x_valor': installmentXValue,
      'taxa_juros': interestRate,
    };
  }
}
