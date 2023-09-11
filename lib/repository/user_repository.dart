import '../api/api_service.dart';
import '../model/user_model.dart';
import 'repository.dart';
import 'dart:async';
import 'dart:convert';

class UserRepository extends Repository {
  ApiService _apiService;
  UserRepository(this._apiService);
  
  Future<List<UserModel>> loadUsers(int size) async {
    final response = await _apiService.loadUser(size);

    if (response.statusCode == 200) {
      final __data = json.decode(response.body);
      List jsonResponse = __data['results'];
      return jsonResponse.map((data) => UserModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  void dispose() {}
}
