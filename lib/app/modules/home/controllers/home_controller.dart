import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Map<String, String>> listOfArticles = [
    {
      "articleTitle": "Kriteria Gigi Sehat pada Anak dan Cara Merawatnya",
      "articleImage": "assets/image_scalling.png"
    },
    {
      "articleTitle": "5 Cara Merawat Gigi dan Mulut Pada Lansia",
      "articleImage": "assets/image_scalling.png"
    }
  ];

  var dataUser = {}.obs;
  var dataProgram = [].obs;
  var dataDokter = [].obs;
  var dataArtikel = [].obs;

  var isLoading = false.obs;
  var uid = "".obs;

  Stream<DocumentSnapshot<Map<String, dynamic>>> notifStream(String uid) {
    return FirebaseFirestore.instance.collection("pasien").doc(uid).snapshots();
  }

  @override
  void onInit() async {
    isLoading.value = true;
    final FirebaseAuth auth = FirebaseAuth.instance;

    var collection = FirebaseFirestore.instance.collection('users');
    var program = FirebaseFirestore.instance.collection('program');
    var dokter = FirebaseFirestore.instance.collection('dokter');
    var artikel = FirebaseFirestore.instance.collection('artikel');

    final User? user = auth.currentUser;
    uid.value = await auth.currentUser!.uid;

    var docUser = await collection.doc('${user!.uid}').get();
    var docProgram = await program;
    var docDokter = await dokter;
    var docArtikel = await artikel;

    if (docUser.exists) {
      dataUser.value = await docUser.data()!;

      await docProgram.get().then((value) {
        value.docs.forEach((element) {
          dataProgram.add(element.data());
        });
      });
      await docDokter.get().then((value) {
        value.docs.forEach((element) {
          dataDokter.add(element.data());
        });
      });

      await docArtikel.get().then((value) => {
            value.docs.forEach((element) {
              dataArtikel.add(element.data());
            })
          });

      isLoading.value = false;
    }
    super.onInit();
  }
}
