import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:harsatapp/view/account/address.dart';
import 'package:harsatapp/view/account/personal.dart';
import 'package:harsatapp/widget/custom_appbar.dart';
import 'package:harsatapp/widget/custom_color.dart';
import 'package:harsatapp/widget/custom_text.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late User _currentUser;
  String _firstName = '';
  String _secondName = '';
  String _city = '';
  String _province = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _currentUser = FirebaseAuth.instance.currentUser!;
    _fetchUserData();
  }

  void _fetchUserData() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(_currentUser.uid)
        .get();

    if (snapshot.exists) {
      setState(() {
        _firstName = snapshot['firstName'] ?? '';
        _secondName = snapshot['secondName'] ?? '';
        _city = snapshot['city'] ?? '';
        _province = snapshot['province'] ?? '';
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Yeni eklenen satır
            children: [
              const SizedBox(height: 20),
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/profile.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                children: [
                  BlackText(
                    text: '$_firstName $_secondName',
                    size: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10),
                  BlackText(
                    text: '$_province/$_city',
                    size: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          TabBar(
            controller: _tabController,
            unselectedLabelColor: CustomColors.darkGreen,
            labelColor: CustomColors.lightGreen,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Kişisel Bilgilerim",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'assets/fonts/Lato-Regular.ttf',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Adreslerim",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'assets/fonts/Lato-Regular.ttf',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                UserProfileScreen(),
                AddressScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
