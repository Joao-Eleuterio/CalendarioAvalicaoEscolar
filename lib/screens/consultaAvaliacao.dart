import 'package:flutter/material.dart';
import 'package:miniprojeto/models/avaliacao.dart';
import 'package:share_plus/share_plus.dart';

class ConsultaAvaliacaoScreen extends StatefulWidget {
  final title;
  final Avaliacao avaliacao;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  ConsultaAvaliacaoScreen(
      {Key? key,
      required this.title,
      required this.avaliacao,
      required this.onDelete,
      required this.onEdit})
      : super(key: key);

  @override
  State<ConsultaAvaliacaoScreen> createState() =>
      _ConsultaAvaliacaoScreenState();
}

class _ConsultaAvaliacaoScreenState extends State<ConsultaAvaliacaoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),actions: [IconButton(
          onPressed:sharePressed, icon: Icon(Icons.share,color: Colors.white,)),],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.avaliacao.escreve(false),
              style: const TextStyle(fontSize: 24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: widget.onDelete,
                  child: Text('Eliminar'),
                ),
                const SizedBox(
                  width: 24,
                ),
                ElevatedButton(
                  onPressed: widget.onEdit,
                  child: Text('Editar'),
                ),
                ],
            ),
          ],
        ),
      ),
    );
  }

  sharePressed() {
    Share.share(widget.avaliacao.messagemDealer());
  }
}
