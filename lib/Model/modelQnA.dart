class QuestionAnswerModel {
  final String id;
  final String Question;
  final String Answer1;
  final String Answer2;
  final String Answer3;

  QuestionAnswerModel({
    required this.id,
    required this.Question,
    required this.Answer1,
    required this.Answer2,
    required this.Answer3,
  });

  factory QuestionAnswerModel.fromMap(Map<String, dynamic>? map) {
    if (map == null)
      return QuestionAnswerModel(
          id: '', Question: '', Answer1: '', Answer2: '', Answer3: '');

    return QuestionAnswerModel(
      id: map['id'] ?? '',
      Question: map['Question'] ?? '',
      Answer1: map['Answer1'] ?? '',
      Answer2: map['Answer2'] ?? '',
      Answer3: map['Answer3'] ?? '',
    );
  }
}
