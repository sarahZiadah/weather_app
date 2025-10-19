import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  Search();

  String? cityName;

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
          width: 260,
          height: 42,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5.5),
              child: TextField(
                onSubmitted: (data){
                  cityName=data;
                  print(data);
                },
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "search",
                  hintStyle: TextStyle(color: Color(0xff8C8B8B)),
                ),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Color(0xff8C8B8B)),
            
          ),
        ),
      ],
    );
  }
}
