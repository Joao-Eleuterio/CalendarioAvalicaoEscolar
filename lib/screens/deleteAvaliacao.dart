import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String operation;
  final VoidCallback onDelete;

  const DetailScreen(
      {super.key, required this.operation, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              operation,
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: onDelete,
              child: Text('Eliminar'),
            ),
          ],
        ),
      ),
    );
  }
}