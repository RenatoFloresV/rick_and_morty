part of 'episodes_cubit.dart';

@immutable
abstract class EpisodesState {}

class EpisodesInitial extends EpisodesState {
  EpisodesInitial();
}

class EpisodesLoading extends EpisodesState {}

class EpisodesLoaded extends EpisodesState {
  EpisodesLoaded(this.episodes);
  final List<EpisodesModel> episodes;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EpisodesLoaded && episodes == other.episodes;
  }

  @override
  int get hashCode => episodes.hashCode;
}

class EpisodesError extends EpisodesState {
  EpisodesError(this.message);
  final dynamic message;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EpisodesError && message == other.message;
  }

  @override
  int get hashCode => message.hashCode;
}
