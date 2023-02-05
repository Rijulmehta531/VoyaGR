// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ParallaxCard extends StatefulWidget {
  const ParallaxCard({
    Key? key,
    this.width,
    this.height,
    this.foregroundImages,
    this.backgroundImages,
    this.texts,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String>? foregroundImages;
  final List<String>? backgroundImages;
  final List<String>? texts;

  @override
  _ParallaxCardState createState() => _ParallaxCardState();
}

class _ParallaxCardState extends State<ParallaxCard> {
  double? accelerometerXAxis;
  StreamSubscription<dynamic>? accelerometerListener;
  late final List<String> foregroundImages;
  late final List<String> backgroundImages;
  late final List<String> texts;

  @override
  void initState() {
    super.initState();
    foregroundImages = widget.foregroundImages ??
        [
          'https://user-images.githubusercontent.com/71979346/216753936-88349ff3-6868-4f90-b052-f0751658571a.png'
        ];
    backgroundImages = widget.backgroundImages ??
        [
          'https://user-images.githubusercontent.com/71979346/216753168-66998c29-791a-4d20-a665-495b082c9433.jpg'
        ];
    texts = widget.texts ?? ['New York'];
    accelerometerListener = accelerometerEvents.listen(
      (AccelerometerEvent event) {
        setState(() {
          accelerometerXAxis = event.x;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    accelerometerListener?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: widget.height,
        viewportFraction: 0.80,
        enableInfiniteScroll: false,
      ),
      items: foregroundImages.asMap().entries.map((entry) {
        int index = entry.key;
        String foregroundImage = entry.value;

        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background Image
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 100),
                      right: accelerometerXAxis != null
                          ? (-350 + accelerometerXAxis! * 30)
                          : -350,
                      child: Image.network(
                        backgroundImages[index],
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    // Foreground Image
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 100),
                      width: 320,
                      bottom: -60,
                      right: accelerometerXAxis != null
                          ? (-13 + accelerometerXAxis! * 1.5)
                          : -13,
                      child: Image.network(
                        foregroundImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    // Text (Country name)
                    Column(
                      children: [
                        const SizedBox(height: 60),
                        const Text(
                          'EXPLORE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          texts[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
