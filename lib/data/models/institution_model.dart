class InstitutionModel {
  String chave;
  String valor;

  InstitutionModel({
    required this.chave,
    required this.valor,
  });

  factory InstitutionModel.fromJson(Map<String, dynamic> json) {
    return InstitutionModel(
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
