import 'package:flutter/material.dart';
import 'package:votacionesapp/models/partido_model.dart';
import 'package:votacionesapp/services/firestore_service.dart';

class PartidoCard extends StatelessWidget {
  final Partido partido;

  const PartidoCard({super.key, required this.partido});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.green],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: Image.network(
              partido.logoUrl,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(partido.nombre),
          subtitle: Text('Representante: ${partido.representante}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () =>
                    FirestoreService.updateVotes(partido.id, partido.votos + 1),
              ),
              Text('${partido.votos}'),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (partido.votos > 0) {
                    FirestoreService.updateVotes(partido.id, partido.votos - 1);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
