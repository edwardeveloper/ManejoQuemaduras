import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyectoaula/constants/colors.dart';

// ignore: must_be_immutable
class SuppliesTasks extends StatelessWidget {
  bool _isDark;
  final String title;
  final String description;
  final String imageUrl;

  SuppliesTasks({
    key,
    this.title,
    this.description,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;

    return Card(
      // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      // Set the clip behavior of the card
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.only(top: 25.0, bottom: 25.0, left: 25.0, right: 25.0),
      elevation: 0,
      color: _isDark
          ? kBackgroundColor.withOpacity(0.2)
          : Color.fromARGB(255, 151, 142, 142).withOpacity(0.2),
      // Define the child widgets of the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
          Image.asset(
            imageUrl,
            height: 310,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // Add a container with padding that contains the card's title, text, and buttons
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Display the card's title using a font size of 24 and a dark grey color
                Text(
                  title + ' ' + description,
                  style: GoogleFonts.ubuntu(
                    fontSize: 20,
                    color: _isDark
                        ? kBackgroundColor.withOpacity(0.8)
                        : Colors.black.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Add a space between the title and the text
                Container(height: 10),
              ],
            ),
          ),
          // Add a small space between the card and the next widget
          Container(height: 5),
        ],
      ),
    );
  }
}
