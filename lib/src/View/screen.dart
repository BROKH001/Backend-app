import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class UIscreen extends StatefulWidget {
  const UIscreen({super.key});

  @override
  State<UIscreen> createState() => _UIscreenState();
}

class _UIscreenState extends State<UIscreen> {
  
  final TextEditingController _image = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _code = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _age = TextEditingController();

  final bool _checkCode = false;
  final bool _checkName = false;
  final bool _checkAge = false;
  final bool _checkGender = false;
  final bool _checkImage = false;
  File? _selectedImage;

  Future _PickImageFromCamera() async{
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(returnImage.path);
    });
  }

  Future _pickImageFromGallery() async{

    final returnImage = 
        await ImagePicker().pickImage(source: ImageSource.gallery);
    
    setState(() {
      _selectedImage = File(returnImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information",
          style: GoogleFonts.pacifico(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed:() {
              _pickImageFromGallery();
            },
            icon: const Icon(Icons.image),
          ),
          const SizedBox(width: 25,),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined),
          ),
          const SizedBox(width: 25,),

        ],
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 400,
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: _code,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.code,
                            color: Colors.amberAccent,
                          ),
                          labelText: "Code",
                          hintText: "Enter Code",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 400,
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: _name,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.nat,
                            color: Colors.amberAccent,
                          ),
                          labelText: "Name",
                          hintText: "Enter Name",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 400,
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: _gender,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.abc,
                            color: Colors.amberAccent,
                          ),
                          labelText: "Gender",
                          hintText: "Enter Gender",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 400,
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: _age,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.amberAccent,
                          ),
                          labelText: "Age",
                          hintText: "Enter Age",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 70,
                          width: 100,
                          color: Colors.green,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 70,
                          width: 100,
                          color: Colors.orange,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 70,
                          width: 100,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}