import 'package:atoday/entities/search_query_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_query_model.freezed.dart';
part 'search_query_model.g.dart';

@freezed
class SearchQueryModel extends SearchQueryEntity with _$SearchQueryModel {
  const factory SearchQueryModel({
    @Default(1) int page,
    @Default(25) int ps,
    @Default(null) String? genre,
    @Default(null) int? genreId,
    @Default('popular') String sorting,
    @Default('today') String rp,
    @Default('any') String form,
    @Default('any') String state,
    @Default('any') String series,
    @Default('any') String access,
    @Default('any') String dnl,
    @Default('hide') String promo,
    @Default('-1') String upd,
    @Default('-1') String pub,
    @Default('any') String length,
    @Default(null) String? eg,
    @Default(null) int? cntst,
    @Default(null) bool? fnd,
    @Default(null) String? tag,
    @Default(false) bool rec,
    @Default(false) bool exc,
    @Default(false) bool disc,
  }) = _SearchQueryModel;

  factory SearchQueryModel.fromJson(Map<String, dynamic> json) => _$SearchQueryModelFromJson(json);

  factory SearchQueryModel.fromEntity(SearchQueryEntity query) => SearchQueryModel.fromJson({
        'page': query.page,
        'ps': query.ps,
        'genre': query.genre,
        'genreId': query.genreId,
        'sorting': query.sorting,
        'rp': query.rp,
        'form': query.form,
        'state': query.state,
        'series': query.series,
        'access': query.access,
        'dnl': query.dnl,
        'promo': query.promo,
        'upd': query.upd,
        'pub': query.pub,
        'length': query.length,
        'eg': query.eg,
        'cntst': query.cntst,
        'fnd': query.fnd,
        'tag': query.tag,
        'rec': query.rec,
        'exc': query.exc,
        'disc': query.disc,
      });
}
