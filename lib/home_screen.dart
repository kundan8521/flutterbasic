import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbasic/animations/ripple_animation.dart';
import 'package:flutterbasic/basic_widget/design_box.dart';
import 'package:flutterbasic/function/future_builder.dart';
import 'package:flutterbasic/function/stream_builder.dart';
import 'package:flutterbasic/google_map/google_map.dart';
import 'package:flutterbasic/image_picker/image_picker.dart';
import 'package:flutterbasic/pop_up_menu/option_menu.dart';
import 'package:flutterbasic/pop_up_menu/pop_up_menu.dart';
import 'package:flutterbasic/alert_dialog/show_dialog_2.dart';
import 'package:flutterbasic/data_passing/data_passing.dart';
import 'package:flutterbasic/tab_bar/tab.dart';

import 'alert_dialog/alert_dialog.dart';
import 'animations/tween_animation.dart';
import 'form_validation/form_validation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required bool isDarkMode,
    required void Function(bool isDark) onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormValidation()),
                    );
                  },
                  child: Text('Form Screen'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  child: Text("alert dialog"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShowDialog()),
                    );
                  },
                  child: Text("alert dialog"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Box()),
                    );
                  },
                  child: Text('Box'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TabExample()),
                    );
                  },
                  child: Text('Tab'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DataPassing()),
                    );
                  },
                  child: Text('Data Passing'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PopUpMenu()),
                    );
                  },
                  child: Text('Pop Menu Button'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Product(),));
                  },
                  child: Text('Future Function'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapScreen()),
                    );
                  },
                  child: Text('Google Map'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OptionMenu()),
                    );
                  },
                  child: Text('Option Menu'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BasicPractice()),
                    );
                  },
                  child: Text('Future builder'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BasicFunction()),
                    );
                  },
                  child: Text('Stream builder'),
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BasicFunction()),
                    );
                  },
                  child: Text('Next screen'),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>ImagePickerExample()),

                    );
                  },
                  child: Text('Image picker'),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>TweenAnimationDemo()),

                    );
                  },
                  child: Text('Tween Animation'),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>RippleAnimationDemo()),

                    );
                  },
                  child: Text('Ripple Animation'),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
