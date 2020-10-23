part of 'summary_cubit.dart';

@immutable
abstract class SummaryState {
  const SummaryState();
}

class SummaryInitial extends SummaryState {
  const SummaryInitial();
}

class SummaryLoading extends SummaryState {
  const SummaryLoading();
}

class SummaryLoaded extends SummaryState {
  final WealthSummaryModel summary;
  const SummaryLoaded(this.summary);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SummaryLoaded && o.summary == summary;
  }

  @override
  int get hashCode => summary.hashCode;
}

class SummaryError extends SummaryState {
  final String message;
  const SummaryError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SummaryError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
