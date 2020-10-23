import 'package:MobileFlutterTest/modules/repository/wealthSummaryRepository.dart';
import 'package:MobileFlutterTest/views/cardFlipperTeste.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MobileFlutterTest/modules/cubit/summary_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (BuildContext context) =>
            SummaryCubit(WealthSummaryRepository()),
        child: _getHome(),
      ),
    );
  }

  Widget _getHome() {
    return BlocBuilder<SummaryCubit, SummaryState>(
        builder: (context, SummaryState state) {
      final _cubit = context.bloc<SummaryCubit>();

      if (state is SummaryInitial) {
        _cubit.getSummary();
        return _loadingWidget();
      }

      if (state is SummaryLoading) {
        print('SummaryLoading');
        return _loadingWidget();
      }
      if (state is SummaryLoaded) {
        return Column(
          children: <Widget>[
            Expanded(child: Container()),
            CardFlipperTest(summary: state.summary),
            Expanded(child: Container()),
          ],
        );
      }

      return Center(child: _loadingWidget());
    });
  }

  Widget _loadingWidget() {
    return Center(
        child: Container(
            padding: EdgeInsets.all(20), child: CircularProgressIndicator()));
  }
}
