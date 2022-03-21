import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Icon(
              Icons.error,
              size: 48,
              color: Colors.red,
            ),
          ),
          Text(
            "Error!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
          ),
        ],
      ),
    );
  }
}
