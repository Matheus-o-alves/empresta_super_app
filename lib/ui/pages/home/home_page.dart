import 'package:empresta_super_app/data/models/health_insurance_model.dart';
import 'package:empresta_super_app/data/models/institution_model.dart';
import 'package:empresta_super_app/presentation/presenters/home_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final HomePageStore store;

  const HomePage({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyFormatter =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    final loanValueController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Seleção de Convênios de Saúde'),
      ),
      body: Container(
          color: Color(0xFF0A2540),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: loanValueController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Valor do Empréstimo',
                    prefixText: 'R\$ ',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      final parsed = int.tryParse(newValue.text);
                      if (parsed != null) {
                        final newText = currencyFormatter.format(parsed / 100);
                        return TextEditingValue(
                          text: newText,
                          selection:
                              TextSelection.collapsed(offset: newText.length),
                        );
                      }
                      return newValue;
                    }),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    store.updateLoanValue(value);
                  },
                ),
              ),
              SizedBox(height: 20),
              Observer(
                builder: (_) {
                  if (store.healthInsurances.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DropdownButtonFormField<HealthInsuranceModel>(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Selecione os convênios',
                          ),
                          value: store.selectedInsurances.isNotEmpty
                              ? store.selectedInsurances[0]
                              : null,
                          items: store.healthInsurances
                              .map((insurance) => DropdownMenuItem(
                                    value: insurance,
                                    child: Text(insurance.valor),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              store.toggleInsuranceSelection(value);
                            }
                          },
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          dropdownColor: Colors.white,
                        ),
                        if (store.selectedInsurances.isNotEmpty)
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, top: 8.0),
                            child: Text(
                              'Item selecionado: ${store.selectedInsurances[0].valor}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                      ],
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              Observer(
                builder: (_) {
                  if (store.institutions.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DropdownButtonFormField<InstitutionModel>(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Selecione a intituição',
                          ),
                          value: store.selectedInstitutions.isNotEmpty
                              ? store.selectedInstitutions[0]
                              : null,
                          items: store.institutions
                              .map((insurance) => DropdownMenuItem(
                                    value: insurance,
                                    child: Text(insurance.valor),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              store.toggleInstitutionSelection(value);
                            }
                          },
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          dropdownColor: Colors.white,
                        ),
                        if (store.institutions.isNotEmpty)
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, top: 8.0),
                            child: Text(
                              'Item selecionado: ${store.institutions[0].valor}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                      ],
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              Observer(
                builder: (_) {
                  if (store.installments.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DropdownButtonFormField<int>(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText:
                                'Selecione em quantas vezes deseja parcelar',
                          ),
                          value: store.installmentsSelected.isNotEmpty
                              ? store.installmentsSelected[0]
                              : null,
                          items: store.installments
                              .map((insurance) => DropdownMenuItem(
                                    value: insurance,
                                    child: Text(insurance.toString()),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              store.toggleInstallmentsSelection(value);
                            }
                          },
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          dropdownColor: Colors.white,
                        ),
                        if (store.institutions.isNotEmpty)
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, top: 8.0),
                            child: Text(
                              'Item selecionado: ${store.institutions[0].valor}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                      ],
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Do something with store.selectedInsurances
                  // e.g., pass store.selectedInsurances to the next screen or perform some action
                  print('Selected Insurances: ${store.selectedInsurances}');
                },
                child: Text('Salvar'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFEF6C00),
                ),
              ),
            ],
          )),
    );
  }
}
