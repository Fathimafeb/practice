import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login1.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  var user=TextEditingController();
  var pass=TextEditingController();

  Future<void> reg() async{
    final spref= await SharedPreferences.getInstance();
    spref.setString('Username',user.text);
    spref.setString('Password', pass.text);

    var sn=spref.getString("Username");
    var sp=spref.getString("Password");
    print(sn);
    print(sp);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return login();
    },));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Text("register"),
          SizedBox(height: 50,),
          Text('Username'),
          TextFormField(
            controller: user,
          ),
          TextFormField(
            controller: pass,
          ),
          ElevatedButton(onPressed: (){
            reg();
          }, child:Text('Submit'))
        ],
      ),


    );
  }
}
