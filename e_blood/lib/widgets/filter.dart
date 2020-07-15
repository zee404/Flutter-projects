import 'package:e_blood/Shared/Constant.dart';
import 'package:e_blood/widgets/DonorList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';

class FilterSearch extends StatefulWidget {
  @override
  _FilterSearchState createState() => _FilterSearchState();
}

const kGoogleApiKey = "AIzaSyARB9mT5xi8Xemu8H7acef0w7POwS1icDU";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class _FilterSearchState extends State<FilterSearch> {
  final List<String> bloodGroupsList = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    '0+',
    '0-'
  ];

//formvalues
  String _currentName;
  String _currentSugars;
  final List<String> cities = [
    'Abbottabad',
    'Mansehra',
    'Haripur',
  ];

  String _citiesValue = '';
  String _currentBloodgroup;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height * 0.09,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      //  / color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            height: deviceSize.height * 0.085,
            width: deviceSize.width * 0.4,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: DropdownButtonFormField(
                iconSize: 25.0,
                iconEnabledColor: Colors.green,
                decoration: textInputDecoration.copyWith(),
                hint: Text(
                  'Blood Group ',
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                value: _currentSugars,
                items: bloodGroupsList.map((bloodType) {
                  return DropdownMenuItem(
                    value: bloodType,
                    child: Text(
                      bloodType,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (val) => setState(() => _currentSugars = val),
              ),
            ),
          ),
          SizedBox(
            width: deviceSize.width * 0.07,
          ),
          Container(
            height: deviceSize.height * 0.085,
            width: deviceSize.width * 0.5,
            child: TextFormField(
              decoration: textInputDecoration.copyWith(
                hintText: 'Enter City',
              ),
              cursorColor: Colors.white,
              onTap: () async {
                Prediction p = await PlacesAutocomplete.show(
                    context: context,
                    apiKey: kGoogleApiKey,
                    mode: Mode.overlay, // Mode.fullscreen
                    language: "fr",
                    components: [new Component(Component.country, "fr")]);
              },
            ),
          )
        ],
      ),
    );
  }

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);

      var placeId = p.placeId;
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      var address = await Geocoder.local.findAddressesFromQuery(p.description);

      print(lat);
      print(lng);
    }
  }
}
