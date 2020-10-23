import 'package:MobileFlutterTest/modules/base/baseProvider.dart';
import 'package:MobileFlutterTest/modules/base/defaultModel.dart';
import 'package:MobileFlutterTest/modules/model/summaryModel.dart';

class SummaryRepository extends BaseProvider {
  Future<DefaultModel<SummaryModel>> getSummary() async {
    return await this.readGraphQl(SummaryModel.querySummary, (data) {
      return SummaryModel.fromJson(data);
    });
  }
}
