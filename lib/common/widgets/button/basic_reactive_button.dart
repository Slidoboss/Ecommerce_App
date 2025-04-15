import 'package:ecommerce_app/common/bloc/button/button_state.dart';
import 'package:ecommerce_app/common/bloc/button/button_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicReactiveButton extends StatelessWidget {
  const BasicReactiveButton(
      {required this.onPressed,
      this.title = '',
      this.height,
      this.width,
      super.key});

  final VoidCallback onPressed;
  final String title;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonStateCubit, ButtonState>(
      builder: (context, state) {
        if (state is ButtonLoadingState) {
          return button(
              context,
              const CircularProgressIndicator(
                color: Colors.white,
              ));
        }
        if (state is ButtonSuccessState) {
          return button(
              context,
              Icon(
                Icons.done_outlined,
                size: 24,
                color: Colors.white,
              ));
        }
        if (state is ButtonFailureState) {
          return button(
              context,
              const Icon(
                Icons.highlight_remove,
                size: 24,
                color: Colors.white,
              ));
        }

        return button(
            context,
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ));
      },
    );
  }

  Widget button(BuildContext context, Widget mainContent) {
    return FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          minimumSize:
              Size(width ?? MediaQuery.of(context).size.width, height ?? 56),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: mainContent);
  }
}
