import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home),
  Destination('Categories', Icons.category),
  Destination('Accounts', Icons.monetization_on_sharp),
  Destination('Settings', Icons.settings)
];
