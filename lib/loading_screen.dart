import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'data_screen.dart';
import 'network.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Network network = Network();
    var decodedData = await network.getRandomData();

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return DataScreen(randomData: decodedData,);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return const SpinKitThreeInOut(
      color: Colors.blue,
      size: 150.0,
    );
  }
}



