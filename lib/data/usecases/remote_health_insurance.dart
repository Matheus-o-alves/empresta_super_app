import 'dart:convert';
import 'package:empresta_super_app/data/models/health_insurance_model.dart';
import 'package:empresta_super_app/domain/entities/health_insurance_entity.dart';
import 'package:empresta_super_app/domain/usecases/request_health_insurance.dart';
import 'package:http/http.dart' as http;

class RemoteHealthInsuranceImpl implements HealthInsuranceUseCase {
  @override
  Future<List<HealthInsuranceEntity>> fetchConvenios() async {
    const String baseUrl = "HOST"; // Substitua pelo seu host
    final Uri url = Uri.parse('$baseUrl/api/convenio');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData
            .map((convenio) =>
                _mapToEntity(HealthInsuranceModel.fromJson(convenio)))
            .toList();
      } else {
        throw Exception(
            'Falha ao carregar os convênios. Código de resposta: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao buscar convenio: $e');
    }
  }

  HealthInsuranceEntity _mapToEntity(HealthInsuranceModel model) {
    return HealthInsuranceEntity(
      chave: model.chave,
      valor: model.valor,
    );
  }
}
