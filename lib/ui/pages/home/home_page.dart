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
        title: const Text('O melhor lugar para seu emprestimo'),
        backgroundColor: const Color(0xFFEF6C00),
      ),
      body: Container(
          color: const Color(0xFF0A2540),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: loanValueController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
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
              const SizedBox(height: 20),
              Observer(
                builder: (_) {
                  if (store.healthInsurances.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InputDecorator(
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Selecione  convênios',
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              children: store.healthInsurances
                                  .map((insurance) => FilterChip(
                                        label: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(insurance.valor),
                                        ),
                                        selected: store.selectedInsurances
                                            .contains(insurance),
                                        onSelected: (selected) {
                                          store.toggleInsuranceSelection(
                                              insurance);
                                        },
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Observer(
                builder: (_) {
                  if (store.institutions.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InputDecorator(
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Selecione as Instituições',
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              children: store.institutions
                                  .map((insurance) => FilterChip(
                                        label: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(insurance.valor),
                                        ),
                                        selected: store.selectedInstitutions
                                            .contains(insurance),
                                        onSelected: (selected) {
                                          store.toggleInstitutionSelection(
                                              insurance);
                                        },
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              Observer(
                builder: (_) {
                  if (store.installments.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DropdownButtonFormField<int>(
                          decoration: const InputDecoration(
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
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          dropdownColor: Colors.white,
                        ),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await store.sendSimulationData();

                  Future.delayed(const Duration(milliseconds: 500));

                  if (store.simulationData != null &&
                      store.simulationData!.isNotEmpty) {
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Dados da Simulação',
                                style: TextStyle(
                                  color: Color(0xFF0A2540),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              _buildDataBlock(
                                title: 'Instituição:',
                                data: store.simulationData![0].institution,
                              ),
                              _buildDataBlock(
                                title: 'Valor Solicitado:',
                                data: store.simulationData![0].requestedValue
                                    .toString(),
                              ),
                              _buildDataBlock(
                                title: 'Valor da Parcela:',
                                data:
                                    store.simulationData![0].installmentXValue,
                              ),
                              _buildDataBlock(
                                title: 'Taxa de Juros:',
                                data: store.simulationData![0].interestRate,
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Fechar',
                                style: TextStyle(
                                  color: Color(0xFF0A2540),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF6C00),
                ),
                child: const Text('Simular'),
              ),
            ],
          )),
    );
  }
}

Widget _buildDataBlock({required String title, required String data}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        data,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
}
