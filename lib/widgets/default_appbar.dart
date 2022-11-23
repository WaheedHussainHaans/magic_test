import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showCrossIcon;
  final Color? backgroundColor;
  final bool showEditButton;
  final VoidCallback? onEditTapped;
  final bool showBottomBorder;
  final PreferredSizeWidget? bottomWidget;
  const DefaultAppBar({
    Key? key,
    this.title,
    this.showBackButton = true,
    this.actions,
    this.leading,
    this.showCrossIcon = false,
    this.backgroundColor,
    this.showEditButton = false,
    this.onEditTapped,
    this.showBottomBorder = true,
    this.bottomWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          backgroundColor ?? Theme.of(context).appBarTheme.foregroundColor,
      elevation: 0,
      leadingWidth: showBackButton ? 32 : null,
      leading: showBackButton
          ? Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: InkWell(
                onTap: () => Get.back(),
                child: Image.asset(
                  'assets/back.png',
                  height: 12,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            )
          : leading,
      title: Text(
        '$title',
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      actions: showEditButton
          ? [
              TextButton(
                onPressed: onEditTapped,
                child: Text(
                  "Edit",
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
              ),
            ]
          : actions,
      bottom: bottomWidget,
      flexibleSpace: showBottomBorder
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  width: Get.width,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ],
            )
          : null,
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}

///