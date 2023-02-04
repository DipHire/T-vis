import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tvis/Screens/Admin/AdminProfileScreen.dart';
import 'package:tvis/Screens/Admin/QRScanScren.dart';
import 'package:tvis/Screens/Admin/SucessScreen.dart';
import '../../Services/firebaseAuth.dart';
import '../../constants.dart';

class AdminHomeScreen extends StatefulWidget {
  final Auth auth;
  const AdminHomeScreen({required this.auth});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final TextEditingController _qrIdController = TextEditingController();
  String get qrId => _qrIdController.text;

  Future<void> _getDetails() async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    try {
      users.where("UserID", isEqualTo: qrId).snapshots().listen(
            (event) =>
            event.docs.forEach(
                  (doc) {
                print(doc.id);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) =>
                        SuccessScreen(
                          auth: Auth(),
                          uid: doc.id,
                        ),
                  ),
                );
              },
            ),
      );
    }catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo2.png",
          height: 50,
          width: 50,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Image.asset(
                "assets/images/logo.png",
              ),
            ),
            ListTile(
                title: const Text("Profile"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminProfile(),
                    ),
                  );
                }),
            ListTile(
              title: const Text("Log Out"),
              onTap: () {},
            ),
            // ListTile(
            //   title: Text("Enter QR ID"),
            //   onTap: () {},
            // ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            // color: kSecondaryColor,
            decoration: const BoxDecoration(
              image: DecorationImage(
                colorFilter:
                    ColorFilter.mode(Colors.white54, BlendMode.softLight),
                opacity: 10.0,
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 30.0,
                  ),
                  decoration: kBorder,
                  child: ListTile(
                    leading: Icon(
                      Icons.receipt_long_rounded,
                      size: 50.0,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      'Vehicles in campus',
                      style: ktitleTextStyle,
                    ),
                    subtitle: const Text('Today'),
                    trailing: Text(
                      '100',
                      style: ktitleTextStyle,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 10.0),
                  decoration: kBorder,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        elevation: 0.0,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'QR ID ',
                                      style: kprofileDescriptionText,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 9.0),
                              TextField(
                                controller: _qrIdController,
                                decoration: InputDecoration(
                                  counterText: '',
                                  prefixIcon:
                                      const Icon(Icons.numbers_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                // keyboardType: TextInputType.phone,
                                maxLength: 7,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: _getDetails,
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Text(
                              "Enter ",
                              style:
                                  kprofileDescriptionText.merge(const TextStyle(
                                color: Colors.white,
                              )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 10.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: kBorder,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QrScan(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: kfillContainer,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.qr_code_scanner_rounded,
                                  size: 120.0,
                                  color: kSecondaryColor,
                                ),
                                Text(
                                  "Scan QR",
                                  style: kButtonTextStyle.copyWith(
                                      color: kSecondaryColor),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminProfile(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: kfillContainer,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 120.0,
                                  color: kSecondaryColor,
                                ),
                                Text(
                                  "Profile",
                                  style: kButtonTextStyle.copyWith(
                                      color: kSecondaryColor),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FloatingActionButton.extended(
                  label: Text(
                    "Test",
                    style: ktitleTextStyle,
                  ),
                  icon: Icon(Icons.qr_code_scanner_rounded),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessScreen(
                          uid: "",
                          auth: Auth(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
