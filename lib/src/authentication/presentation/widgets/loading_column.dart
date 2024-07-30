import 'package:flutter/material.dart';

class LoadingColumn extends StatelessWidget {
  const LoadingColumn({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          const SizedBox(height: 10),
          Text('$message...'),
        ],
      ),
    );
  }
}
