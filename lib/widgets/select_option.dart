import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_test/widgets/default_appbar.dart';
import 'package:magic_test/widgets/right_checkbox_tile.dart';

class SelectOptionWidget extends StatefulWidget {
  final List<String> options;
  final String? selectedOption;
  final String appbarTitle;
  const SelectOptionWidget(
      {Key? key,
      required this.options,
      this.selectedOption,
      required this.appbarTitle})
      : super(key: key);

  @override
  State<SelectOptionWidget> createState() => _SelectOptionWidgetState();
}

class _SelectOptionWidgetState extends State<SelectOptionWidget> {
  String selectedOption = '';
  @override
  void initState() {
    if (widget.selectedOption != null) {
      selectedOption = widget.selectedOption!;
      setState(() {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        leading: TextButton(
          onPressed: () {},
          child: const Text('Cancel'),
        ),
        title: widget.appbarTitle,
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                Get.back(result: selectedOption);
              },
              child: Text(
                'Save',
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.builder(
          itemCount: widget.options.length,
          itemBuilder: ((context, index) {
            String category = widget.options[index];
            return InkWell(
              onTap: () {
                setState(() {
                  selectedOption = category;
                });
              },
              child: RightCheckBoxTile(
                text: category.capitalizeFirst ?? category,
                isSelected: selectedOption == category,
              ),
            );
          }),
        ),
      ),
    );
  }
}
