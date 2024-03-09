import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();

    @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    ageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}