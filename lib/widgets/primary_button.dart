import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isInverse = false,
  });
  final String text;
  final VoidCallback onPressed;
  final bool isInverse;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isInverse
              ? Theme.of(context).cardColor
              : Theme.of(context).colorScheme.secondary,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 13,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: isInverse
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).cardColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryEmptyButton extends StatelessWidget {
  const PrimaryEmptyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 13,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
