import 'package:flutter/material.dart';
import 'package:travel_app/features/destination/domain/entities/destination_entity.dart';

class DetailDestinationPage extends StatefulWidget {
  const DetailDestinationPage({super.key, required this.destination});

  final DestinationEntity destination;

  @override
  State<DetailDestinationPage> createState() => _DetailDestinationPageState();
}

class _DetailDestinationPageState extends State<DetailDestinationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        widget.destination.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(
          left: 20,
          top: MediaQuery.of(context).padding.top,
        ),
        child: const Row(
          children: [
            BackButton(),
          ],
        ),
      ),
    );
  }
}
