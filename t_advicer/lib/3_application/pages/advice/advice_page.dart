import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:t_advicer/3_application/core/services/theme_service.dart';
// import 'package:t_advicer/3_application/pages/advice/bloc/advicer_bloc.dart';
import 'package:t_advicer/3_application/pages/advice/cubit/advicer_cubit.dart';
import 'package:t_advicer/3_application/pages/advice/widgets/advice_widget.dart';
import 'package:t_advicer/3_application/pages/advice/widgets/custom_button.dart';
import 'package:t_advicer/3_application/pages/advice/widgets/error_message.dart';
import 'package:t_advicer/injection.dart';

class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => AdvicerBloc(),
      create: (context) => sl<AdvicerCubit>(),
      child: const AdvicerPage(),
    );
  }
}

class AdvicerPage extends StatelessWidget {
  const AdvicerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advicer',
          style: themedata.textTheme.displaySmall,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
              child: Center(
                // child: BlocBuilder<AdvicerBloc, AdvicerState>(
                child: BlocBuilder<AdvicerCubit, AdvicerCubitState>(
                  builder: (context, state) {
                    if (state is AdvicerInitial) {
                      return Text(
                        'Your advice is waiting for you..!',
                        style: themedata.textTheme.bodyMedium,
                      );
                    } else if (state is AdvicerStateLoading) {
                      return CircularProgressIndicator(
                        color: themedata.colorScheme.secondary,
                      );
                    } else if (state is AdvicerStateLoaded) {
                      return AdviceField(
                        advice: state.advice,
                      );
                    } else if (state is AdvicerStateError) {
                      return ErrrorMessage(message: state.message);
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
