import 'package:flutter/material.dart';

dropdownDecoration(Widget child)=> DecoratedBox(
    decoration: BoxDecoration(
      color:Colors.transparent,
      border: Border.all(color: Colors.black38, width:1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: child,));