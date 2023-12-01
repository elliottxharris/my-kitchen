import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_kitchen/Model/ingredient.dart';
import 'package:my_kitchen/Service/firestore_service.dart';
import 'package:my_kitchen/View%20Model/home_page_cubit_state.dart';
import 'package:my_kitchen/Widgets/custm_date_picker.dart';
import 'package:my_kitchen/Widgets/custom_text_field.dart';
import 'package:my_kitchen/Widgets/ingredient_status.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController descriptionFieldController = TextEditingController();
  DateTime boughtDate = DateTime.now();
  DateTime expirationDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().fetchIngredients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (dialogContext) => SimpleDialog(
                  title: const Text('Add Ingredient'),
                  children: [
                    CustomTextField(
                      controller: nameFieldController,
                      hint: 'Name',
                    ),
                    CustomTextField(
                      controller: descriptionFieldController,
                      hint: 'Description',
                    ),
                    CustomDatePicker(
                      keyText: 'Bought Date',
                      selectedDate: (date) => date = boughtDate,
                    ),
                    CustomDatePicker(
                      keyText: 'Expiration Date',
                      selectedDate: (date) => date = expirationDate,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () async {
                          Navigator.pop(dialogContext);
                          await context.read<HomePageCubit>().addIngredient(
                                Ingredient(
                                  name: nameFieldController.text,
                                  description: descriptionFieldController.text,
                                  boughtDate: boughtDate,
                                  expirationDate: expirationDate,
                                ),
                              );
                        },
                        child: const Text('ADD'),
                      ),
                    )
                  ],
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
              height: 130,
              child: BlocBuilder<HomePageCubit, HomePageCubitState>(
                builder: (context, state) {
                  if (state is HomePageCubitLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is HomePageCubitInitialized) {
                    final List ingredients = state.ingredients;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ingredients.length,
                      itemBuilder: (context, index) =>
                          IngredientStatus(ingredient: ingredients[index]),
                    );
                  }

                  //TODO display proper error
                  return const Text('Error');
                },
              )),
        ),
      ),
    );
  }
}
