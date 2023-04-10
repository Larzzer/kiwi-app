import 'package:flutter/material.dart';

class PresailCheck extends StatelessWidget {
  const PresailCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pre-sail Check'),
      ),
      body: const Center(
        child: Text('This is the Pre-sail Check page'),
      ),
    );
  }
}