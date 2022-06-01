// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Posts extends Equatable{
  int id;
  String title;
  String body;
  Posts({required this.id, required this.title, required this.body});
  
  @override
  List<Object> get props => [id, title, body];
  
}