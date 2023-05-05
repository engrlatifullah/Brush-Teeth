import 'package:brush_teeth/widget/reusable_button.dart';
import 'package:brush_teeth/widget/reusable_textFormField.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blueColor,
          title: const Text("Feedback"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const ReusableTextFormField(
                  hintText: "Write feedback",
                  maxLine: 5,

                ),
                const SizedBox(height: 20,),
                ReusableButton(title: "Send Feedback",onTap: (){},filled: true,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
