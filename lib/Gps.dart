import 'package:flutter/material.dart';

class Gps extends StatelessWidget {
  const Gps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPS'),
      ),
      body: const Center(
        child: Text('This is the GPS page'),
      ),
    );
  }
}