import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/logic/bloc/save_unsave_bloc/save_unsave_bloc.dart';
import 'package:weather/services/boxes/box.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('savedPage'.tr()),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<SaveUnsaveBloc, SaveUnsaveState>(
                builder: (context, state) {
                  if (state is SaveUnsaveLoaded) {
                    return ListView.builder(
                      itemCount: state.cities.length,
                      itemBuilder: (context, index) {
                        final cities = state.cities[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/weather',
                                arguments: cities.city);
                          },
                          child: ListTile(
                            title: Text(
                              cities.city,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .color),
                            ),
                            // subtitle: Text(
                            //   weatherBox.get(cities.city).toString(),
                            //   style: TextStyle(
                            //       color: Theme.of(context)
                            //           .textTheme
                            //           .titleLarge!
                            //           .color),
                            // ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                saveCitiesBox.delete(cities.city);
                                context
                                    .read<SaveUnsaveBloc>()
                                    .add(UnsaveCity(city: cities.city));
                              },
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
