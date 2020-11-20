import 'package:cloud_firestore/cloud_firestore.dart';

class Faq {
  String id;
  String question;
  String answer;
  String color;


  Faq(this.question, this.answer, this.color);

  Faq.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    question = documentSnapshot.data()['question'];
    answer = documentSnapshot.data()['answer'];
    color = documentSnapshot.data()['color'];
  }
}