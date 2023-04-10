import 'package:flutter/material.dart';

class Medlemskartotek extends StatelessWidget {
  const Medlemskartotek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medlemskartotek'),
      ),
      body: const Center(
        child: Text('This is the Medlemskartotek page'),
      ),
    );
  }
}