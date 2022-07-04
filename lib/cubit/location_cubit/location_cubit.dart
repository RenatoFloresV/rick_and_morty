import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/index.dart';
import '../../services/repositories.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this.locationRepository) : super(const LocationInitial());

  final LocationsRepository locationRepository;

  Future<void> getLocation() async {
    emit(const LocationLoading());
    try {
      final location = await requestLocation();
      emit(LocationLoaded(location));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

  Future<List<LocationModel>> requestLocation() async {
    try {
      final response = await locationRepository.getLocation();
      final decodeLocation = json.decode(response);
      final location = decodeLocation['results']
          .map<LocationModel>((e) => LocationModel.fromJson(e))
          .toList();
      return location;
    } catch (e) {
      rethrow;
    }
  }
}
