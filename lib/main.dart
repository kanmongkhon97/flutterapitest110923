import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapitest/view/user/user_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutterapitest/model/user_model.dart';

import 'view/user/user_widget.dart';
import 'view_model/user_view_model_factory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserWidget(),
    );
  }
}
