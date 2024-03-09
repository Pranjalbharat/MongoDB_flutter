import 'package:flutter/material.dart';
import 'package:mongodb_flutter/Pages/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key,  required this.user, required this.onTapDelete, required this.onTapEdit});
  final User user;
  final VoidCallback onTapEdit, onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      color: Colors.white,
      child: ListTile(
        leading: Text(
          '${user.age}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        title: Text(user.name),
        subtitle: Text('${user.phone}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap:onTapEdit,
              child: const Icon(Icons.edit),
            ),
            GestureDetector(
              onTap: onTapDelete,
              child: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}