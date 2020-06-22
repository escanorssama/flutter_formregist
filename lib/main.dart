import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RegisterForm(),
    );
  }
}


class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}
class _RegisterFormState extends State<RegisterForm> {
  List<String> _agama = ['Islam', 'Kristen', 'Budha', 'Hindhu',
    'Konghucu'];
  String _nAgama ;
  int _groupValue1 = 0;
  TextEditingController nama = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController moto = TextEditingController();

  void data (){
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        child: Container(
          child: Column(
            children: [
              Text("nama anda adalah : ${nama.text}"),
              Text("pass anda adalah : ${pass.text}"),
              Text("moto anda adalah : ${moto.text}"),
              Text("kelamin anda adalah : $_groupValue1"),
              Text("moto anda adalah : $_agama"),

            ],
          ),
        ),
      ),
    );
    showDialog(context: context,child: alertDialog);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Form"),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: nama,
                  decoration: InputDecoration(
                    hintText: 'Nama Lengkap',

                  ),
                ),
                TextFormField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',

                  ),
                ),
                TextFormField(
                  controller: moto,
                  minLines: 3,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Moto Hidup',

                  ),
                ),
                Row(children: <Widget>[
                  Radio(
                    onChanged: (int i) {
                      setState(() {
                        _groupValue1 = i;
                      });
                    },
                    value: 0,
                    groupValue: _groupValue1,),
                  Text('Lak-laki'),
                  Radio(
                    onChanged: (int i) {
                      setState(() {
                        _groupValue1 = i;
                      });
                    },
                    value: 1,
                    groupValue: _groupValue1,),
                  Text('Perempuan'),
                ],),
                Text("Agama : ", style : TextStyle(color: Colors.brown,
                    fontSize: 16.0)),
                DropdownButtonFormField(
                  onChanged: (String value) {
                    setState(() {
                      _nAgama = value;
                    });
                  },
                  value: _nAgama,
                  items: _agama.map((String value) {
                    return DropdownMenuItem(child: Text(value), value:
                    value,);
                  }).toList(),
                ),
                MaterialButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text("Submit"),
                  onPressed: () {
                    data();
                  },
                )
              ],
            ),
          )
      ),
    );
  }

}
