// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on _HomePageStore, Store {
  late final _$healthInsurancesAtom =
      Atom(name: '_HomePageStore.healthInsurances', context: context);

  @override
  ObservableList<HealthInsuranceModel> get healthInsurances {
    _$healthInsurancesAtom.reportRead();
    return super.healthInsurances;
  }

  @override
  set healthInsurances(ObservableList<HealthInsuranceModel> value) {
    _$healthInsurancesAtom.reportWrite(value, super.healthInsurances, () {
      super.healthInsurances = value;
    });
  }

  late final _$selectedInsurancesAtom =
      Atom(name: '_HomePageStore.selectedInsurances', context: context);

  @override
  ObservableList<HealthInsuranceModel> get selectedInsurances {
    _$selectedInsurancesAtom.reportRead();
    return super.selectedInsurances;
  }

  @override
  set selectedInsurances(ObservableList<HealthInsuranceModel> value) {
    _$selectedInsurancesAtom.reportWrite(value, super.selectedInsurances, () {
      super.selectedInsurances = value;
    });
  }

  late final _$institutionsAtom =
      Atom(name: '_HomePageStore.institutions', context: context);

  @override
  ObservableList<InstitutionModel> get institutions {
    _$institutionsAtom.reportRead();
    return super.institutions;
  }

  @override
  set institutions(ObservableList<InstitutionModel> value) {
    _$institutionsAtom.reportWrite(value, super.institutions, () {
      super.institutions = value;
    });
  }

  late final _$selectedInstitutionsAtom =
      Atom(name: '_HomePageStore.selectedInstitutions', context: context);

  @override
  ObservableList<InstitutionModel> get selectedInstitutions {
    _$selectedInstitutionsAtom.reportRead();
    return super.selectedInstitutions;
  }

  @override
  set selectedInstitutions(ObservableList<InstitutionModel> value) {
    _$selectedInstitutionsAtom.reportWrite(value, super.selectedInstitutions,
        () {
      super.selectedInstitutions = value;
    });
  }

  late final _$installmentsAtom =
      Atom(name: '_HomePageStore.installments', context: context);

  @override
  ObservableList<int> get installments {
    _$installmentsAtom.reportRead();
    return super.installments;
  }

  @override
  set installments(ObservableList<int> value) {
    _$installmentsAtom.reportWrite(value, super.installments, () {
      super.installments = value;
    });
  }

  late final _$installmentsSelectedAtom =
      Atom(name: '_HomePageStore.installmentsSelected', context: context);

  @override
  ObservableList<int> get installmentsSelected {
    _$installmentsSelectedAtom.reportRead();
    return super.installmentsSelected;
  }

  @override
  set installmentsSelected(ObservableList<int> value) {
    _$installmentsSelectedAtom.reportWrite(value, super.installmentsSelected,
        () {
      super.installmentsSelected = value;
    });
  }

  late final _$loanValueAtom =
      Atom(name: '_HomePageStore.loanValue', context: context);

  @override
  String get loanValue {
    _$loanValueAtom.reportRead();
    return super.loanValue;
  }

  @override
  set loanValue(String value) {
    _$loanValueAtom.reportWrite(value, super.loanValue, () {
      super.loanValue = value;
    });
  }

  late final _$simulationDataAtom =
      Atom(name: '_HomePageStore.simulationData', context: context);

  @override
  List<SimulationModelResponse>? get simulationData {
    _$simulationDataAtom.reportRead();
    return super.simulationData;
  }

  @override
  set simulationData(List<SimulationModelResponse>? value) {
    _$simulationDataAtom.reportWrite(value, super.simulationData, () {
      super.simulationData = value;
    });
  }

  late final _$fetchHealthInsurancesAsyncAction =
      AsyncAction('_HomePageStore.fetchHealthInsurances', context: context);

  @override
  Future<void> fetchHealthInsurances() {
    return _$fetchHealthInsurancesAsyncAction
        .run(() => super.fetchHealthInsurances());
  }

  late final _$fetchInstitutionsAsyncAction =
      AsyncAction('_HomePageStore.fetchInstitutions', context: context);

  @override
  Future<void> fetchInstitutions() {
    return _$fetchInstitutionsAsyncAction.run(() => super.fetchInstitutions());
  }

  late final _$fetchInstalmentAsyncAction =
      AsyncAction('_HomePageStore.fetchInstalment', context: context);

  @override
  Future<void> fetchInstalment() {
    return _$fetchInstalmentAsyncAction.run(() => super.fetchInstalment());
  }

  late final _$sendSimulationDataAsyncAction =
      AsyncAction('_HomePageStore.sendSimulationData', context: context);

  @override
  Future<void> sendSimulationData() {
    return _$sendSimulationDataAsyncAction
        .run(() => super.sendSimulationData());
  }

  late final _$_HomePageStoreActionController =
      ActionController(name: '_HomePageStore', context: context);

  @override
  void toggleInsuranceSelection(HealthInsuranceModel insurance) {
    final _$actionInfo = _$_HomePageStoreActionController.startAction(
        name: '_HomePageStore.toggleInsuranceSelection');
    try {
      return super.toggleInsuranceSelection(insurance);
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleInstitutionSelection(InstitutionModel insurance) {
    final _$actionInfo = _$_HomePageStoreActionController.startAction(
        name: '_HomePageStore.toggleInstitutionSelection');
    try {
      return super.toggleInstitutionSelection(insurance);
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleInstallmentsSelection(int installments) {
    final _$actionInfo = _$_HomePageStoreActionController.startAction(
        name: '_HomePageStore.toggleInstallmentsSelection');
    try {
      return super.toggleInstallmentsSelection(installments);
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateLoanValue(String value) {
    final _$actionInfo = _$_HomePageStoreActionController.startAction(
        name: '_HomePageStore.updateLoanValue');
    try {
      return super.updateLoanValue(value);
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
healthInsurances: ${healthInsurances},
selectedInsurances: ${selectedInsurances},
institutions: ${institutions},
selectedInstitutions: ${selectedInstitutions},
installments: ${installments},
installmentsSelected: ${installmentsSelected},
loanValue: ${loanValue},
simulationData: ${simulationData}
    ''';
  }
}
