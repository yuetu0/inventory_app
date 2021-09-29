class FeedbackForm {
  String name;
  String amount;
  String description;

  FeedbackForm(this.name, this.amount, this.description);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
        "${json['name']}", "${json['amount']}", "${json['description']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
        'name': name,
        'amount': amount,
        'description': description,
      };
}
