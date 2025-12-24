import 'package:equatable/equatable.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'search_info.dart';
import 'volume_info.dart';

class BookModel extends Equatable {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;
  final SearchInfo? searchInfo;

  const BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    required this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  /// ✅ Parsing آمن حتى لو volumeInfo غير موجود أو نوعه غلط
  factory BookModel.fromJson(Map<String, dynamic> json) {
    final vi = json['volumeInfo'];
    final Map<String, dynamic> volumeInfoMap = (vi is Map<String, dynamic>)
        ? vi
        : (vi is Map
              ? Map<String, dynamic>.from(vi)
              : const <String, dynamic>{});

    final si = json['saleInfo'];
    final ai = json['accessInfo'];
    final sei = json['searchInfo'];

    return BookModel(
      kind: json['kind'] as String?,
      id: json['id'] as String?,
      etag: json['etag'] as String?,
      selfLink: json['selfLink'] as String?,
      volumeInfo: VolumeInfo.fromJson(volumeInfoMap),
      saleInfo: (si is Map<String, dynamic>)
          ? SaleInfo.fromJson(si)
          : (si is Map
                ? SaleInfo.fromJson(Map<String, dynamic>.from(si))
                : null),
      accessInfo: (ai is Map<String, dynamic>)
          ? AccessInfo.fromJson(ai)
          : (ai is Map
                ? AccessInfo.fromJson(Map<String, dynamic>.from(ai))
                : null),
      searchInfo: (sei is Map<String, dynamic>)
          ? SearchInfo.fromJson(sei)
          : (sei is Map
                ? SearchInfo.fromJson(Map<String, dynamic>.from(sei))
                : null),
    );
  }

  /// ✅ هذه الدالة هي الحل العملي لخطأ:
  /// type 'Null' is not a subtype of type 'Iterable<dynamic>'
  /// لأن items قد تكون null في Google Books API.
  ///
  /// استخدمها مباشرة بدل: data['items'].map(...) أو List.from(data['items'])
  static List<BookModel> listFromGoogleBooksResponse(dynamic data) {
    if (data is! Map) return <BookModel>[];

    final map = Map<String, dynamic>.from(data as Map);

    final items = map['items'];
    if (items is! List)
      return <BookModel>[]; // ✅ null أو نوع آخر => قائمة فارغة

    return items
        .whereType<Map>() // Map<dynamic,dynamic>
        .map((e) => BookModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Map<String, dynamic> toJson() => {
    'kind': kind,
    'id': id,
    'etag': etag,
    'selfLink': selfLink,
    'volumeInfo': volumeInfo.toJson(),
    'saleInfo': saleInfo?.toJson(),
    'accessInfo': accessInfo?.toJson(),
    'searchInfo': searchInfo?.toJson(),
  };

  @override
  List<Object?> get props => [
    kind,
    id,
    etag,
    selfLink,
    volumeInfo,
    saleInfo,
    accessInfo,
    searchInfo,
  ];
}
