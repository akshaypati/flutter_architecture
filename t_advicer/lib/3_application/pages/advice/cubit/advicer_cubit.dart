import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:t_advicer/1_domain/entities/advice_entity.dart';
import 'package:t_advicer/1_domain/failures/failures.dart';
import 'package:t_advicer/1_domain/usecases/advice_usecases.dart';

part 'advicer_state.dart';

const generalFailureMessage = 'Ups somthing went wrong , Please try again';
const serverFailureMessage = 'Ups Api error , Please try again';
const casheFailureMessage = 'Ups cashe failed , Please try again';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerInitial());

  final AdviceUseUsecases adviceUseUsecases = AdviceUseUsecases();
  //could also use other usecases

  void AdviceRequested() async {
    emit(AdvicerStateLoading());
    final failureOrAdvice = await adviceUseUsecases.getAdvice();
    failureOrAdvice.fold(
      (failure) =>
          emit(AdvicerStateError(message: _mapfailureToMessage(failure))),
      (advice) => emit(AdvicerStateLoaded(advice: advice.advice)),
    );
  }

  String _mapfailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CasheFailure:
        return casheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
