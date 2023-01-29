import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HumidityWidget extends StatelessWidget {
  const HumidityWidget({Key? key, required this.humidity }) : super(key: key);
  final double humidity;

  @override
  Widget build(BuildContext context) {
    return GlassContainer.clearGlass(
      borderRadius: BorderRadius.circular(10),
      borderColor: Colors.transparent,
      height: 180,
      blur: 30,
      width: 190,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Humidité',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Expanded(
            child: SizedBox(
              height: 150,
              child: SfRadialGauge(axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Text(
                          '$humidity %',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.5)
                  ],
                  pointers: <GaugePointer>[
                    MarkerPointer(
                        color: Colors.orange,
                        value: humidity.toDouble())
                  ],
                  radiusFactor: 1,
                  startAngle: 180,
                  centerX: 0.5,
                  endAngle: 0,
                  showAxisLine: false,
                  showLabels: true,
                  showTicks: false,
                  axisLabelStyle:
                  GaugeTextStyle(fontSize: 15, color: Colors.white),
                  ranges: <GaugeRange>[
                    GaugeRange(
                        gradient: const SweepGradient(
                          colors: <Color>[Color(0xFF3E83C4), Color(0xFF7D61C2)],
                          stops: <double>[0.25, 0.75],
                        ),
                        startValue: 0,
                        endValue: 50),
                    GaugeRange(
                        gradient: const SweepGradient(
                          colors: <Color>[Color(0xFF7D61C2), Color(0xFFC14F9D)],
                          stops: <double>[0.25, 0.75],
                        ),
                        startValue: 50,
                        endValue: 100)
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    );

  }
}