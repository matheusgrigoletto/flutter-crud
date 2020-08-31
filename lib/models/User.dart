import 'package:flutter/foundation.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String avatarUrl;

  const User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.avatarUrl,
  });

}