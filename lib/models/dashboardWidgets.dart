import 'dart:async';

import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:miniprojeto/models/avaliacoesGerais.dart';
import 'package:miniprojeto/screens/dashbooard.dart';

class CirculeDashboard extends StatefulWidget {
  CirculeDashboard({
    super.key,
    required this.widget,
    required this.val1,
    required this.val2,
    required this.chave,
  });

  final DashboardScreen widget;
  var val1;
  var val2;
  var chave;

  @override
  State<CirculeDashboard> createState() => _CirculeDashboardState();
}

class _CirculeDashboardState extends State<CirculeDashboard> {
  Timer? _timer;

  @override
  void initState(){
    super.initState();
    _timer = Timer.periodic(const Duration(minutes: 1),(Timer t) => setState(() { }));
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    debugPrint("Desenhei os graficos");
    return AnimatedCircularChart(
      key: widget.chave,
      size: const Size(100.0, 100.0),
      initialChartData: <CircularStackEntry>[
        CircularStackEntry(
          <CircularSegmentEntry>[
            CircularSegmentEntry(
              ((widget.widget.avaliacaoList.nivelProximosDias(widget.val1, widget.val2)*100)/5),
              Colors.blue[400],
              rankKey: 'completed',
            ),
            CircularSegmentEntry(
              100-((widget.widget.avaliacaoList.nivelProximosDias(widget.val1, widget.val2)*100)/5),
              Colors.blueGrey[600],
              rankKey: 'remaining',
            ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
      percentageValues: true,
      holeLabel: '${widget.widget.avaliacaoList.nivelProximosDias(widget.val1, widget.val2)}/5',
      labelStyle: TextStyle(
        color: Colors.blueGrey[600],
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }
}

class ListaAvaliacoesDashBoard extends StatefulWidget {
  const ListaAvaliacoesDashBoard({
    super.key,
    required this.widget,
    required this.avaliacoes,
  });

  final DashboardScreen widget;
  final AvaliacaoGeral avaliacoes;

  @override
  State<ListaAvaliacoesDashBoard> createState() => _ListaAvaliacoesDashBoardState();
}

class _ListaAvaliacoesDashBoardState extends State<ListaAvaliacoesDashBoard> {

  Timer? _timer;

  @override
  void initState(){
    super.initState();
    _timer = Timer.periodic(const Duration(minutes: 1),(Timer t) => setState(() { }));
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Desenhei os cards");
    return Expanded(child: ListView.builder(
      itemCount: widget.avaliacoes.getAllAssessments().length,
      itemBuilder: (context, index) {
        return widget.widget.avaliacaoList.dashCards(context,index);
      },
    ),);
  }
}

