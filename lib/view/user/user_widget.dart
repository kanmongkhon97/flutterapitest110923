import 'package:flutter/material.dart';
import 'package:flutterapitest/arch/view_model_provider.dart';
import 'package:flutterapitest/di/injector.dart';
import 'package:flutterapitest/model/user_model.dart';
import 'package:flutterapitest/repository/user_repository.dart';
import 'package:flutterapitest/view/user/user_view_model.dart';

class UserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: UserStateWidget(),
    );
  }
}

class UserStateWidget extends StatefulWidget {
  @override
  _UserPageState createState() => new _UserPageState();
}

class _UserPageState extends State<UserStateWidget> {
  UserViewModel _userViewModel = ViewModelProviders.of<UserViewModel>(
      Injector.provideUserViewModelFactory());

  bool _isLoading = true;
  late Future<List<UserModel>> _users;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _users = _userViewModel.loadUser(10);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _users,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data![0].toString());
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var _user = snapshot.data![index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                              NetworkImage(_user.picture.thumbnail),
                          backgroundColor: Colors.transparent,
                        ),
                        title: Text(
                            "${_user.name!.title} ${_user.name!.first} ${_user.name!.last}"),
                        subtitle:  Text("gender:${_user.gender} age:${_user.dob!.age} email:${_user.email} phone:${_user.phone}"),
                      ),
                    ),
                    const Divider(
                      height: 1,
                    )
                  ],
                );
              });
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator(),);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _userViewModel.dispose();
  }
}
