import 'package:crm_proof_of_concept/src/widgets/modal_widget.dart';
import 'package:crm_proof_of_concept/src/widgets/pop_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {

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

  void _openAgendaModal(
    BuildContext context,
    String date,
    String title,
    String responsible,
  ) {
    ModalWidget.show(
      context,
      title: 'Detalhes da Agenda',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Data',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(date),

          const SizedBox(height: 10),

          const Text(
            'Atividade',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(title),

          const SizedBox(height: 10),

          const Text(
            'Responsável',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(responsible),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('Editar'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Excluir'),
        ),
      ],
    );
  }

  Widget _agendaItem({
    required String date,
    required String title,
    required String responsible,
  }) {
    return InkWell(
      onTap: () {
        _openAgendaModal(context, date, title, responsible);
      },
      child: _buildCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 6),
            Text(
              'Responsável: $responsible',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
        actions: [
          PopMenuWidget(
            icon: const Icon(Icons.menu),
            onSelected: (value) {
              context.goNamed(value);
            },
            items: const [
              PopupMenuItem(
                value: 'proposta',
                child: Text(
                  'Propostas',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              PopupMenuItem(
                value: 'home',
                child: Icon(Icons.logout),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            _agendaItem(
              date: '15/03 - 10:00',
              title: 'Ligar para Empresa X',
              responsible: 'Carlos',
            ),

            _agendaItem(
              date: '16/03 - 14:00',
              title: 'Reunião com Empresa Y',
              responsible: 'João',
            ),

            _agendaItem(
              date: '17/03 - 09:00',
              title: 'Enviar nova proposta',
              responsible: 'Maria',
            ),

          ],
        ),
      ),
    );
  }
}