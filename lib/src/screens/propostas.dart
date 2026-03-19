import 'package:crm_proof_of_concept/src/widgets/modal_widget.dart';
import 'package:crm_proof_of_concept/src/widgets/pop_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class proposedScreen extends StatefulWidget {
  const proposedScreen({super.key});

  @override
  State<proposedScreen> createState() => _proposedScreenState();
}

class _proposedScreenState extends State<proposedScreen> {
  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.amber,
      ),
      child: child,
    );
  }

  Widget _buildHeader(String title, double width) {
    return SizedBox(
      width: width,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCell(String value, double width) {
    return SizedBox(
      width: width,
      child: Text(value, textAlign: TextAlign.center),
    );
  }

  void _openProposalModal(BuildContext context) {
    ModalWidget.show(
      context,
      title: 'PROPOSTA - EMPRESA X',
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Data', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('12/03/2026'),
            SizedBox(height: 10),

            Text('Responsável', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Carlos'),
            SizedBox(height: 10),

            Text('Valor', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('R\$ 3.500'),
            SizedBox(height: 10),

            Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Em negociação'),
            SizedBox(height: 10),

            Text('Agenda', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('15/03/2026 - Ligar para cliente'),
            SizedBox(height: 10),

            Text('Proposta', style: TextStyle(fontWeight: FontWeight.bold)),
            Divider(),

            Text(
              'Desenvolvimento de aplicativo\nFlutter com painel administrativo',
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () {}, child: const Text('Editar')),
        TextButton(onPressed: () {}, child: const Text('Excluir')),
      ],
    );
  }

  void _openCreateProposalModal(BuildContext context) {
    ModalWidget.show(
      context,
      title: 'Nova Proposta',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          TextField(
            decoration: InputDecoration(
              labelText: 'Cliente',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Valor',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Status',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Propostas'),
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
        actions: [
          PopMenuWidget(
            icon: const Icon(Icons.menu),
            onSelected: (value) {
              context.goNamed(value);
            },
            items: const [
              PopupMenuItem(value: 'agenda', child: Text('agenda', style: TextStyle(color: Colors.black),)),
              PopupMenuItem(value: 'home', child: Icon(Icons.logout)),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _openCreateProposalModal(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                    child: const Text('Nova Proposta'),
                  ),
                ),
              ),
            ),
            _buildCard(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  const minColumnWidth = 120.0;
                  const columnCount = 5;

                  final totalWidth = constraints.maxWidth;

                  final columnWidth = totalWidth / columnCount > minColumnWidth
                      ? totalWidth / columnCount
                      : minColumnWidth;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: columnWidth * columnCount,
                      child: DataTable(
                        columnSpacing: 0,
                        columns: [
                          DataColumn(
                            label: _buildHeader('Código', columnWidth),
                          ),
                          DataColumn(
                            label: _buildHeader('Cliente', columnWidth),
                          ),
                          DataColumn(label: _buildHeader('Valor', columnWidth)),
                          DataColumn(
                            label: _buildHeader('Status', columnWidth),
                          ),
                          DataColumn(label: _buildHeader('Ações', columnWidth)),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(_buildCell('001', columnWidth)),
                              DataCell(_buildCell('Cliente A', columnWidth)),
                              DataCell(_buildCell('R\$ 500', columnWidth)),
                              DataCell(_buildCell('Aprovado', columnWidth)),
                              DataCell(
                                SizedBox(
                                  width: columnWidth,
                                  child: IconButton(
                                    icon: const Icon(Icons.visibility),
                                    onPressed: () {
                                      _openProposalModal(context);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(_buildCell('002', columnWidth)),
                              DataCell(_buildCell('Cliente B', columnWidth)),
                              DataCell(_buildCell('R\$ 800', columnWidth)),
                              DataCell(_buildCell('Pendente', columnWidth)),
                              DataCell(
                                SizedBox(
                                  width: columnWidth,
                                  child: IconButton(
                                    icon: const Icon(Icons.visibility),
                                    onPressed: () {
                                      _openProposalModal(context);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
