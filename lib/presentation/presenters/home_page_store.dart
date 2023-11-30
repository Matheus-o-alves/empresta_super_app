import 'package:empresta_super_app/data/usecases/remote_health_insurance.dart';
import 'package:empresta_super_app/data/usecases/remote_institution.dart';
import 'package:empresta_super_app/data/usecases/remote_simulation.dart';
import 'package:empresta_super_app/domain/entities/health_insurance_entity.dart';
import 'package:empresta_super_app/domain/entities/institution_entity.dart';
import 'package:empresta_super_app/domain/entities/simulation_entity.dart';
import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

// ignore: library_private_types_in_public_api
class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore with Store {
  final RemoteHealthInsuranceImpl remoteHealthInsurance;
  final RemoteInstitutionImpl remoteInstitution;
  final RemoteSimulationImpl remoteSimulation;

  _HomePageStore(this.remoteHealthInsurance, this.remoteInstitution,
      this.remoteSimulation) {
    fetchHealthInsurances();
    fetchInstitutions();
    fetchInstalment();
  }

  @observable
  ObservableList<HealthInsuranceEntity> healthInsurances =
      ObservableList<HealthInsuranceEntity>();

  @observable
  ObservableList<HealthInsuranceEntity> selectedInsurances =
      ObservableList<HealthInsuranceEntity>();

  @observable
  ObservableList<InstitutionEntity> institutions =
      ObservableList<InstitutionEntity>();

  @observable
  ObservableList<InstitutionEntity> selectedInstitutions =
      ObservableList<InstitutionEntity>();

  @observable
  ObservableList<int> installments = ObservableList<int>();

  @observable
  ObservableList<int> installmentsSelected = ObservableList<int>();

  @observable
  String loanValue = '';

  @observable
  List<SimulationModelResponseEntity>? simulationData;

  @action
  Future<void> fetchHealthInsurances() async {
    try {
      final List<HealthInsuranceEntity> fetchedInsurances =
          await remoteHealthInsurance.fetchConvenios();

      healthInsurances.clear();
      healthInsurances.addAll(fetchedInsurances);
    } catch (e) {
      throw Exception('Erro ao buscar convênios: $e');
    }
  }

  @action
  void toggleInsuranceSelection(HealthInsuranceEntity insurance) {
    if (selectedInsurances.contains(insurance)) {
      selectedInsurances.remove(insurance);
    } else {
      selectedInsurances.add(insurance);
    }
  }

  @action
  Future<void> fetchInstitutions() async {
    try {
      final List<InstitutionEntity> fetchedInstitutions =
          await remoteInstitution.fetchInstitutions();

      institutions.clear();
      institutions.addAll(fetchedInstitutions);
    } catch (e) {
      throw Exception('Erro ao buscar instituições: $e');
    }
  }

  @action
  Future<void> fetchInstalment() async {
    List<int> values = [36, 48, 60, 72, 84];

    installments.addAll(values);
  }

  @action
  void toggleInstitutionSelection(InstitutionEntity insurance) {
    if (selectedInstitutions.contains(insurance)) {
      selectedInstitutions.remove(insurance);
    } else {
      selectedInstitutions.add(insurance);
    }
  }

  @action
  void toggleInstallmentsSelection(int installments) {
    if (installmentsSelected.contains(installments)) {
      installmentsSelected.remove(installments);
    } else {
      installmentsSelected.add(installments);
    }
  }

  @action
  void updateLoanValue(String value) {
    final clearedValue = value.replaceAll(RegExp(r'[^0-9]'), '');
    final doubleValue = double.parse(clearedValue) / 100;
    loanValue = doubleValue.toString();
  }

  @action
  Future<void> sendSimulationData() async {
    try {
      if (selectedInsurances.isNotEmpty &&
          selectedInstitutions.isNotEmpty &&
          installmentsSelected.isNotEmpty &&
          loanValue.isNotEmpty) {
        List<String> selectedInsuranceValues = selectedInsurances
            .map((insurance) => insurance.valor.toUpperCase())
            .toList();
        List<String> selectedInstitutionValues = selectedInstitutions
            .map((institution) => institution.valor.toUpperCase())
            .toList();

        simulationData = await remoteSimulation.simulateLoan(
          double.parse(loanValue),
          selectedInstitutionValues,
          selectedInsuranceValues,
          installmentsSelected[0],
        );
      } else {
        throw Exception(
            'Preencha todos os campos necessários para a simulação');
      }
    } catch (e) {
      throw Exception('Erro ao enviar dados para a simulação: $e');
    }
  }
}
