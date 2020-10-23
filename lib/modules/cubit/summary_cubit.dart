import 'package:MobileFlutterTest/modules/model/summaryModel.dart';
import 'package:MobileFlutterTest/modules/repository/summaryRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  final SummaryRepository _repository;
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
