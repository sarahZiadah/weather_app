import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  Search();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 78),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          width: 255,
          height: 42,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "search",
              style: TextStyle(
                color: Color(0xff8C8B8B),
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.search, color: Color(0xff8C8B8B)),
        ),
      ],
    );
  }
}
