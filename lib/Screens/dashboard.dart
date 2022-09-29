import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

Future<void> editProduct(int rewardpoints,String id) async {
  await FirebaseFirestore.instance
      .collection("UserData")
      .doc(id)
      .update({"points": FieldValue.increment(rewardpoints)});
}


class _DashboardScreenState extends State<DashboardScreen> {

  String qrCode = "";

  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller){
    setState(() {
      _markers.add(
          Marker(markerId: MarkerId("id-1"), position: LatLng(52.953755526209385, -1.1492777772647065)));
      _markers.add(
          Marker(markerId: MarkerId("id-2"), position: LatLng(52.94974328033889, -1.154731184459919)));
      _markers.add(
          Marker(markerId: MarkerId("id-3"), position: LatLng(52.95027717293463, -1.1524622469203778)));
    });
  }

  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _currentPosition = CameraPosition(
    target: LatLng(52.954803627682566, -1.1560645675303611),
    zoom: 10,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Find and scan codes")),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white70,
      body:  SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(child: Text("Locations of Nottingham historical sites" ,textAlign: TextAlign.center, style: TextStyle(fontSize: 30.0, color: Colors.black, fontWeight: FontWeight.bold))),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(style: BorderStyle.solid , color: Colors.pink, width: 3.0),

              ),
              height: MediaQuery.of(context).size.height * 0.6,
              width:  MediaQuery.of(context).size.width * 0.8,
              child: GoogleMap(
                  initialCameraPosition: _currentPosition,
                  onMapCreated: _onMapCreated,
                  markers: _markers
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ButtonTheme(
                minWidth: 400,
                height: 50,

                child: RaisedButton(onPressed: () =>
                {scanQR()},
                  child: const Text('Scan Qr Code', style: TextStyle(fontSize: 20)),
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  textColor: Colors.white,
                  elevation: 5,
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  Future<void> scanQR() async {
    final qrCode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "cancel", true, ScanMode.QR);

    if (!mounted) return;
    setState(() {
      this.qrCode = qrCode;
      var rewardpoints = int.parse(qrCode);
      editProduct(rewardpoints, "Retbz1GVhWYBQIvINk7Zm5V1mHG3");

    });
  }
}




