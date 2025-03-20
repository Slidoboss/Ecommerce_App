import 'package:ecommerce_app/domain/auth/usecases/get_ages.dart';
import 'package:ecommerce_app/presentation/auth/bloc/ages_display_states.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(AgesLoading());

  Future<void> displayAges() async {
    var returnedData = await getIt<GetAgesUseCase>().call();

    returnedData.fold((error) {
      emit(AgesLoadFailure(message: error));
    }, (data) {
      emit(AgesLoaded(ages: data));
    });
  }
}
