import 'package:flutter/material.dart';
// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';

class Custom3dARCore extends StatefulWidget {
  const Custom3dARCore({Key? key}) : super(key: key);

  @override
  State<Custom3dARCore> createState() => _Custom3dARCoreState();
}

class _Custom3dARCoreState extends State<Custom3dARCore> {
  // void whenARCoreViewCreated(ArCoreController arCoreController) {
  //   // ARCore initialization code here
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("3D Objects"),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Center(
          child: Text(
            "ARCore functionality is currently disabled.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
