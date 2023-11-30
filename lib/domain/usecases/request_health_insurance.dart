import 'package:empresta_super_app/domain/entities/health_insurance_entity.dart';

abstract class HealthInsuranceUseCase {
  Future<List<HealthInsuranceEntity>> fetchConvenios();
}
