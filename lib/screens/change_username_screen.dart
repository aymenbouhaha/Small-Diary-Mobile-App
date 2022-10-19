import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_diary_app/controllers/user_controller.dart';

class ChangeUserNameScreen extends StatefulWidget {
  const ChangeUserNameScreen({Key? key}) : super(key: key);


  @override
  State<ChangeUserNameScreen> createState() => _ChangeUserNameScreenState();
}

class _ChangeUserNameScreenState extends State<ChangeUserNameScreen> {

  final UserController _userController = Get.find(tag: "user_controller");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(onChanged: (value){
                if (value !=""){
                  _userController.changeUsername(value);
                }
              },),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    Get.back();
                  },
                  child: Text("change_username".tr)
              )
            ],
          ),
        ),
      ),
    );
  }
}
