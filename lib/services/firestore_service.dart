import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static Stream getPartidos() {
    return FirebaseFirestore.instance.collection('partidos').snapshots();
    //.map(
    // (snapshot) {
    //   print("------");
    //   print(snapshot.docs);
    //   print("------");
    //   return snapshot.docs.map((doc) => Partido.fromMap(doc.data(), doc.id)).toList();
    // },
    //);
  }

  static Future<void> updateVotes(String partidoId, int votos) async {
    await FirebaseFirestore.instance
        .collection('partidos')
        .doc(partidoId)
        .update({'votos': votos});
  }
}
