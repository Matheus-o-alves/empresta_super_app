import 'package:empresta_super_app/data/models/health_insurance_model.dart';
import 'package:empresta_super_app/data/models/institution_model.dart';
import 'package:empresta_super_app/data/models/simulation_model.dart';
import 'package:empresta_super_app/data/usecases/remote_health_insurance.dart';
import 'package:empresta_super_app/data/usecases/remote_institution.dart';
import 'package:empresta_super_app/data/usecases/remote_simulation.dart';
import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore with Store {
  final RemoteHealthInsurance remoteHealthInsurance;
  final RemoteInstitution remoteInstitution;
  final RemoteSimulation remoteSimulation;

  _HomePageStore(this.remoteHealthInsurance, this.remoteInstitution,
      this.remoteSimulation) {
    fetchHealthInsurances();
    fetchInstitutions();
    fetchInstalment();
  }

  @observable
  ObservableList<HealthInsuranceModel> healthInsurances =
      ObservableList<HealthInsuranceModel>();

  @observable
  ObservableList<HealthInsuranceModel> selectedInsurances =
      ObservableList<HealthInsuranceModel>();

  @observable
  ObservableList<InstitutionModel> institutions =
      ObservableList<InstitutionModel>();

  @observable
  ObservableList<InstitutionModel> selectedInstitutions =
      ObservableList<InstitutionModel>();

  @observable
  ObservableList<int> installments = ObservableList<int>();

  @observable
  ObservableList<int> installmentsSelected = ObservableList<int>();

  @observable
  String loanValue = '';

  @observable
  List<SimulationModelResponse>? simulationData;

  @action
  Future<void> fetchHealthInsurances() async {
    try {
      final List<HealthInsuranceModel> fetchedInsurances =
          await remoteHealthInsurance.fetchConvenios();

      healthInsurances.clear();
      healthInsurances.addAll(fetchedInsurances);
    } catch (e) {
      throw Exception('Erro ao buscar convênios: $e');
    }
  }

  @action
  void toggleInsuranceSelection(HealthInsuranceModel insurance) {
    if (selectedInsurances.contains(insurance)) {
      selectedInsurances.remove(insurance);
    } else {
      selectedInsurances.add(insurance);
    }
  }

  @action
  Future<void> fetchInstitutions() async {
    try {
      final List<InstitutionModel> fetchedInstitutions =
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
  void toggleInstitutionSelection(InstitutionModel insurance) {
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
          installmentsSelected[
              0], // Considere apenas o primeiro valor das parcelas selecionadas (pode ser alterado conforme a lógica necessária)
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
