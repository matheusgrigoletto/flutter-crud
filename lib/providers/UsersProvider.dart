import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firstcrud/data/dummy.users.dart';
import 'package:firstcrud/models/User.dart';

class UsersProvider with ChangeNotifier {
  final Map<int, User> _items = {...DUMMY_USERS };

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    // Atualizar
    if (user.id != null && _items.containsKey(user.id)) {
      _items.update(user.id, (_) => user);
    } else {
      // Adicionar
      final id = Random().nextInt(1000);

      _items.putIfAbsent(id, () => User(
        id: id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl,
      ));
    }

    notifyListeners();
  }

  void destroy(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}