import '../api/api_service.dart';
import '../repository/user_repository.dart';
import '../view_model/user_view_model_factory.dart';

class Injector {

   static ApiService provideApiService() {
    return ApiService();
  }

  static UserViewModelFactory provideUserViewModelFactory() {
    return UserViewModelFactory(provideUserRepository());
  }

  static UserRepository provideUserRepository() {
    return UserRepository(provideApiService());
  }
}