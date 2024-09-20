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
  
  final TextEditingController _code = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _gender = TextEditingController();

  final bool _checkCode = false;
  final bool _checkName = false;
  final bool _checkAge = false;
  final bool _checkGender = false;

  File? _selectedImage;

  Future _pickImageFromCamera() async{
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
            onPressed: () {
              _pickImageFromCamera();
            },
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
                      child: Image(image: AssetImage(_selectedImage!.path)),
                    ),
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
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.code,
                            color: Colors.amberAccent,
                          ),
                          labelText: "Code",
                          hintText: "Enter Code",
                          errorText: _checkCode ? "Please enter code!" : null,
                          border: const OutlineInputBorder(
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
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.nat,
                            color: Colors.amberAccent,
                          ),
                          labelText: "Name",
                          hintText: "Enter Name",
                          errorText: _checkName ? "Please enter name!" : null,
                          border: const OutlineInputBorder(
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
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.abc,
                            color: Colors.amberAccent,
                          ),
                          labelText: "Gender",
                          hintText: "Enter Gender",
                          errorText: _checkGender ? "Please enter name!" : null,
                          border: const OutlineInputBorder(
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
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.amberAccent,
                          ),
                          labelText: "Age",
                          hintText: "Enter Age",
                          errorText: _checkAge ? "Please enter name!" : null,
                          border: const OutlineInputBorder(
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
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Save", 
                                  style: GoogleFonts.pacifico(),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 70,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                              
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Update", 
                                  style: GoogleFonts.pacifico(),
                                ),
                              ],
                            ),
                          ),
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