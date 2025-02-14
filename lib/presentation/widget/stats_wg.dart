import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';

class StatsWidget extends StatelessWidget {
  final List<Map<String, String>> stats = [
    {'value': '1', 'label': 'Año de experiencia'},
    {'value': '1K', 'label': 'Personas capacitadas'},
    {'value': '1K', 'label': 'Descuentos otorgados'},
    {'value': '34', 'label': 'Ciudades atendidas'},
    {'value': '2', 'label': 'Programas'},
  ];

  StatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Icon(
                Icons.keyboard_double_arrow_left_rounded,
                size: 50,
              ),
              SizedBox(width: size.width * 0.06),
              Row(
                  spacing: 4.0,
                  children: stats.map((stat) => StatItem(stat: stat)).toList()),
              SizedBox(width: size.width * 0.06),
              Icon(
                Icons.keyboard_double_arrow_right_rounded,
                size: 50,
              ),
            ],
          ),
        );
        // : content;
      },
    );
  }
}

class StatItem extends StatelessWidget {
  final Map<String, String> stat;

  const StatItem({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 4.0,
        children: [
          Text(
            stat['value']!,
            style: statsTextStyle,
          ),
          Text(
            stat['label']!,
            style: subtitleTextStyle,
            textAlign: TextAlign.center,
          ),
          Container(
            width: 70,
            height: 2,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
