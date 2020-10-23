class WealthSummaryModel {
  int id;
  bool hasHistory;
  double gain;
  double cdi;
  double profitability;
  int total;

  WealthSummaryModel(
      {this.id,
      this.hasHistory,
      this.gain,
      this.cdi,
      this.profitability,
      this.total});

  WealthSummaryModel.fromJson(Map<String, dynamic> json) {
    id = json["wealthSummary"][0]['id'];
    hasHistory = json["wealthSummary"][0]['hasHistory'];
    gain = json["wealthSummary"][0]['gain'];
    cdi = json["wealthSummary"][0]['cdi'];
    profitability = json["wealthSummary"][0]['profitability'];
    total = json["wealthSummary"][0]['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hasHistory'] = this.hasHistory;
    data['gain'] = this.gain;
    data['cdi'] = this.cdi;
    data['profitability'] = this.profitability;
    data['total'] = this.total;
    return data;
  }

  @override
  String toString() {
    String toStr = "---- Id: $id ----";
    return toStr;
  }
}
