import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snowmanlabs/app/data/model/model.dart';
import 'package:snowmanlabs/app/data/provider/provider.dart';

class Repository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Faq>> faqStream() {
    return Provider().getAll();
  }

  Future<void> addFaq({data}) async {
    return Provider().add(data);
  }
}
