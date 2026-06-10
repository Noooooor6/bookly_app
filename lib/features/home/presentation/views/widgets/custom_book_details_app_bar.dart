import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBookDetailesAppBar extends StatelessWidget {
  const CustomBookDetailesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.xmark, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.cartShopping, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
