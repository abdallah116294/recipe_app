import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/Features/favoirte/cubit/favorite_cubit.dart';
import 'package:recipe_app/Features/recpie/widget/recipe_item_widget.dart';
import 'package:recipe_app/core/utils/color_manager.dart';
import 'package:recipe_app/core/widgets/custom_text.dart';
import 'package:recipe_app/core/widgets/show_messgae.dart';
import 'package:recipe_app/injection_container.dart' as di;

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<FavoriteCubit>()..getFavorite(userID: 1),
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          if (state is DeleteFavoriteSuccess) {
            showMessage(message: 'Delete Successfully', isError: false);
          } else if (state is DeleteFavoriteFailure) {
            showMessage(message: 'Delete Failed', isError: true);
          }
        },
        builder: (context, state) {
          return state is GetFavoriteSuccess
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                           Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Align(alignment: Alignment.topLeft,child: CustomText(text: 'Favorite Recipes', color: ColorManager.black, fontWeight: FontWeight.bold, fontSize: 30)),
                        ),
                        state.favorites.isEmpty
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 350),
                                child: CustomText(
                                    text: 'You don\'t add Recipe to Favorite ',
                                    color: ColorManager.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            : GridView.builder(
                                itemCount: state.favorites.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: .78),
                                itemBuilder: (context, index) {
                                  return RecipeItemWidget(
                                    isFavorite: true,
                                    onTap: () {
                                      context
                                          .read<FavoriteCubit>()
                                          .deleteFromFavorite(
                                              userID: 1,
                                              recipeId: state.favorites[index]
                                                  ['recipeId']);
                                      context.read<FavoriteCubit>().getFavorite(
                                          userID: 1);            
                                    },
                                    imageUrl: state.favorites[index]
                                        ['recipeImage'],
                                    recipeName: state.favorites[index]
                                        ['recipeName'],
                                  );
                                })
                      ],
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
