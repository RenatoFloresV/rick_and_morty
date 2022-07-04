import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/index.dart';
import '../widgets/index.dart';



class EpisodesScreen extends StatefulWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  @override
  void initState() {
    // context.read<CharacterCubit>().getCharacter();
    context.read<EpisodesCubit>().getEpisodes();
    super.initState();
  }

  void createListenerL(BuildContext context, EpisodesState state) {
    if (state is EpisodesError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state.message)));
    }
  }

  Widget episodes(context, state) {
    if (state is EpisodesLoaded) {
      final info = state.episodes;
      return EpisodesInfo(
        episodes: info,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EpisodesCubit, EpisodesState>(
        builder: episodes, listener: createListenerL);
  }
}
