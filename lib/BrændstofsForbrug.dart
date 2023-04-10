import 'package:flutter/material.dart';

class BraendstofsForbrug extends StatelessWidget {
  const BraendstofsForbrug({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BrændstofsForbrug'),
      ),
      body: const Center(
        child: Text('This is the BrændstofsForbrug page'),
      ),
    );
  }
}