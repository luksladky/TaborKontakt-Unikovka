// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cipher_status.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCipherStatusCollection on Isar {
  IsarCollection<CipherStatus> get cipherStatus => this.collection();
}

const CipherStatusSchema = CollectionSchema(
  name: r'CipherStatus',
  id: 8422916380627193270,
  properties: {
    r'lastSms': PropertySchema(
      id: 0,
      name: r'lastSms',
      type: IsarType.dateTime,
    ),
    r'penaltyInMinutes': PropertySchema(
      id: 1,
      name: r'penaltyInMinutes',
      type: IsarType.long,
    ),
    r'statuses': PropertySchema(
      id: 2,
      name: r'statuses',
      type: IsarType.stringList,
      enumMap: _CipherStatusstatusesEnumValueMap,
    )
  },
  estimateSize: _cipherStatusEstimateSize,
  serialize: _cipherStatusSerialize,
  deserialize: _cipherStatusDeserialize,
  deserializeProp: _cipherStatusDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cipherStatusGetId,
  getLinks: _cipherStatusGetLinks,
  attach: _cipherStatusAttach,
  version: '3.1.0+1',
);

int _cipherStatusEstimateSize(
  CipherStatus object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.statuses.length * 3;
  {
    for (var i = 0; i < object.statuses.length; i++) {
      final value = object.statuses[i];
      bytesCount += value.name.length * 3;
    }
  }
  return bytesCount;
}

void _cipherStatusSerialize(
  CipherStatus object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.lastSms);
  writer.writeLong(offsets[1], object.penaltyInMinutes);
  writer.writeStringList(
      offsets[2], object.statuses.map((e) => e.name).toList());
}

CipherStatus _cipherStatusDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CipherStatus(
    reader
            .readStringList(offsets[2])
            ?.map((e) => _CipherStatusstatusesValueEnumMap[e] ?? Solved.No)
            .toList() ??
        [],
    reader.readLong(offsets[1]),
    reader.readDateTime(offsets[0]),
  );
  return object;
}

P _cipherStatusDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader
              .readStringList(offset)
              ?.map((e) => _CipherStatusstatusesValueEnumMap[e] ?? Solved.No)
              .toList() ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CipherStatusstatusesEnumValueMap = {
  r'No': r'No',
  r'NoButHintDisplayed': r'NoButHintDisplayed',
  r'YesWithHint': r'YesWithHint',
  r'YesWithSolution': r'YesWithSolution',
  r'Yes': r'Yes',
};
const _CipherStatusstatusesValueEnumMap = {
  r'No': Solved.No,
  r'NoButHintDisplayed': Solved.NoButHintDisplayed,
  r'YesWithHint': Solved.YesWithHint,
  r'YesWithSolution': Solved.YesWithSolution,
  r'Yes': Solved.Yes,
};

Id _cipherStatusGetId(CipherStatus object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cipherStatusGetLinks(CipherStatus object) {
  return [];
}

void _cipherStatusAttach(
    IsarCollection<dynamic> col, Id id, CipherStatus object) {}

extension CipherStatusQueryWhereSort
    on QueryBuilder<CipherStatus, CipherStatus, QWhere> {
  QueryBuilder<CipherStatus, CipherStatus, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CipherStatusQueryWhere
    on QueryBuilder<CipherStatus, CipherStatus, QWhereClause> {
  QueryBuilder<CipherStatus, CipherStatus, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CipherStatusQueryFilter
    on QueryBuilder<CipherStatus, CipherStatus, QFilterCondition> {
  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      lastSmsEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSms',
        value: value,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      lastSmsGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSms',
        value: value,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      lastSmsLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSms',
        value: value,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      lastSmsBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSms',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      penaltyInMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'penaltyInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      penaltyInMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'penaltyInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      penaltyInMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'penaltyInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      penaltyInMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'penaltyInMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesElementEqualTo(
    Solved value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statuses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesElementGreaterThan(
    Solved value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statuses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesElementLessThan(
    Solved value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statuses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesElementBetween(
    Solved lower,
    Solved upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statuses',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statuses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statuses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statuses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statuses',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statuses',
        value: '',
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statuses',
        value: '',
      ));
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'statuses',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'statuses',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'statuses',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'statuses',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'statuses',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterFilterCondition>
      statusesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'statuses',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension CipherStatusQueryObject
    on QueryBuilder<CipherStatus, CipherStatus, QFilterCondition> {}

extension CipherStatusQueryLinks
    on QueryBuilder<CipherStatus, CipherStatus, QFilterCondition> {}

extension CipherStatusQuerySortBy
    on QueryBuilder<CipherStatus, CipherStatus, QSortBy> {
  QueryBuilder<CipherStatus, CipherStatus, QAfterSortBy> sortByLastSms() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSms', Sort.asc);
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterSortBy> sortByLastSmsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSms', Sort.desc);
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterSortBy>
      sortByPenaltyInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penaltyInMinutes', Sort.asc);
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterSortBy>
      sortByPenaltyInMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penaltyInMinutes', Sort.desc);
    });
  }
}

extension CipherStatusQuerySortThenBy
    on QueryBuilder<CipherStatus, CipherStatus, QSortThenBy> {
  QueryBuilder<CipherStatus, CipherStatus, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterSortBy> thenByLastSms() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSms', Sort.asc);
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterSortBy> thenByLastSmsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSms', Sort.desc);
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterSortBy>
      thenByPenaltyInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penaltyInMinutes', Sort.asc);
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QAfterSortBy>
      thenByPenaltyInMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penaltyInMinutes', Sort.desc);
    });
  }
}

extension CipherStatusQueryWhereDistinct
    on QueryBuilder<CipherStatus, CipherStatus, QDistinct> {
  QueryBuilder<CipherStatus, CipherStatus, QDistinct> distinctByLastSms() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSms');
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QDistinct>
      distinctByPenaltyInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'penaltyInMinutes');
    });
  }

  QueryBuilder<CipherStatus, CipherStatus, QDistinct> distinctByStatuses() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statuses');
    });
  }
}

extension CipherStatusQueryProperty
    on QueryBuilder<CipherStatus, CipherStatus, QQueryProperty> {
  QueryBuilder<CipherStatus, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CipherStatus, DateTime, QQueryOperations> lastSmsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSms');
    });
  }

  QueryBuilder<CipherStatus, int, QQueryOperations> penaltyInMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'penaltyInMinutes');
    });
  }

  QueryBuilder<CipherStatus, List<Solved>, QQueryOperations>
      statusesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statuses');
    });
  }
}
