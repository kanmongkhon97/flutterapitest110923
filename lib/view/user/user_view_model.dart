import 'package:flutter/material.dart';
import 'package:flutterapitest/model/user_model.dart';

import '../../arch/view_model.dart';
import '../../repository/user_repository.dart';

class UserViewModel extends ViewModel {
  UserRepository _userRepository;

  UserViewModel(this._userRepository);

  Future<List<UserModel>> loadUser(int size) async {
    return _userRepository.loadUsers(size);
  }

  @override
  void dispose() {
    _userRepository.dispose();
  }
}
