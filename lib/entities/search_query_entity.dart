class SearchQueryEntity {
  final int page;
  final int ps;
  final String? genre;
  final int? genreId;
  final String sorting;
  final String rp;
  final String form;
  final String state;
  final String series;
  final String access;
  final String dnl;
  final String promo;
  final String upd;
  final String pub;
  final String length;
  final String? eg;
  final int? cntst;
  final bool? fnd;
  final String? tag;
  final bool rec;
  final bool exc;
  final bool disc;

  SearchQueryEntity({
    required this.page,
    required this.ps,
    this.genre,
    this.genreId,
    required this.sorting,
    required this.rp,
    required this.form,
    required this.state,
    required this.series,
    required this.access,
    required this.dnl,
    required this.promo,
    required this.upd,
    required this.pub,
    required this.length,
    this.eg,
    this.cntst,
    this.fnd,
    this.tag,
    required this.rec,
    required this.exc,
    required this.disc,
  });
}
