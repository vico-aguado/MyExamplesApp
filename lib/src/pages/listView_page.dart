import 'package:flutter/material.dart';

class User {
  User({this.name, this.email});
  final String name;
  final String email;
}

class UserListTile extends ListTile {
  UserListTile(User user)
      : super(
    title: Text(user.name),
    subtitle: Text(user.email),
    leading: CircleAvatar(child: Text(user.name[0])),
  );
}

class ListViewPage extends StatelessWidget {
 
 Widget _buildContent() {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext content, int index) {
          User user = users[index];
          return UserListTile(user);
        });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: Container(color: Colors.white, child: _buildContent()),
    );
  }
}


List<User> users = [
  User(name: 'Isa Tusa', email: 'isa.tusa@me.com'),
  User(name: 'Racquel Ricciardi', email: 'racquel.ricciardi@me.com'),
  User(name: 'Teresita Mccubbin', email: 'teresita.mccubbin@me.com'),
  User(name: 'Rhoda Hassinger', email: 'rhoda.hassinger@me.com'),
  User(name: 'Carson Cupps', email: 'carson.cupps@me.com'),
  User(name: 'Devora Nantz', email: 'devora.nantz@me.com'),
  User(name: 'Tyisha Primus', email: 'tyisha.primus@me.com'),
  User(name: 'Muriel Lewellyn', email: 'muriel.lewellyn@me.com'),
  User(name: 'Hunter Giraud', email: 'hunter.giraud@me.com'),
  User(name: 'Corina Whiddon', email: 'corina.whiddon@me.com'),
  User(name: 'Meaghan Covarrubias', email: 'meaghan.covarrubias@me.com'),
  User(name: 'Ulysses Severson', email: 'ulysses.severson@me.com'),
  User(name: 'Richard Baxter', email: 'richard.baxter@me.com'),
  User(name: 'Alessandra Kahn', email: 'alessandra.kahn@me.com'),
  User(name: 'Libby Saari', email: 'libby.saari@me.com'),
  User(name: 'Valeria Salvador', email: 'valeria.salvador@me.com'),
  User(name: 'Fredrick Folkerts', email: 'fredrick.folkerts@me.com'),
  User(name: 'Delmy Izzi', email: 'delmy.izzi@me.com'),
  User(name: 'Leann Klock', email: 'leann.klock@me.com'),
  User(name: 'Rhiannon Macfarlane', email: 'rhiannon.macfarlane@me.com'),
];