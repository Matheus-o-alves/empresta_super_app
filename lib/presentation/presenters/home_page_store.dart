import 'package:empresta_super_app/data/models/health_insurance_model.dart';
import 'package:empresta_super_app/data/models/institution_model.dart';
import 'package:empresta_super_app/data/usecases/remote_health_insurance_model.dart';
import 'package:empresta_super_app/data/usecases/remote_institution.dart';
import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore with Store {
  final RemoteHealthInsurance remoteHealthInsurance;
  final RemoteInstitution remoteInstitution;

  _HomePageStore(this.remoteHealthInsurance, this.remoteInstitution) {
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
    loanValue = value;
  }
}
