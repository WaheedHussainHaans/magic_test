import 'package:flutter/material.dart';

class SelectionField extends StatelessWidget {
  const SelectionField({
    super.key,
    this.selectionOption,
    required this.onPressed,
    required this.headingText,
  });
  final String? selectionOption;
  final String headingText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RequiredHeadingText(
          text: headingText,
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: onPressed,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xffeeeff1),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    selectionOption == null ? "Select" : selectionOption!,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: selectionOption == null
                              ? Theme.of(context).unselectedWidgetColor
                              : null,
                        ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_sharp,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RequiredHeadingText extends StatelessWidget {
  final String? text;
  const RequiredHeadingText({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // text: TextSpan(
      //   text: '$text',
      //   style: Theme.of(context).textTheme.bodyText2,
      children: [
        Text(
          '$text',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          ' *',
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: Colors.red,
              ),
        ),
      ],
    );
  }
}
