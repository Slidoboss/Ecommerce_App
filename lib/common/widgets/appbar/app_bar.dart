//import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;
  final double? height;
  const BasicAppbar(
      {this.title,
      this.hideBack = false,
      this.action,
      this.backgroundColor,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 60,
      title: title ??
          Text(
            '',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.black),
          ),
      titleSpacing: 0,
      actions: [action ?? Container()],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 213, 213, 213),
                    shape: BoxShape.circle),
                child: const Icon(Icons.arrow_back_ios_new,
                    size: 15, color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60);
}
