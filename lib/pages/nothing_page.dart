import 'package:flutter/material.dart';
import 'package:weather_app/component/search.dart';
import 'package:weather_app/models/weather_model.dart';

class NothingPage extends StatefulWidget {
  final Function(WeatherModel) onSearch; 
  const NothingPage({super.key, required this.onSearch});
  
  @override
  State<NothingPage> createState() => _NothingPageState();
}

class _NothingPageState extends State<NothingPage> {
  bool showSearch = false;
  bool moveUp = false;
  bool hideText = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() => hideText = true);

      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() => showSearch = true);

        Future.delayed(const Duration(seconds: 1), () {
          setState(() => moveUp = true);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: hideText ? 0 : 1,
              child: const Text(
                "Nothing to show yet\nStart by searching for a location",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.4,
                ),
              ),
            ),
          ),

          AnimatedAlign(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            alignment: moveUp ? Alignment.topCenter : Alignment.center,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: showSearch ? 1 : 0,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Search(onSearch: widget.onSearch),
              ),
            ),
          ),
        ],
      ),
    );
  }
}