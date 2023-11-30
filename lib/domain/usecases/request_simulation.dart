import 'package:empresta_super_app/domain/entities/simulation_entity.dart';

abstract class SimulationUseCase {
  Future<List<SimulationModelResponseEntity>> simulateLoan(
    double loanValue,
    List<String> institutions,
    List<String> healthInsurances,
    int installments,
  );
}
