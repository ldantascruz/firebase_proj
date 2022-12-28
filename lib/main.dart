import 'package:firebase_proj/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAnalytics.instance.logAppOpen();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const App(),
    ),
  );
  FirebaseAnalytics.instance;
  var collection = FirebaseFirestore.instance.collection('contact');
  // collection
  //     .doc('contato3')
  //     .set(
  //       {
  //         'nome': 'Dalva',
  //         'celular': '(27)99529-5140',
  //         'idade': 50,
  //         'email': 'dalva.dc@gmail.com'
  //       },
  //     )
  //     .then((value) => print('deu certo'))
  //     .catchError((error) => print('Deu erro: $error'));

  var result = await collection.get();

  collection.snapshots().listen((event) {
    result = event;
  });

  for (var doc in result.docs) {
    print(doc['nome']);
  }
}
