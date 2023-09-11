import 'package:flutterapitest/view/user/user_view_model.dart';
import '../arch/factory.dart';
import '../repository/user_repository.dart';

class UserViewModelFactory extends Factory<UserViewModel> {
  UserRepository _userRepository;

  UserViewModelFactory(this._userRepository);

  @override
  UserViewModel create() {
    return UserViewModel(_userRepository);
  }
}