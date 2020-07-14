import 'package:e_blood/widgets/DonorWidget.dart';
import 'package:flutter/material.dart';

class DonorList extends StatefulWidget {
  @override
  _DonorListState createState() => _DonorListState();
}

final List<String> bloodGroups = ['All', 'A+', 'A-'];

class _DonorListState extends State<DonorList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return DonorWidget();
        });
  }
}
