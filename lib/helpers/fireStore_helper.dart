import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep/global.dart';

class FireStoreHelper {
  FireStoreHelper._();

  static final FireStoreHelper fireStoreHelper = FireStoreHelper._();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  CollectionReference? collectionReference;

  connectCollection() async {
    collectionReference = fireStore.collection('${Global.all}');
  }

  Future<void> adduers(
      {required String adduers,
      required String uersimf,
      required String date,
      required String time}) async {
    connectCollection();

    String nId = DateTime.now().millisecondsSinceEpoch.toString();

    await collectionReference!
        .doc(nId)
        .set({
          'id': nId,
          'title': adduers,
          'subtitle': uersimf,
          'time': time,
          'date': date,
        })
        .then(
          (value) => print("Uers is add...."),
        )
        .catchError((error) => print("$error"));
  }

  removeuersiom({required String id}) {
    connectCollection();

    collectionReference!
        .doc(id)
        .delete()
        .then((value) => print("Uers delete"))
        .catchError((error) => print("Uers not delete"));
  }

  edituers({required String id, required Map<Object, Object> data}) {
    connectCollection();

    collectionReference!
        .doc(id)
        .update(data)
        .then((value) => print("Uers Edit"))
        .catchError(
          (error) =>
              print("====================\n$error\n======================"),
        );
  }

  Stream<QuerySnapshot<Object?>> getuers() {
    connectCollection();

    return collectionReference!.snapshots();
  }
}
