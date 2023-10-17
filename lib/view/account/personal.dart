import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:harsatapp/widget/custom_color.dart';
import 'package:harsatapp/widget/custom_text.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cksController = TextEditingController();

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  late User _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser!;
    _fetchUserData();
  }

  void _fetchUserData() async {
    DocumentSnapshot snapshot = await _users.doc(_currentUser.uid).get();

    if (snapshot.exists) {
      setState(() {
        _firstNameController.text = snapshot['firstName'] ?? '';
        _secondNameController.text = snapshot['secondName'] ?? '';
        _emailController.text = snapshot['email'] ?? '';
        _cksController.text = snapshot['cks'] ?? '';
      });
    }
  }

  Future<void> _updateUser() async {
    await _users.doc(_currentUser.uid).update({
      'firstName': _firstNameController.text,
      'secondName': _secondNameController.text,
      'email': _emailController.text,
      'cks': _cksController.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Kişisel Bilgiler Başarıyla Güncellendi!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Eklenen SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'İsim'),
              ),
              TextFormField(
                controller: _secondNameController,
                decoration: const InputDecoration(labelText: 'Soyisim'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: _cksController,
                decoration: const InputDecoration(labelText: 'ÇKS Numarası'),
              ),
              const SizedBox(height: 16.0),
              MaterialButton(
                color: CustomColors.mainGreen,
                minWidth: MediaQuery.of(context).size.width,
                onPressed: _updateUser,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: WhiteText(
                  text: "DÜZENLE",
                  size: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
