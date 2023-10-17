import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:harsatapp/widget/custom_color.dart';
import 'package:harsatapp/widget/custom_text.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  late User _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser!;
    _fetchAddressData();
  }

  void _fetchAddressData() async {
    DocumentSnapshot snapshot = await _users.doc(_currentUser.uid).get();

    if (snapshot.exists) {
      setState(() {
        _cityController.text = snapshot['city'] ?? '';
        _provinceController.text = snapshot['province'] ?? '';
      });
    }
  }

  Future<void> _updateAddress() async {
    await _users.doc(_currentUser.uid).update({
      'city': _cityController.text,
      'province': _provinceController.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Adres başarıyla düzenlendi!'),
      ),
    );
  }

  Future<void> _updateRealAddress(String address) async {
    final String newAddress = _addressController.text.trim();

    if (newAddress.isNotEmpty) {
      await _users.doc(_currentUser.uid).update({
        'address': FieldValue.arrayRemove([address]),
        'address': FieldValue.arrayUnion([newAddress]),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Adres başarıyla güncellendi!'),
        ),
      );

      _addressController.clear();
    }
  }

  Future<void> _deleteAddress(String address) async {
    await _users.doc(_currentUser.uid).update({
      'address': FieldValue.arrayRemove([address]),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Adres başarıyla silindi!'),
      ),
    );
  }

  Future<void> _addAddress() async {
    final String newAddress = _addressController.text.trim();

    if (newAddress.isNotEmpty) {
      await _users.doc(_currentUser.uid).update({
        'address': FieldValue.arrayUnion([newAddress]),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Adres başarıyla eklendi!'),
        ),
      );

      _addressController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'İl'),
              ),
              TextFormField(
                controller: _provinceController,
                decoration: const InputDecoration(labelText: 'İlçe'),
              ),
              const SizedBox(height: 16.0),
              MaterialButton(
                color: CustomColors.mainGreen,
                minWidth: MediaQuery.of(context).size.width,
                onPressed: _updateAddress,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: WhiteText(
                  text: "DÜZENLE",
                  size: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16.0),
              BlackText(
                text: "ADRESLERİM",
                size: 18,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 8.0),
              StreamBuilder<DocumentSnapshot>(
                stream: _users.doc(_currentUser.uid).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.exists) {
                    final List<dynamic> addresses =
                        snapshot.data!.get('address') ?? [];

                    return Column(
                      children: addresses.map((address) {
                        final TextEditingController controller =
                            TextEditingController(text: address);

                        return ListTile(
                          title: TextFormField(
                            controller: controller,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => _deleteAddress(address),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Yeni Adres'),
              ),
              const SizedBox(height: 8.0),
              MaterialButton(
                color: CustomColors.mainGreen,
                minWidth: MediaQuery.of(context).size.width,
                onPressed: _addAddress,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: WhiteText(
                  text: "ADRES EKLE",
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
