import 'package:flutter/material.dart';

Widget nameTile(name,deleteFunc){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 70),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, maxLines: 1,),
        SizedBox(height: 40,width: 50,),
        IconButton(
          iconSize: 20,
          icon: Icon(Icons.delete),
          onPressed: deleteFunc,
        )
      ]
    ),
  );
}