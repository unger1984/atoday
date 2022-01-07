import 'package:atoday/entities/promo_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo_model.freezed.dart';
part 'promo_model.g.dart';

@freezed
class PromoModel extends PromoEntity with _$PromoModel {
  const factory PromoModel({
    @Default('hide') String value,
    @Default('Скрывать') String title,
    @Default('Скрывать') String mobileTitle,
  }) = _PromoModel;

  factory PromoModel.fromJson(Map<String, dynamic> json) => _$PromoModelFromJson(json);
}
