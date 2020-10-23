import 'package:MobileFlutterTest/modules/base/baseProvider.dart';
import 'package:MobileFlutterTest/modules/base/defaultModel.dart';
import 'package:MobileFlutterTest/modules/model/wealthSummaryModel.dart';

class WealthSummaryRepository extends BaseProvider {
  final String queryWealthSummary = r'''
  query summary {
  wealthSummary {
    id
    hasHistory
    gain
    cdi
    profitability
    total
  }
}
''';

  Future<DefaultModel<WealthSummaryModel>> getSummary() async {
    return await this.readGraphQl(queryWealthSummary, (data) {
      return WealthSummaryModel.fromJson(data);
    });
  }
}
