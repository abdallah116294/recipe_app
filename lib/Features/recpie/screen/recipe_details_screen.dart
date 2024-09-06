import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/Features/recpie/cubit/recipe_cubit.dart';
import 'package:recipe_app/Features/recpie/data/model/recpi_model.dart';
import 'package:recipe_app/core/utils/color_manager.dart';
import 'package:recipe_app/core/widgets/custom_elevated.dart';
import 'package:recipe_app/core/widgets/custom_text.dart';
import 'package:recipe_app/core/widgets/show_messgae.dart';
import 'package:recipe_app/injection_container.dart' as di;

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({super.key, required this.recipeModel});
  final RecipeModel recipeModel;
  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<RecipeCubit>(),
      child: BlocConsumer<RecipeCubit, RecipeState>(
        listener: (context, state) {
          if (state is AddRecipeToFavoriteSuccess) {
            showMessage(
                message: 'Add To Favorite Successfully', isError: false);
          } else if (state is AddRecipeToFavoriteFailure) {
            showMessage(message: 'Add To Favorite Failed', isError: true);
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.recipeModel.image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            CustomText(
                                text: widget.recipeModel.name!,
                                color: ColorManager.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<RecipeCubit>()
                                      .addRecipeToFavorite(
                                        recipeHeadline:
                                            widget.recipeModel.headline!,
                                        recipeId:
                                            widget.recipeModel.id.toString(),
                                        recipeImage: widget.recipeModel.image!,
                                        recipeName: widget.recipeModel.name!,
                                        userId: 1,
                                      );
                                },
                                icon: const Icon(Icons.favorite_border))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: widget.recipeModel.headline!,
                                color: ColorManager.grey13,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                            // Spacer(),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: ColorManager.yellow,
                                shape: BoxShape.circle,
                                //borderRadius: BorderRadius.circular(12)
                              ),
                              child: Center(
                                  child: CustomText(
                                      text: widget.recipeModel.calories
                                          .toString(),
                                      color: ColorManager.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CustomText(
                      text: 'Description',
                      color: ColorManager.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorManager.grey14,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: CustomText(
                        maxLines: 7,
                        textAlign: TextAlign.center,
                        text: widget.recipeModel.description.toString(),
                        color: ColorManager.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: CustomText(
                      text: 'Ingredients',
                      color: ColorManager.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: ColorManager.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: CustomText(
                              text:
                                  '${index + 1}. ${widget.recipeModel.ingredients[index]}',
                              color: ColorManager.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: widget.recipeModel.ingredients.length),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: CustomElevated(text: 'Favorite', press: (){}, btnColor: ColorManager.primary,textColor: ColorManager.white),
                // )
              ],
            ),
          ));
        },
      ),
    );
  }
}
