import 'package:equatable/equatable.dart';

import 'image_links.dart';
import 'industry_identifier.dart';
import 'panelization_summary.dart';
import 'reading_modes.dart';

class VolumeInfo extends Equatable {
  final String? title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<IndustryIdentifier> industryIdentifiers;
  final ReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final List<String>? categories;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummary? panelizationSummary;

  /// ✅ NEW: rating
  final double? averageRating;
  final int? ratingsCount;

  /// ✅ جعلناها nullable لأن API قد لا يرجع imageLinks لبعض الكتب
  final ImageLinks? imageLinks;

  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  const VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers = const [],
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,

    // ✅ NEW
    this.averageRating,
    this.ratingsCount,

    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    // authors (آمن حتى لو null أو نوع غلط)
    final a = json['authors'];
    final authors = a is List ? a.whereType<String>().toList() : null;

    // categories (آمن)
    final c = json['categories'];
    final categories = c is List ? c.whereType<String>().toList() : null;

    // industryIdentifiers (آمن 100% + default [])
    final ii = json['industryIdentifiers'];
    final List<IndustryIdentifier> industryIdentifiers = (ii is List)
        ? ii
              .whereType<Map>()
              .map(
                (e) =>
                    IndustryIdentifier.fromJson(Map<String, dynamic>.from(e)),
              )
              .toList()
        : <IndustryIdentifier>[];

    // imageLinks (آمن)
    final img = json['imageLinks'];
    final ImageLinks? imageLinks = (img is Map<String, dynamic>)
        ? ImageLinks.fromJson(img)
        : (img is Map
              ? ImageLinks.fromJson(Map<String, dynamic>.from(img))
              : null);

    // panelizationSummary (آمن)
    final ps = json['panelizationSummary'];
    final PanelizationSummary? panelizationSummary =
        (ps is Map<String, dynamic>)
        ? PanelizationSummary.fromJson(ps)
        : (ps is Map
              ? PanelizationSummary.fromJson(Map<String, dynamic>.from(ps))
              : null);

    // readingModes (آمن)
    final rm = json['readingModes'];
    final ReadingModes? readingModes = (rm is Map<String, dynamic>)
        ? ReadingModes.fromJson(rm)
        : (rm is Map
              ? ReadingModes.fromJson(Map<String, dynamic>.from(rm))
              : null);

    // ✅ NEW: averageRating / ratingsCount (آمن)
    final double? averageRating = (json['averageRating'] as num?)?.toDouble();
    final int? ratingsCount = (json['ratingsCount'] as num?)?.toInt();

    return VolumeInfo(
      title: json['title'] as String?,
      authors: authors,
      publisher: json['publisher'] as String?,
      publishedDate: json['publishedDate'] as String?,
      description: json['description'] as String?,
      industryIdentifiers: industryIdentifiers,
      readingModes: readingModes,
      pageCount: (json['pageCount'] as num?)?.toInt(),
      printType: json['printType'] as String?,
      categories: categories,
      maturityRating: json['maturityRating'] as String?,
      allowAnonLogging: json['allowAnonLogging'] as bool?,
      contentVersion: json['contentVersion'] as String?,
      panelizationSummary: panelizationSummary,

      // ✅ NEW
      averageRating: averageRating,
      ratingsCount: ratingsCount,

      imageLinks: imageLinks,
      language: json['language'] as String?,
      previewLink: json['previewLink'] as String?,
      infoLink: json['infoLink'] as String?,
      canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'authors': authors,
    'publisher': publisher,
    'publishedDate': publishedDate,
    'description': description,
    'industryIdentifiers': industryIdentifiers.map((e) => e.toJson()).toList(),
    'readingModes': readingModes?.toJson(),
    'pageCount': pageCount,
    'printType': printType,
    'categories': categories,
    'maturityRating': maturityRating,
    'allowAnonLogging': allowAnonLogging,
    'contentVersion': contentVersion,
    'panelizationSummary': panelizationSummary?.toJson(),

    // ✅ NEW
    'averageRating': averageRating,
    'ratingsCount': ratingsCount,

    'imageLinks': imageLinks?.toJson(),
    'language': language,
    'previewLink': previewLink,
    'infoLink': infoLink,
    'canonicalVolumeLink': canonicalVolumeLink,
  };

  @override
  List<Object?> get props => [
    title,
    authors,
    publisher,
    publishedDate,
    description,
    industryIdentifiers,
    readingModes,
    pageCount,
    printType,
    categories,
    maturityRating,
    allowAnonLogging,
    contentVersion,
    panelizationSummary,

    // ✅ NEW
    averageRating,
    ratingsCount,

    imageLinks,
    language,
    previewLink,
    infoLink,
    canonicalVolumeLink,
  ];
}
