import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class RainWidget extends StatelessWidget {
  const RainWidget({Key? key, required this.rainLastHour}) : super(key: key);
  final double rainLastHour;
  @override
  Widget build(BuildContext context) {
    return GlassContainer.clearGlass(
      borderRadius: BorderRadius.circular(10),
      alignment: Alignment.center,
      borderColor: Colors.transparent,
      height: 180,
      blur: 30,
      width: 190,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Pluie',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          rainLastHour != null
              ? Text(
            '$rainLastHour mm',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
              : const Flexible(
            child: Center(
              child: Text(
                '0 mm',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text('mm de pluies sur les 3 dernières heures',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );

  }
}