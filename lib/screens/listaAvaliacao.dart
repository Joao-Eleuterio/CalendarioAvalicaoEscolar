import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:miniprojeto/models/avaliacoesGerais.dart';
import 'package:miniprojeto/screens/consultaAvaliacao.dart';
import 'package:miniprojeto/screens/editAvaliacao.dart';

class ListaAvaliacaoScreen extends StatefulWidget {
  final title;
  final AvaliacaoGeral avaliacaoList;

  const ListaAvaliacaoScreen(
      {Key? key, required this.title, required this.avaliacaoList})
      : super(key: key);

  @override
  State<ListaAvaliacaoScreen> createState() => _ListaAvaliacaoScreenState();
}

class _ListaAvaliacaoScreenState extends State<ListaAvaliacaoScreen> {

  @override
  Widget build(BuildContext context) {
    var avaliacoes = widget.avaliacaoList;
    avaliacoes
        .getAllAssessments()
        .sort((a, b) => a.getData().compareTo(b.getData()));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: avaliacoes.getAllAssessments().length,
        itemBuilder: (context, index) {
          return SwipeDetector(
              onSwipeLeft: (offset) {
                if (widget.avaliacaoList
                        .getAllAssessments()[index]
                        .getData()
                        .compareTo(DateTime.now()) <
                    0) {
                  widget.avaliacaoList.SendMensage(
                      'Só podem ser eliminados registos de avaliações futuras.',
                      context,cor: Colors.redAccent);
                } else {
                  widget.avaliacaoList.removerAvaliacao(index);
                  setState(() {});
                  widget.avaliacaoList.SendMensage(
                      'O registo de avaliação selecionado foi eliminado com sucesso.',context);
                }
              },
              child: buildCard(index, context));
        },
      ),
    );
  }

  Card buildCard(int index, BuildContext context) {
    return Card(
      color: Colors.grey[350],
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListTile(
          leading: Image.asset('lib/assets/logo.jpg'),
          title: Text(
              widget.avaliacaoList.getAllAssessments()[index].escreve(true)),
          onTap: () async {
            var resultado = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ConsultaAvaliacaoScreen(
                        title: "Consulta Avaliação",
                        avaliacao:
                            widget.avaliacaoList.getAllAssessments()[index],
                        onDelete: () async {
                          if (widget.avaliacaoList
                                  .getAllAssessments()[index]
                                  .getData()
                                  .compareTo(DateTime.now()) >=
                              0) {
                            widget.avaliacaoList
                                .removerAvaliacao(index);
                            widget.avaliacaoList.SendMensage(
                                'O registo de avaliação selecionado foi eliminado com sucesso.',context);
                            Navigator.pop(context, true);
                            setState(() {});
                          } else {
                            widget.avaliacaoList.SendMensage("Só podem ser eliminados registos de avaliações futuras.",context,
                                cor: Colors.redAccent);
                          }
                        },
                        onEdit: () async {
                          if (widget.avaliacaoList
                                  .getAllAssessments()[index]
                                  .getData()
                                  .compareTo(DateTime.now()) >=
                              0) {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditaAvaliacaoScreen(
                                        title: "Edita Avaliacao",
                                        avaliacao: widget.avaliacaoList
                                            .getAllAssessments()[index])));
                            Navigator.pop(context, true);
                            setState(() {});
                          } else {
                            widget.avaliacaoList.SendMensage("Só podem ser editados registos de avaliações futuras.", context,cor: Colors.redAccent);
                          }
                        },
                      )),
            );
            if(resultado!=null && resultado){
            setState(() {});}
          },
        ),
      ),
    );
  }


}
