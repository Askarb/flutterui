import 'package:flutter/material.dart';

class CarModel {
  final String image, title, transmission, speed, owner, price;
  final Color color;

  CarModel({
    required this.color,
    required this.title,
    required this.transmission,
    required this.speed,
    required this.owner,
    required this.price,
    required this.image,
  });
}
