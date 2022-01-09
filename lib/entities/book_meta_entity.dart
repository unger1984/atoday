class BookMetaEntity {
  final int id;
  final String title;
  final String? annotation;
  final int authorId;
  final String authorFIO;
  final String authorUserName;
  final String? originalAuthor;
  final int? coAuthorId;
  final String? coAuthorFIO;
  final String? coAuthorUserName;
  final bool coAuthorConfirmed;
  final int? seriesId;
  final String? seriesTitle;
  final DateTime? publishTime;
  final DateTime? lastModificationTime;
  final DateTime? finishTime;
  final bool isDraft;
  final String? formEnum;
  final int? genreId;
  final int? firstSubGenreId;
  final int? secondSubGenreId;
  final bool adultOnly;
  final List<String> tags;
  final String? coverUrl;
  final int viewCount;
  final int reviewCount;
  final int textLength;
  final int likeCount;
  final bool showAuthor;
  final double? price;
  final double? discount;
  final String status;
  final bool promoFragment;
  final bool isExclusive;

  BookMetaEntity({
    required this.id,
    required this.title,
    this.annotation,
    required this.authorId,
    required this.authorFIO,
    required this.authorUserName,
    this.originalAuthor,
    this.coAuthorId,
    this.coAuthorFIO,
    this.coAuthorUserName,
    required this.coAuthorConfirmed,
    this.seriesId,
    this.seriesTitle,
    this.publishTime,
    this.lastModificationTime,
    this.finishTime,
    required this.isDraft,
    this.formEnum,
    this.genreId,
    this.firstSubGenreId,
    this.secondSubGenreId,
    required this.adultOnly,
    required this.tags,
    this.coverUrl,
    required this.viewCount,
    required this.reviewCount,
    required this.textLength,
    required this.likeCount,
    required this.showAuthor,
    this.price,
    this.discount,
    required this.status,
    required this.promoFragment,
    required this.isExclusive,
  });
}
