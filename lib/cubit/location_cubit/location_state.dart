part of 'location_cubit.dart';

@immutable
abstract class LocationState {
  const LocationState();
}

class LocationInitial extends LocationState {
  const LocationInitial();
}

class LocationLoading extends LocationState {
  const LocationLoading();
}

class LocationLoaded extends LocationState {
  const LocationLoaded(this.location);
  final List<LocationModel> location;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocationLoaded && other.location == location;
  }

  @override
  int get hashCode => location.hashCode;
}

class LocationError extends LocationState {
  const LocationError(this.message);
  final String message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationError && message == other.message;

  @override
  int get hashCode => message.hashCode;
}
