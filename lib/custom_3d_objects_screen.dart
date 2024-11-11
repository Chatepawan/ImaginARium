import 'package:flutter/material.dart';
// import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
// import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
// import 'package:ar_flutter_plugin/models/ar_node.dart';
// import 'package:ar_flutter_plugin/models/ar_anchor.dart';
// import 'package:vector_math/vector_math_64.dart' as vector64;

class Custom3dObjectsScreen extends StatefulWidget {
  const Custom3dObjectsScreen({Key? key}) : super(key: key);

  @override
  State<Custom3dObjectsScreen> createState() => _Custom3dObjectsScreenState();
}

class _Custom3dObjectsScreenState extends State<Custom3dObjectsScreen> {
  // ARSessionManager? sessionManager;
  // ARObjectManager? objectManager;
  // ARAnchorManager? anchorManager;

  // void whenARViewCreated(
  //     ARSessionManager arSessionManager,
  //     ARObjectManager arObjectManager,
  //     ARAnchorManager arAnchorManager,
  //     ARLocationManager arLocationManager) {
  //   sessionManager = arSessionManager;
  //   objectManager = arObjectManager;
  //   anchorManager = arAnchorManager;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom 3D Objects"),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Center(
          child: Text(
            "AR functionality is currently disabled.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // sessionManager?.dispose();
  }
}
