import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/index.dart';
import '../widgets/index.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);
  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    context.read<CharacterCubit>().getCharacter();
    // context.read<EpisodesCubit>().getEpisodes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharacterCubit, CharacterState>(
        builder: exampleCard, listener: createListener);
  }

  void createListener(BuildContext context, CharacterState state) {
    if (state is CharacterError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state.message)));
    }
  }

  Widget exampleCard(context, state) {
    if (state is CharacterLoaded) {
      final characterInfo = state.character;
      // return Container();
      // return NextPage(
      //   url: state.nextPage,
      // );
      return CharacterInfo(
        url: state.characterPage.next,
        characters: characterInfo,
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    }
  }
}
