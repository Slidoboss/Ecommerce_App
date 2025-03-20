import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:ecommerce_app/presentation/auth/bloc/ages_display_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (context, state) {
          switch (state) {
            case AgesLoading():
              return Center(child: CircularProgressIndicator());
            case AgesLoaded():
              return _ages(state.ages);
            case AgesLoadFailure():
              return Center(
                  child: Text(
                state.message,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.black),
              ));
            default:
              return SizedBox();
          }
        },
      ),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      itemCount: ages.length,
      itemBuilder: (context, index) {
        return Center(
          child: Text(
            ages[index].data()['value'],
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
