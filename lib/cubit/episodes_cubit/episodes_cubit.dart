import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/episodes_model.dart';
import '../../services/repositories.dart';

part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  EpisodesCubit(this.episodeRepository) : super(EpisodesInitial());

  final EpisodesRepository episodeRepository;

  Future<void> getEpisodes() async {
    emit(EpisodesLoading());
    try {
      final episodes = await requestEpisodes();
      emit(EpisodesLoaded(episodes));
    } catch (e) {
      emit(EpisodesError(e.toString()));
    }
  }

  Future<List<EpisodesModel>> requestEpisodes() async {
    try {
      final response = await episodeRepository.getEpisodes();
      final decode = json.decode(response);
      final episode = decode['results']
          .map<EpisodesModel>((e) => EpisodesModel.fromJson(e))
          .toList();

      // print(episode);
      return episode;
    } catch (e) {
      rethrow;
    }
  }
}
