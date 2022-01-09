import 'package:atoday/entities/access_entity.dart';
import 'package:atoday/entities/book_meta_entity.dart';
import 'package:atoday/entities/chapter_entity.dart';
import 'package:atoday/entities/form_entity.dart';
import 'package:atoday/entities/length_entity.dart';
import 'package:atoday/entities/login_entity.dart';
import 'package:atoday/entities/period_entity.dart';
import 'package:atoday/entities/promo_entity.dart';
import 'package:atoday/entities/rating_period_entity.dart';
import 'package:atoday/entities/search_query_entity.dart';
import 'package:atoday/entities/search_result_entity.dart';
import 'package:atoday/entities/series_status_entity.dart';
import 'package:atoday/entities/sort_entity.dart';
import 'package:atoday/entities/status_entity.dart';
import 'package:atoday/entities/user_entity.dart';
import 'package:atoday/services/providers/api_provider.dart';

abstract class ApiRepository {
  final ApiProvider apiProvider;

  ApiRepository({required this.apiProvider});

  Future<LoginEntity?> signIn({required String login, required String password});
  Future<UserEntity?> profile();
  Future<SearchResultEntity?> search(SearchQueryEntity query);
  Future<BookMetaEntity?> info({required int bookId});
  Future<List<PeriodEntity>> periods();
  Future<List<LengthEntity>> lengths();
  Future<List<AccessEntity>> accesses();
  Future<List<FormEntity>> forms();
  Future<List<SortEntity>> sorts();
  Future<List<StatusEntity>> statuses();
  Future<List<SeriesStatusEntity>> seriesstatuses();
  Future<List<RatingPeriodEntity>> ratingperiods();
  Future<List<PromoEntity>> promos();
  Future<List<ChapterEntity>> chapters({required int bookId});
}
