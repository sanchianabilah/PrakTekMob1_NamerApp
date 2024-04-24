import 'package:flutter/material.dart';
import 'package:namer_app/providers/app_state.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favorites yet.'),
      );
    }

   return ListView.builder(
      itemCount: appState.favorites.length,
      itemBuilder: (context, index) {
        final favorite = appState.favorites[index];
        // Ambil bagian pertama dari WordPair sebagai teks
        final favoriteText = favorite.first;
        return ListTile(
          leading: const Icon(Icons.favorite),
          title: Text(favoriteText),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Hapus kata favorit dari AppState
              context.read<AppState>().removeFavorite(appState.favorites[index]);
            },
          ),
        );
      },
    );
  }
}
