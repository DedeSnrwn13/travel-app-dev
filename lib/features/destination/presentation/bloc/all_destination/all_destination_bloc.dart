import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/destination/domain/entities/destination_entity.dart';
import 'package:travel_app/features/destination/domain/usecases/get_all_destination_usecase.dart';

part 'all_destination_event.dart';
part 'all_destination_state.dart';

class AllDestinationBloc extends Bloc<AllDestinationEvent, AllDestinationState> {
  final GetAllDestinationUsecase useCase;

  AllDestinationBloc(this.useCase) : super(AllDestinationInitial()) {
    on<onGetAllDestination>((event, emit) async {
      emit(AllDestinationLoading());

      final result = await useCase.call();
      result.fold(
        (failure) => emit(AllDestinationFailure(failure.message)),
        (data) => emit(AllDestinationLoaded(data)),
      );
    });
  }
}
