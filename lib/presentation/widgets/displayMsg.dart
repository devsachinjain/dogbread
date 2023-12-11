import 'package:flutter/material.dart';

import '../../data/const/strings.dart';

displayMsg()=>const SizedBox(
height: 400,
child: Center(
child: Text(AppStrings.breedMsg,style: TextStyle(fontSize: 18,color: Colors.grey)),
));