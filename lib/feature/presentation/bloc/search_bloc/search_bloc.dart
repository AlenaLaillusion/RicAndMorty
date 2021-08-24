
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/core/error/failure.dart';
import 'package:rick_morty/feature/domain/usecases/search_person.dart';
import 'package:rick_morty/feature/presentation/bloc/search_bloc/search_event.dart';
import 'package:rick_morty/feature/presentation/bloc/search_bloc/search_state.dart';
import 'package:meta/meta.dart';

class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPerson searchPerson;

  PersonSearchBloc({@required this.searchPerson}) : super(PersonEmpty());


  @override
  Stream<PersonSearchState> mapEventToState(PersonSearchEvent event) async* {
  if (event is SearchPersons) {
    yield* _mapFetchPersonToState(event.personQuery);
  }
  }

  Stream<PersonSearchState> _mapFetchPersonToState(String personQuery) async* {
    yield PersonSearchLoading();

    final failureOrPerson = await searchPerson(SearchPersonParams(query: personQuery));
    yield failureOrPerson.fold((failure) => PersonsSearchError(message: _mapFailureToMessage(failure)),
            (person) => PersonSearchLoaded(persons: person));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';

      case CacheFailure:
        return 'Cache Failure';

      default:
        return 'Unexpected Error';
    }
  }

}