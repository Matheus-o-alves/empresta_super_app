import 'dart:convert';
import 'package:empresta_super_app/data/models/health_insurance_model.dart';
import 'package:http/http.dart' as http;

class RemoteHealthInsurance {
  Future<List<HealthInsuranceModel>> fetchConvenios() async {
    try {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/convenio'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData
            .map((convenio) => HealthInsuranceModel.fromJson(convenio))
            .toList();
      } else {
        throw Exception(
            'Falha ao carregar os convênios. Código de resposta: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao buscar convenio: $e');
    }
  }
}
