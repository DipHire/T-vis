import 'package:flutter/material.dart';
import 'package:tvis/Screens/Admin/AdminProfileScreen.dart';
import 'package:tvis/Screens/Admin/QRScanScren.dart';
import '../../constants.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
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
              child: Image.asset(
                "assets/images/logo.png",
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
                title: Text("Profile"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminProfile(),
                    ),
                  );
                }),
            ListTile(
              title: Text("Log Out"),
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
      body: SafeArea(
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
                    'Vechicals in campus',
                    style: ktitleTextStyle,
                  ),
                  subtitle: Text('Today'),
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
                              // controller: _qrIdController,
                              decoration: InputDecoration(
                                counterText: '',
                                prefixIcon: const Icon(Icons.numbers_outlined),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              // keyboardType: TextInputType.phone,
                              maxLength: 13,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {},
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
                          )),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
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
                  ],
                ),
              ),

              // FloatingActionButton.extended(
              //   label: Text(
              //     "Scan Qr",
              //     style: ktitleTextStyle,
              //   ),
              //   icon: Icon(Icons.qr_code_scanner_rounded),
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => QrScan(),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
