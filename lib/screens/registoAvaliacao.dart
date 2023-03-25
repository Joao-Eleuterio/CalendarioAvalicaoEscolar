import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:miniprojeto/models/avaliacao.dart';
import 'package:date_field/date_field.dart';
import 'package:miniprojeto/models/avaliacoesGerais.dart';
import 'package:miniprojeto/widgets/button.dart';

class RegistoAvaliacaoScreen extends StatefulWidget {
  final title;
  final AvaliacaoGeral avaliacaoList;

  const RegistoAvaliacaoScreen(
      {Key? key, required this.title, required this.avaliacaoList})
      : super(key: key);

  @override
  State<RegistoAvaliacaoScreen> createState() => _RegistoAvaliacaoScreenState();
}

class _RegistoAvaliacaoScreenState extends State<RegistoAvaliacaoScreen> {
  final formKey = GlobalKey<FormState>();
  String nomeDisciplina = '';
  String tipoavaliacao = 'Frequência';
  DateTime data = DateTime.now();
  int nivelDif = 0;
  String observacao = '';
  var items = [
    'Frequência',
    'Mini-Teste',
    'Projeto',
    'Defesa',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            buildNomeDisciplina(),
            const SizedBox(height: 24),
            buildTipoAvaliacao(),
            const SizedBox(height: 24),
            buildNivelDificuldade(),
            const SizedBox(height: 24),
            buildDataRealizacao(),
            const SizedBox(height: 24),
            buildObservacao(),
            const SizedBox(height: 24),
            buildSubmit(),
          ],
        ),
      ),
    );
  }

  Widget buildNomeDisciplina() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Nome da disciplina',
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Introduza o nome da disciplina';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => nomeDisciplina = value!),
      );

    Widget buildTipoAvaliacao() => DropdownButtonFormField(
        decoration: const InputDecoration(labelText: "Tipo de avaliação"),
        // Initial Value
        value: tipoavaliacao,
        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),
        // Array list of items
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) {
          setState(() {
            tipoavaliacao = newValue!;
          });
        },
        validator: (value) {
          if (value == null) {
            return 'Introduza o tipo disciplina';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => tipoavaliacao = value!),
      );

  Widget buildNivelDificuldade() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Nível de dificuldade esperado pelo aluno',
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        maxLength: 1,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              (int.parse(value) > 5 || int.parse(value) < 1)) {
            return 'Introduza um nivel de dificuldade esperado pelo aluno de 1 a 5';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => nivelDif = int.parse(value!)),
      );

  Widget buildDataRealizacao() => DateTimeFormField(
        decoration: const InputDecoration(
            hintStyle: TextStyle(color: Colors.black45),
            errorStyle: TextStyle(color: Colors.redAccent),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            suffixIcon: Icon(Icons.event_note),
            labelText: "Data de realização"),
        firstDate: DateTime.now(),
        dateFormat: DateFormat('yyyy/MM/dd HH:mm'),
        mode: DateTimeFieldPickerMode.dateAndTime,
        validator: (value) {
          if (value == null ||
              value.toString().isEmpty || value.compareTo(DateTime.now()) < 0) {
            return 'Introduza uma data valida';
          }
          return null;
        },
        onSaved: (value) => setState(() => data = value!),
      );

  Widget buildObservacao() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Observação (opcional)',
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        maxLines: 10,
        minLines: 5,
        maxLength: 200,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        onSaved: (value) => setState(() => observacao = value!),
      );

  Widget buildSubmit() => Builder(
        builder: (context) => ButtonWidget(
          text: 'Submit',
          onClicked: () {
            final isValid = formKey.currentState?.validate();
            // FocusScope.of(context).unfocus();

            if (isValid != null && isValid ) {
              formKey.currentState?.save();

              const message = 'A avaliação foi registada com sucesso.';
              const snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Avaliacao avaliacao = Avaliacao(
                  nomeDisciplina, tipoavaliacao, data, nivelDif, observacao);
              widget.avaliacaoList.addAvaliacao(avaliacao);
              formKey.currentState?.reset();
            }
          },
        ),
      );
}
