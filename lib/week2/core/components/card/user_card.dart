import 'package:flutter/material.dart';
import 'package:vs_code_flutter_demo/week2/statefull/model/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  final VoidCallback? onPressed;

  const UserCard({Key? key, required this.user, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(user.imageUrl)),
        title: Text(user.title),
        subtitle: Text(user.decription),
        trailing: Icon(Icons.arrow_right_alt_rounded),
        onTap: onPressed,
      ),
    );
  }
}
