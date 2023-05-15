import 'package:api_response/services/user_api.dart';
import 'package:flutter/material.dart';
import '../model/users.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call'),
      ),

      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index){
          final user = users[index];
          //final color = user.gender == 'male'?Colors.blue: Colors.green;
          return ListTile(
            title: Text(user.fullName),
            subtitle: Text(user.location.country),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
      ),
    );
  }
    Future<void> fetchUsers() async{
      final response = await UserApi.fetchUsers();
      setState(() {
        users = response;
      });
    }
}