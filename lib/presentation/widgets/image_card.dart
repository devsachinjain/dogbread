import 'package:flutter/material.dart';

Widget imgCard(String imgPath)=> Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        imgPath,
        fit: BoxFit.cover,
      ),
    ));