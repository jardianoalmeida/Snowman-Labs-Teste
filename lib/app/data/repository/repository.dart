import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snowmanlabs/app/data/model/model.dart';

class Repository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Faq>> faqStream() {

    return _firestore.collection('faq').snapshots().map((QuerySnapshot query) {
      List<Faq> retVal = List();

      query.docs.forEach((element) {
        retVal.add(Faq.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> addFaq(data) async {
    try{
      await _firestore.collection('faq').add(data);
    } catch (err) {
      print(err);
      rethrow;
    }
  }
}
