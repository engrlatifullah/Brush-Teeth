import 'package:brush_teeth/colors.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timetable/date_picker_timetable.dart';
import '../widget/reusable_button.dart';
import '../widget/reusable_textFormField.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedValue = DateTime.now();
  bool _isRunning = false;
  bool autoStart = false;
  final _controller = CountDownController();
  Map<int, String> month = {
    1: "Jan",
    2: "Feb",
    3: "Mar",
    4: "Apr",
    5: "May",
    6: "Jun",
    7: "Jul",
    8: "Aug",
    9: "Sept",
    10: "Oct",
    11: "Nov",
    12: "Dec",
  };



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: blueColor,
          title: const Text("Home"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        "FeedBack",
                        style: TextStyle(fontSize: 16),
                      ),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const ReusableTextFormField(
                            hintText: "Write feedback",
                            maxLine: 5,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ReusableButton(
                            title: "Send Feedback",
                            onTap: () {
                              Navigator.pop(context);
                            },
                            filled: true,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Center(
                child: CircularCountDownTimer(
                  duration: 120,
                  initialDuration: 0,
                  controller: _controller,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  ringColor: Colors.grey[300]!,
                  fillColor: blueColor,
                  strokeWidth: 20.0,
                  strokeCap: StrokeCap.round,
                  textStyle: const TextStyle(
                      fontSize: 33.0,
                      color: blueColor,
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.MM_SS,
                  isReverse: true,
                  isTimerTextShown: true,
                  autoStart: autoStart,
                  onStart: () {
                  },
                  onComplete: () {
                  },
                  onChange: (String timeStamp) {
                  },
                  timeFormatterFunction: (defaultFormatterFunction, duration) {

                      return Function.apply(
                          defaultFormatterFunction, [duration]);

                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                InkWell(
                  onTap: (){
                    _controller.pause();

                  },
                    child:  Icon(
                      Icons.pause ,
                  color: blueColor,
                  size: 40,
                )),
                InkWell(
                    onTap: (){
                        _controller.start();


                    },
                    child: const Icon(
                  Icons.start,
                  color: blueColor,
                  size: 40,
                )),
                InkWell(
                    onTap: (){
                        _controller.resume();


                    },
                    child: const Icon(
                  Icons.play_arrow,
                  color: blueColor,
                  size: 40,
                )),

                const Icon(Icons.save,size: 40,color: blueColor,)
              ],
            ),
            const SizedBox(height: 10),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "${month[_selectedValue.month]} ${_selectedValue.year}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 10),
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: blueColor,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                // New date selected
                setState(() {
                  _selectedValue = date;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
