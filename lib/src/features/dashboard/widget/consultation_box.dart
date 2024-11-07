import 'package:flutter/material.dart';

class ConsultationBox extends StatelessWidget {
  const ConsultationBox(
      {super.key,
      required this.count,
      required this.title,
      required this.color});
  final String count;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 70,
      padding: const EdgeInsets.only(left: 18),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            count,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 21.0,
                fontFamily: "ReadexPro",
                fontWeight: FontWeight.bold,
                color: Color(0xff6EDFCB)),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 17.0,
                fontFamily: "ReadexPro",
                fontWeight: FontWeight.w300,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
