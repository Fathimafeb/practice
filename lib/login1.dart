import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'datepicker.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final formkey=GlobalKey<FormState>();
  var user=TextEditingController();
  var pass=TextEditingController();

  login()async{
    SharedPreferences spref = await SharedPreferences.getInstance();
    var user1=spref.getString('Username');
    var pass1=spref.getString('Password');
    if(user1==user.text && pass1==pass.text)
      {
     Navigator.push(context, MaterialPageRoute(builder: (context) => Datepicker(),));
      }
    else{
      print('doesnt match');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Form(
          key: formkey,
          child: Center(
            child:Column(
              children: [
                Text("Login"),
                SizedBox(height: 50,),
                Text("Username"),
                Container(height: 100,width: 300,child: TextFormField(controller:user,
                  validator: (value) {
                    if (value == null|| value.isEmpty){
                      return 'empty';
                    }
                  },),),
                Text("Password"),
                Container(height: 100,width: 300,child: TextFormField(controller:pass,
                validator: (value) {
                  if (value == null|| value.isEmpty){
                    return 'empty';
                  }
                },),),
                ElevatedButton(onPressed: (){
                  if (formkey.currentState!.validate()){
                    login();

                  }
                }, child: Text("Submit"))
              ],
            ),
          ),
        ),
      )
    );
  }
}
