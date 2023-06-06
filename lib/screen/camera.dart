import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:globalidoc/main.dart';

// ignore: must_be_immutable
class ImagePreview extends StatefulWidget {
 ImagePreview(this.file,{super.key});
 XFile file;

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    File picture= File(widget.file.path);
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar( 
        iconTheme: const IconThemeData(
            color: Colors.black,
            size: 30,
                  ),
        title: const Text(
        "Image Preview",
        style: TextStyle(
          color: Colors.black,
        ),),
        backgroundColor: const Color.fromARGB(192, 233, 232, 232),),
        body: Center(
          child: Image.file(picture),
        ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer ({super.key});

  @override
  Widget build(BuildContext context)=> Drawer(
    child: SingleChildScrollView(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
         buildHeader(context),
         buildMenuItems(context),
        ],
      ) ),
  );
  Widget buildHeader(BuildContext context)=>Container(
    color: Colors.grey.shade700,
    padding: EdgeInsets.only(
     top: MediaQuery.of(context).padding.top,
    ),
  );

  Widget buildMenuItems(BuildContext context)=> Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16 ,
      children: [
        ListTile(
          leading: const Icon(Icons.party_mode_outlined),
          title: const Text("Retake Picture"),
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context)=>const CameraWidget()));
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          leading: const Icon(Icons.history_edu),
          title: const Text("Signature"),
          onTap: (){
             Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context)=>const NotifiySignatureWidget()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.refresh_outlined),
          title: const Text("Redo Signature"),
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=>const SignatureWidget()));
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          leading: const Icon(Icons.check),
          title: const Text("Done"),
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=>const FinalWidget()));
          },
        ),
      ],
    ),
  );
}