import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/Features/recpie/cubit/recipe_cubit.dart';
import 'package:recipe_app/Features/recpie/widget/recipe_item_widget.dart';
import 'package:recipe_app/config/routes/app_routes.dart';
import 'package:recipe_app/core/extensions/context_extensions.dart';
import 'package:recipe_app/core/utils/color_manager.dart';
import 'package:recipe_app/core/widgets/custom_text.dart';
import 'package:recipe_app/injection_container.dart' as di;

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<RecipeCubit>()..getRecipe(),
      child: BlocConsumer<RecipeCubit, RecipeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is GetRecipeSuccess
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Align(alignment: Alignment.topLeft,child: CustomText(text: 'Welcome Back', color: ColorManager.black, fontWeight: FontWeight.bold, fontSize: 30)),
                        ),
                        GridView.builder(
                            itemCount: state.recipes.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: .78),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context.pushName(AppRoutes.recipeDetailsScreen,
                                      arguments: state.recipes[index]);
                                },
                                child: RecipeItemWidget(
                                  isFavorite: false,
                                  calories: state.recipes[index].calories!,
                                  imageUrl: state.recipes[index].image!,
                                  recipeName: state.recipes[index].name!,
                                ),
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
