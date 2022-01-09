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
import 'package:atoday/models/access_model.dart';
import 'package:atoday/models/book_meta_model.dart';
import 'package:atoday/models/chapter_model.dart';
import 'package:atoday/models/form_model.dart';
import 'package:atoday/models/length_model.dart';
import 'package:atoday/models/login_model.dart';
import 'package:atoday/models/period_model.dart';
import 'package:atoday/models/promo_model.dart';
import 'package:atoday/models/rating_period_model.dart';
import 'package:atoday/models/search_query_model.dart';
import 'package:atoday/models/search_result_model.dart';
import 'package:atoday/models/series_status_model.dart';
import 'package:atoday/models/sort_model.dart';
import 'package:atoday/models/status_model.dart';
import 'package:atoday/models/user_model.dart';
import 'package:atoday/services/providers/api_provider.dart';
import 'package:atoday/services/repositories/api_repository.dart';
import 'package:l/l.dart';

class ApiRepositoryImpl extends ApiRepository {
  ApiRepositoryImpl({required ApiProvider apiProvider}) : super(apiProvider: apiProvider);

  @override
  Future<LoginEntity?> signIn({required String login, required String password}) async {
    try {
      final res = await apiProvider.post<Map<String, dynamic>>(
        '/account/login-by-password',
        data: {
          login: login,
          password: password,
        },
      );
      if (res != null) {
        return LoginModel.fromJson(res);
      }
    } catch (exc) {
      l.e(exc);
    }

    return null;
  }

  @override
  Future<UserEntity?> profile() async {
    try {
      final res = await apiProvider.get<Map<String, dynamic>>('/account/current-user');
      if (res != null) {
        return UserModel.fromJson(res);
      }
    } catch (exc) {
      l.e(exc);
    }

    return null;
  }

  @override
  Future<SearchResultEntity?> search(SearchQueryEntity query) async {
    try {
      final res = await apiProvider.get<Map<String, dynamic>>(
        '/catalog/search',
        queryParameters: SearchQueryModel.fromEntity(query).toJson(),
      );
      if (res != null) {
        return SearchResultModel.fromJson(res);
      }
    } catch (exc) {
      l.e(exc);
    }

    return null;
  }

  @override
  Future<BookMetaEntity?> info({required int bookId}) async {
    try {
      final res = await apiProvider.get<Map<String, dynamic>>('/work/$bookId/meta-info');
      if (res != null) {
        return BookMetaModel.fromJson(res);
      }
    } catch (exc) {
      l.e(exc);
    }

    return null;
  }

  @override
  Future<List<PeriodEntity>> periods() async {
    try {
      final res = await apiProvider.get<List<Map<String, dynamic>>>('/catalog/periods');
      if (res != null) {
        return res.map((item) => PeriodModel.fromJson(item)).toList();
      }
    } catch (exc) {
      l.e(exc);
    }

    return [];
  }

  @override
  Future<List<LengthEntity>> lengths() async {
    try {
      final res = await apiProvider.get<List<Map<String, dynamic>>>('/catalog/lengths');
      if (res != null) {
        return res.map((item) => LengthModel.fromJson(item)).toList();
      }
    } catch (exc) {
      l.e(exc);
    }

    return [];
  }

  @override
  Future<List<AccessEntity>> accesses() async {
    try {
      final res = await apiProvider.get<List<Map<String, dynamic>>>('/catalog/accesses');
      if (res != null) {
        return res.map((item) => AccessModel.fromJson(item)).toList();
      }
    } catch (exc) {
      l.e(exc);
    }

    return [];
  }

  @override
  Future<List<FormEntity>> forms() async {
    try {
      final res = await apiProvider.get<List<Map<String, dynamic>>>('/catalog/work-forms');
      if (res != null) {
        return res.map((item) => FormModel.fromJson(item)).toList();
      }
    } catch (exc) {
      l.e(exc);
    }

    return [];
  }

  @override
  Future<List<SortEntity>> sorts() async {
    try {
      final res = await apiProvider.get<List<Map<String, dynamic>>>('/catalog/sort-orders');
      if (res != null) {
        return res.map((item) => SortModel.fromJson(item)).toList();
      }
    } catch (exc) {
      l.e(exc);
    }

    return [];
  }

  @override
  Future<List<StatusEntity>> statuses() async {
    try {
      final res = await apiProvider.get<List<Map<String, dynamic>>>('/catalog/work-states');
      if (res != null) {
        return res.map((item) => StatusModel.fromJson(item)).toList();
      }
    } catch (exc) {
      l.e(exc);
    }

    return [];
  }

  @override
  Future<List<SeriesStatusEntity>> seriesstatuses() async {
    try {
      final res = await apiProvider.get<List<Map<String, dynamic>>>('/catalog/series-states');
      if (res != null) {
        return res.map((item) => SeriesStatusModel.fromJson(item)).toList();
      }
    } catch (exc) {
      l.e(exc);
    }

    return [];
  }

  @override
  Future<List<RatingPeriodEntity>> ratingperiods() async {
    try {
      final res = await apiProvider.get<List<Map<String, dynamic>>>('/catalog/rating-periods');
      if (res != null) {
        return res.map((item) => RatingPeriodModel.fromJson(item)).toList();
      }
    } catch (exc) {
      l.e(exc);
    }

    return [];
  }

  @override
  Future<List<PromoEntity>> promos() async {
    try {
      final res = await apiProvider.get<List<Map<String, dynamic>>>('/catalog/promo-fragments');
      if (res != null) {
        return res.map((item) => PromoModel.fromJson(item)).toList();
      }
    } catch (exc) {
      l.e(exc);
    }

    return [];
  }

  @override
  Future<List<ChapterEntity>> chapters({required int bookId}) async {
    try {
      final res = await apiProvider.get<List<dynamic>>('/work/$bookId/chapter/many-texts');
      if (res != null) {
        return res.map((item) => ChapterModel.fromJson(item)).toList();
      }
    } catch (exc) {
      l.e(exc);
    }

    return [];
  }
}
