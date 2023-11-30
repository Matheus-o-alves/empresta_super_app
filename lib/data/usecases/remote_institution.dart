import 'package:empresta_super_app/domain/entities/institution_entity.dart';
import 'package:empresta_super_app/domain/usecases/request_institution.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteInstitutionImpl implements InstitutionUseCase {
  @override
  Future<List<InstitutionEntity>> fetchInstitutions() async {
    const String baseUrl = "HOST"; // Substitua pelo seu host
    final Uri url = Uri.parse('$baseUrl/api/instituicao');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<InstitutionEntity> institutions =
            jsonData.map((item) => InstitutionEntity.fromJson(item)).toList();
        return institutions;
      } else {
        throw Exception(
            'Erro ao buscar instituições. Código de resposta: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao buscar instituições: $e');
    }
  }
}
