import 'package:ecommerce_app/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce_app/data/auth/models/new_user_request.dart';
import 'package:ecommerce_app/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:ecommerce_app/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:ecommerce_app/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:ecommerce_app/presentation/auth/widgets/ages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAgePage extends StatelessWidget {
  const GenderAndAgePage({super.key, required this.newUserRequest});

  final NewUserRequest newUserRequest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppbar(),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => GenderSelectionCubit()),
            BlocProvider(create: (context) => AgeSelectionCubit()),
            BlocProvider(create: (context) => AgesDisplayCubit()),
          ],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _heading(context),
                      SizedBox(height: 28),
                      _genderSection(context),
                      SizedBox(height: 28),
                      _ageSection(context),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              _submitButton(context),
            ],
          ),
        ));
  }

  Widget _heading(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Tell us about yourself',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: const Color.fromARGB(255, 34, 34, 34)),
          ),
        ],
      ),
    );
  }

  Widget _genderSection(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Who do you shop for?',
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black54),
          ),
          SizedBox(height: 16),
          BlocBuilder<GenderSelectionCubit, int>(builder: (context, state) {
            return Row(
              children: [
                genderTile(context, 1, 'Men'),
                SizedBox(width: 16),
                genderTile(context, 2, 'Women'),
              ],
            );
          })
        ],
      ),
    );
  }

  Expanded genderTile(BuildContext context, int genderIndex, String gender) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: context.read<GenderSelectionCubit>().selectedIndex ==
                      genderIndex
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).highlightColor,
              borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Text(
              gender,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: context.read<GenderSelectionCubit>().selectedIndex ==
                            genderIndex
                        ? Colors.white
                        : Colors.black,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ageSection(BuildContext context) {
    return Column(
      children: [
        Text(
          'How old are you?',
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.black54),
        ),
        SizedBox(height: 16),
        BlocBuilder<AgeSelectionCubit, String>(builder: (context, state) {
          return GestureDetector(
            onTap: () {
              AppBottomsheet.display(
                context,
                MultiBlocProvider(//My inference for this additional mutlibloc provider is that Ages() is treated as another screen wrapped in another screen.
                  providers: [
                    BlocProvider.value(value: context.read<AgeSelectionCubit>()),
                    BlocProvider.value(value: context.read<AgesDisplayCubit>()..displayAges()),
                  ],
                  child: const Ages(),
                ),
              );
            },
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.black),
                  ),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          );
        })
      ],
    );
  }
}

Widget _submitButton(BuildContext context) {
  return Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 28),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(38),
            topRight: Radius.circular(38),
          )),
      child: Center(
        child: BasicAppButton(
          onPressed: () {},
          title: 'Submit',
        ),
      ));
}
