// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';

// void main(){
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String? filePath;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(),
//         body: Column(children: [
//           ElevatedButton(onPressed: ()async{
//             final file = await FilePicker.platform.pickFiles(
//               allowMultiple: true,
//               // allowedExtensions: ["png","jpg"],
//               type: FileType.image,
//             );
//             setState(() {
//               filePath =file!.paths[0];
//             });
//           }, child: Text("Pick file"),),
//           filePath!= null? Image.file(File(filePath!)):SizedBox(),
//         ],)
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? filePath;
  Uint8List? imageBytes;
  String? b64;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final file = await FilePicker.platform.pickFiles(
                    allowMultiple: true,
                    // allowedExtensions: ["png","jpg"],
                    type: FileType.image,
                  );
                  setState(() {
                    // imageBytes = file!.files.single.bytes;
                    imageBytes = File(file!.files.single.path!).readAsBytesSync();
                  });
                },
                child: Text("Pick file"),
              ),
              imageBytes!= null? Image.memory(Uint8List.fromList(base64Decode(b64!))): SizedBox(),
            ],
          )),
    );
  }
}
