import 'package:flutter/material.dart';

class CatAttribute extends StatelessWidget {
  const CatAttribute(
      {super.key, required this.attribute, required this.description});

  final String attribute;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$attribute: ',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          TextSpan(
            text: description,
            style: Theme.of(context).textTheme.titleMedium!,
          ),
        ],
      ),
    );
  }
}
