import 'package:empresta_super_app/domain/entities/institution_entity.dart';

abstract class InstitutionUseCase {
  Future<List<InstitutionEntity>> fetchInstitutions();
}
