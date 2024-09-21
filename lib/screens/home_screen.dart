import 'package:flutter/material.dart';
import 'package:votacionesapp/models/partido_model.dart';
import 'package:votacionesapp/services/firestore_service.dart';
import 'package:votacionesapp/widgets/partido_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Partidos Políticos")),
      body: StreamBuilder(
        stream: FirestoreService.getPartidos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot partido = snapshot.data!.docs[index];
              print("---------");
              print(partido["nombre"]);
              print(partido["representante"]);
              print("---------");

              Partido partidoAux = Partido.fromMap(
                  partido.data() as Map<String, dynamic>, partido.id);

              return PartidoCard(partido: partidoAux);
            },
          );
        },
      ),
    );
  }
}
