import 'package:brush_teeth/screens/feedback_screen.dart';
import 'package:brush_teeth/screens/privacy_screen.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import 'about_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: blueColor,
          title: const Text("Settings"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: blueColor.withOpacity(0.1),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: blueColor.withOpacity(0.1),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: blueColor.withOpacity(0.2),
                            backgroundImage: const AssetImage("assets/dp.jpg"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      const Text(
                        "Ramzan",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children:   [
                      const ListTile(
                        leading: Icon(Icons.app_settings_alt_rounded,size: 40,),
                        title: Text(
                          "Appearance",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "Make ziar's your App",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const Divider(color: whiteColor,),
                      ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return const PrivacyScreen();
                          }));
                        },
                        leading: const Icon(Icons.privacy_tip,size: 40,),
                        title: const Text(
                          "Privacy",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                        ),
                        subtitle: const Text(
                          "Lock ziar's your App",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:   ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return const AboutScreen();
                      }));
                    },
                    leading: const Icon(Icons.info_outline,size: 40,),
                    title: const Text(
                      "About",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                    ),
                    subtitle: const Text(
                      "Learn more about ziar's App",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:   ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return const FeedbackScreen();
                      }));
                    },
                    leading: const Icon(Icons.messenger,size: 40,),
                    title: const Text(
                      "Send Feedback",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                    ),
                    subtitle: const Text(
                      "Let us know",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),

                const SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  const ListTile(
                    leading: Icon(Icons.logout_rounded,size: 40,),
                    title: Text(
                      "Sign out",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
