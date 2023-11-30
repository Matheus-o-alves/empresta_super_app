import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:empresta_super_app/data/models/institution_model.dart';

class RemoteInstitution {
  Future<List<InstitutionModel>> fetchInstitutions() async {
    try {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/instituicao'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List<dynamic>;
        return jsonData
            .map((institution) => InstitutionModel.fromJson(institution))
            .toList();
      } else {
        throw Exception(
            'Erro ao buscar instituições. Código de resposta: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao buscar instituições: $e');
    }
  }
}
