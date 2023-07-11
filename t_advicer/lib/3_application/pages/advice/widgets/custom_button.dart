import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:t_advicer/3_application/pages/advice/bloc/advicer_bloc.dart';
import 'package:t_advicer/3_application/pages/advice/cubit/advicer_cubit.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return InkResponse(
      onTap: () =>
          // BlocProvider.of<AdvicerBloc>(context).add(AdviceRequestedEvent()),
          // BlocProvider.of<AdvicerCubit>(context).add(AdviceRequestedEvent()),
          BlocProvider.of<AdvicerCubit>(context).AdviceRequested(),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: themedata.colorScheme.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Text(
              'Get Advice',
              style: themedata.textTheme.headlineLarge,
            ),
          ),
        ),
      ),
    );
  }
}
