import 'package:flutter/material.dart';

class RightCheckBoxTile extends StatelessWidget {
  const RightCheckBoxTile(
      {Key? key, required this.text, required this.isSelected})
      : super(key: key);
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(color: Theme.of(context).primaryColor, width: 5)
                  : Border.all(
                      color: Theme.of(context).unselectedWidgetColor,
                      width: 1,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
