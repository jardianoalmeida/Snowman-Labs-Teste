import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snowmanlabs/app/data/model/model.dart';

class TodoList extends StatelessWidget {

  List<Faq> faq;
  TodoList({this.faq});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: faq.length,
      itemBuilder: (_, index) {
        if(faq.isEmpty){
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Card(
              elevation: 2,
              child: ClipPath(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Color(int.parse(faq[index].color)), width: 5),
                    ),
                  ),
                  child: ExpansionTile(
                    title: Text(faq[index].question, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                    children: <Widget>[
                      Text(
                        faq[index].answer,
                        style:TextStyle(fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
              ),
            ),
          );
        }
      },
    );
  }
}