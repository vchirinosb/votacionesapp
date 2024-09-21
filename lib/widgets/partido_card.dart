import 'package:flutter/material.dart';
import 'package:votacionesapp/models/partido_model.dart';
import 'package:votacionesapp/services/firestore_service.dart';

class PartidoCard extends StatelessWidget {
  final Partido partido;

  const PartidoCard({super.key, required this.partido});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.withOpacity(0.5), Colors.transparent],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.network(
                  partido.logoUrl,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(partido.nombre),
              subtitle: Text(partido.representante),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_upward),
                          onPressed: () => FirestoreService.updateVotes(
                              partido.id, partido.votos + 1),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_downward),
                          onPressed: () {
                            if (partido.votos > 0) {
                              FirestoreService.updateVotes(
                                  partido.id, partido.votos - 1);
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${partido.votos}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
