class QuoteModel {
  int? id;
  String? quote;
  String? auther;

  QuoteModel(
    this.id,
    this.auther,
    this.quote,
  );

  QuoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quote = json['quote'];
    auther = json['auther'];
  }
}









// "id": 1,
//       "quote": "Your heart is the size of an ocean. Go find yourself in its hidden depths.",
//       "author": "Rumi"