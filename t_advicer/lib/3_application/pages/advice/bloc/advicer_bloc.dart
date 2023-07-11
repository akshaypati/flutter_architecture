import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdvicerEvent>((event, emit) async {
      emit(AdvicerStateLoading());
      //execute business logic
      //for ex get and advice
      debugPrint('Fake get advice triggred');
      await Future.delayed(
        const Duration(seconds: 3),
        () {},
      );
      debugPrint('got advice');
      // emit(AdvicerStateLoaded(advice: 'fake advice to test advice bloc'));
      emit(AdvicerStateError(message: 'error message'));
    });
  }
}
