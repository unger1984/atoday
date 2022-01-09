class ChapterEntity {
  final int id;
  final String? title;
  final bool isDraft;
  final DateTime? publishTime;
  final DateTime? lastModificationTime;
  final String text;
  final String key;
  final bool isSuccessful;
  final String? message;

  ChapterEntity({
    required this.id,
    this.title,
    required this.isDraft,
    this.publishTime,
    this.lastModificationTime,
    required this.text,
    required this.key,
    required this.isSuccessful,
    this.message,
  });
}
