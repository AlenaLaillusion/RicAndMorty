
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:rick_morty/feature/domain/entities/person_entity.dart';
import 'package:meta/meta.dart';

abstract class PersonSearchState extends Equatable {
  const PersonSearchState();

  @override
  List<Object> get props => [];
}

class PersonEmpty extends PersonSearchState {}

class PersonSearchLoading extends PersonSearchState {}

class PersonSearchLoaded extends PersonSearchState {
  final List<PersonEntity> persons;

  PersonSearchLoaded({this.persons});

  @override
  List<Object> get props => [persons];
}

class PersonsSearchError extends PersonSearchState {
  final String message;

  PersonsSearchError({@required this.message});

  @override
  List<Object> get props => [message];
}