// course_model.dart

class CourseModel {
  final String id;
  final String name;
  final String image;
  final bool isFavorite;

  CourseModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFavorite,
  });

  factory CourseModel.fromFirestore(Map<String, dynamic> data, String id) {
    return CourseModel(
      id: id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      isFavorite: data['IsFav'] ?? false,
    );
  }

  get topicName => null;
}
