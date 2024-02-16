class QuizModel{
  String id;
  int correctAnswersCounter;

  QuizModel(
      {this.id = "",
        required this.correctAnswersCounter,});

  QuizModel.fromJson(Map<String, dynamic> json) : this(
    id: json["id"],
    correctAnswersCounter: json["correctAnswersCounter"],
  );

  Map<String,dynamic> toJson(){
    return {
      "id": id,
      "correctAnswersCounter": correctAnswersCounter,
    };
  }
}