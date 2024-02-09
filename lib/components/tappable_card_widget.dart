import 'package:flutter/material.dart';

class TappableCard extends StatelessWidget {
  final String label;
  final void Function() onTap;
  const TappableCard({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
      ),
    );
  }
}
