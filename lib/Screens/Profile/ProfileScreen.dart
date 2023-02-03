import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:tvis/Screens/LoginScreen.dart';
import 'package:tvis/Screens/Profile/ProfileDetailsScreen.dart';
import 'package:tvis/Screens/Profile/VechicalDetailsScreen.dart';
import 'package:tvis/constants.dart';
import 'package:tvis/Widgets/profileCard.dart';
import '../../Services/firebaseAuth.dart';
import '../Admin/AdminHomeScreen.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({required this.auth});
  final Auth auth;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  var dataLoaded = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 550), () {
      setState(() {
        dataLoaded = true;
      });
    });
    super.initState();
  }

  void signOut(BuildContext ctx) async {
    await widget.auth.signOut();
    if (ctx.mounted) {
      Fluttertoast.showToast(
        msg: "Signed Out Successfully",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.pushReplacement(
        ctx,
        MaterialPageRoute(
          builder: (context) => LoginScreen(
            auth: widget.auth,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return !dataLoaded ? Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      child: Container(
        height: 500.0,
        child: Lottie.asset('assets/animations/loading.json'),
      ),
    ):Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 32.0, 0.0, 0.0),
                child: Text(
                  'Profile',
                  style: kNameTextStyle,
                ),
              ),
              ProfileCard(
                auth: Auth(),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
                decoration: kBorder,
                child: Column(
                  children: [
                    //Profile option
                    Card(
                      elevation: 0.0,
                      child: ListTile(
                        leading: Icon(
                          Icons.account_circle,
                          size: 50.0,
                          color: kPrimaryColor,
                        ),
                        title: Text(
                          'Profile',
                          style: ktitleTextStyle,
                        ),
                        subtitle: Text('Manage Profile'),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileDetailsPage(
                                auth: Auth(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Vechical Option
                    Card(
                      elevation: 0.0,
                      child: ListTile(
                        leading: Icon(
                          Icons.no_crash_rounded,
                          size: 50.0,
                          color: kPrimaryColor,
                        ),
                        title: Text(
                          'Vehical Information',
                          style: ktitleTextStyle,
                        ),
                        subtitle: Text('Manage Vechical'),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => vehicleDetailsPage(
                                auth: Auth(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    //Sign Out
                    Card(
                      elevation: 0.0,
                      child: ListTile(
                        leading: Icon(
                          Icons.logout_rounded,
                          size: 50.0,
                          color: kPrimaryColor,
                        ),
                        title: Text(
                          'Sign Out',
                          style: ktitleTextStyle,
                        ),
                        subtitle: Text('Done'),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () => signOut(context),
                      ),
                    ),
                    Card(
                      elevation: 0.0,
                      child: ListTile(
                        leading: Icon(
                          Icons.logout_rounded,
                          size: 50.0,
                          color: kPrimaryColor,
                        ),
                        title: Text(
                          'Switch to Admin',
                          style: ktitleTextStyle,
                        ),
                        subtitle: Text('use admin app'),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminHomeScreen()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
