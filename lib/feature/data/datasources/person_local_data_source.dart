
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rick_morty/core/error/exception.dart';
import 'package:rick_morty/feature/data/models/person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class PersonLocalDataSource {
  Future<List<PersonModel>> getLastPersonsFromCache();
  Future<void> personsToCache(List<PersonModel> persons);
}

const CACHED_PERSON_LIST = 'CACHED_PERSON_LIST';
class PersonLocalDataSourceImpl implements PersonLocalDataSource {
  final SharedPreferences sharedPreferences;
  PersonLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<List<PersonModel>> getLastPersonsFromCache(){
    final jsonPersonceList  = sharedPreferences.getStringList(CACHED_PERSON_LIST);
    if (jsonPersonceList.isNotEmpty) {
      return Future.value(jsonPersonceList
          .map((person) => PersonModel.fromJson(json.decode(person)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> personsToCache(List<PersonModel> persons) {
  final List<String> jsonPersonsList = persons.map((person) => json.encode(person.toJson())).toList();

  sharedPreferences.setStringList(CACHED_PERSON_LIST, jsonPersonsList);
  print('Person ti write Cache: ${jsonPersonsList.length}');
  return Future.value(jsonPersonsList);
  }
}