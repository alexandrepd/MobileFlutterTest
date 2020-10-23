import 'package:MobileFlutterTest/modules/model/wealthSummaryModel.dart';
import 'package:MobileFlutterTest/modules/repository/wealthSummaryRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  final WealthSummaryRepository _repository;
  SummaryCubit(this._repository) : super(SummaryInitial());

  Future<void> getSummary() async {
    try {
      emit(SummaryLoading());
      var obj = await _repository.getSummary();
      if (obj.isSuccess) {
        emit(SummaryLoaded(obj.data));
      }
    } on Exception {
      emit(SummaryError("Couldn't fetch something is wrong?"));
    }
  }
}
