import 'dart:convert';
import 'package:empresta_super_app/data/models/simulation_model.dart';
import 'package:http/http.dart' as http;

class RemoteSimulation {
  Future<List<SimulationModelResponse>> simulateLoan(
    double loanValue,
    List<String> institutions,
    List<String> healthInsurances,
    int installments,
  ) async {
    const String baseUrl = 'HOST'; // Substitua pelo seu host
    final Uri url = Uri.parse('$baseUrl/api/simular');

    Map<String, dynamic> payload = {
      'valor_emprestimo': loanValue,
      'instituicoes': institutions,
      'convenios': healthInsurances,
      'parcela': installments,
    };

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.body);

        List<SimulationModelResponse> simulations = responseData
            .map((simulation) => SimulationModelResponse.fromJson(simulation))
            .toList();

        return simulations;
      } else {
        throw Exception('Erro ao simular empréstimo: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro na requisição de simulação: $e');
    }
  }
}
