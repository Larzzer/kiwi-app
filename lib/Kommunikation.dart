import 'package:flutter/material.dart';

class Kommunikation extends StatelessWidget {
  const Kommunikation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kommunikation'),
      ),
      body: const Center(
        child: Text('This is the Kommunikation page'),
      ),
    );
  }
}