import 'package:clean_code_with_bloc/config/color/colors.dart';
import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;

  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.cloud_off, color: AppColors.redColor, size: 50),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: Text(
              'We are Unable to show results.\nPlease Check your data\nconnection.',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(fontSize: 20),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onPress,
          child: Text('Retry', style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    );
  }
}
