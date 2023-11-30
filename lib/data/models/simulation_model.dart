class SimulationModelResponse {
  final String institution;
  final double requestedValue;
  final String installmentXValue;
  final String interestRate;

  SimulationModelResponse({
    required this.institution,
    required this.requestedValue,
    required this.installmentXValue,
    required this.interestRate,
  });

  factory SimulationModelResponse.fromJson(Map<String, dynamic> json) {
    return SimulationModelResponse(
      institution: json['instituicao'],
      requestedValue: json['valor_solicitado'],
      installmentXValue: json['parcelas_x_valor'],
      interestRate: json['taxa_juros'],
    );
  }
}
