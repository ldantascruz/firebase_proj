import 'dart:ui';

import 'package:firebase_proj/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase App'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () => context.read<AuthService>().logout(),
              icon: const Icon(
                Icons.logout,
                size: 30,
                semanticLabel: 'Sair',
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          itemCount: 10,
          itemBuilder: ((context, index) {
            return const Text(
              'Teste',
              style: TextStyle(),
            );
          }),
        ),
      ),
    );
  }
}
