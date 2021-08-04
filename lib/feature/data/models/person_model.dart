import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rick_morty/feature/domain/entities/person_entity.dart';
import 'package:meta/meta.dart';

class PersonModel extends PersonEntity {
  PersonModel(
      {@required id,
      @required name,
      @required status,
      @required species,
      @required type,
      @required gender,
      @required origin,
      @required location,
      @required image,
      @required episode,
      @required created})
      : super(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          origin: origin,
          location: location,
          image: image,
          episode: episode,
          created: created,
        );

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        origin: json['origin'],
        location: json['location'],
        image: json['image'],
        episode: json['episode'],
        created: json['created']);
  }
}
