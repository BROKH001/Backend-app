
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _code = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _age = TextEditingController();

  String? code;
  String? name;
  String? gender;
  String? age;
  List<String> listName = [];

  Future<void> setSharedPreferences() async {
    SharedPreferences setShare = await SharedPreferences.getInstance();
    setShare.setString('code', _code.text);
    setShare.setString('name', _name.text);
    setShare.setString('gender', _gender.text);
    setShare.setString('age', _age.text);
    
    getSharedPreferences();
  }

  Future<void> delete() async {
    final SharedPreferences deleting = await SharedPreferences.getInstance();
    deleting.remove('code');
    deleting.remove('name');
    deleting.remove('gender');
    deleting.remove('age');
    
    getSharedPreferences();
  }

  Future<void> getSharedPreferences() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    setState(() {
      code = shared.getString('code') ?? "";
      name = shared.getString('name') ?? "";
      gender = shared.getString('gender') ?? "";
      age = shared.getString('age') ?? "";
    });
  }
  @override
  void initState(){
    super.initState();
    getSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Shared Preference',
          style: GoogleFonts.pacifico(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 400,
                child: TextField(
                  controller: _code,
                  decoration: const InputDecoration(
                    hintText: 'Enter code',
                    prefixIcon: Icon(Icons.code_sharp),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 400,
                child: TextField(
                  controller: _name,
                  decoration: const InputDecoration(
                    hintText: 'Enter name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 400,
                child: TextField(
                  controller: _gender,
                  decoration: const InputDecoration(
                    hintText: 'Enter gender',
                    prefixIcon: Icon(Icons.all_inclusive),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 400,
                child: TextField(
                  controller: _age,
                  decoration: const InputDecoration(
                    hintText: 'Enter age',
                    prefixIcon: Icon(Icons.polymer),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setSharedPreferences();

                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 100,
                  color: Colors.amberAccent,
                  child: const Text('Save'),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              InkWell(
                onTap: () {
                  delete();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 100,
                  color: Colors.amberAccent,
                  child: const Text('Delete'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            width: 400,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25))
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Code: $code",
                      style: GoogleFonts.pacifico(
                        color: Colors.black87,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Name: $name",
                      style: GoogleFonts.pacifico(
                        color: Colors.black87,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Gender: $gender",
                      style: GoogleFonts.pacifico(
                        color: Colors.black87,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Age: $age",
                      style: GoogleFonts.pacifico(
                        color: Colors.black87,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
