import 'package:flutter/material.dart'; // For Color class

class Booking {
  final String title;
  final String imgPath;
  final String date;
  final String specialist;
  final String booked;
  final Color bookedColor;
  final String completed;
  final Color completedColor;
  final int rating;

  Booking({
    required this.title,
    required this.imgPath,
    required this.date,
    required this.specialist,
    required this.booked,
    required this.bookedColor,
    required this.completed,
    required this.completedColor,
    required this.rating
  });

  // Factory method to create a Booking object from JSON-like Map
  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      title: json['title'],
      imgPath: json['imgPath'],
      date: json['date'],
      specialist: json['specialist'],
      booked: json['booked'],
      bookedColor: json['bookedColor'], // Assuming ColorConstant is a Color
      completed: json['completed'],
      completedColor: json['completedColor'],
      rating: json['rating'] // Assuming ColorConstant is a Color
    );
  }

  // Method to convert Booking object back to JSON-like Map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imgPath': imgPath,
      'date': date,
      'specialist': specialist,
      'booked': booked,
      'bookedColor': bookedColor, // Assuming ColorConstant is a Color
      'completed': completed,
      'completedColor': completedColor, // Assuming ColorConstant is a Color
    };
  }
}
