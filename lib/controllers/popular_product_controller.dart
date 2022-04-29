import 'package:flutter/material.dart';

class PopularProductController extends StatefulWidget {

  const PopularProductController({ Key? key }) : super(key: key);

  @override
  _PopularProductControllerState createState() => _PopularProductControllerState();
}

class _PopularProductControllerState extends State<PopularProductController> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Container(),
       );
  }
}