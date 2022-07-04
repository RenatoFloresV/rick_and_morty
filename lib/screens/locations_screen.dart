import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/index.dart';
import '../widgets/location_info.dart';



class LocationsScreen extends StatefulWidget {
  const LocationsScreen({Key? key}) : super(key: key);

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  @override
  void initState() {
    // context.read<CharacterCubit>().getCharacter();
    context.read<LocationCubit>().getLocation();
    super.initState();
  }

  void createListenerL(BuildContext context, LocationState state) {
    if (state is LocationError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state.message)));
    }
  }

  Widget locations(context, state) {
    if (state is LocationLoaded) {
      final info = state.location;
      return LocationInfo(
        location: info,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
        builder: locations, listener: createListenerL);
  }
}
