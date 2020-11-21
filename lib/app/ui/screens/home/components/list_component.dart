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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: new BoxDecoration(
                boxShadow: [
                 /* BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )*/
                ],
              ),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                child: ClipPath(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Color(int.parse(faq[index].color)), width: 5),
                      ),
                    ),
                    child: ExpansionTile(
                      backgroundColor: Colors.white,
                      title: Text(faq[index].question, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          child: Text(
                            faq[index].answer,
                            style:TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
                ),
              ),
            ),
          );
        },
    );
  }
}