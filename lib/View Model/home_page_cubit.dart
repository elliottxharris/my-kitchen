part of 'home_page_cubit_state.dart';

class HomePageCubit extends Cubit<HomePageCubitState> {
  HomePageCubit() : super(HomePageCubitUninitialized());

  void fetchIngredients() {
    emit(HomePageCubitLoading());

    FireStoreService.current.getIngredients().listen((data) {
      final ingredients = data.docs.map((e) => Ingredient.fromFirebase(e)).toList();

      emit(HomePageCubitInitialized(ingredients: ingredients));
     });
  }

  Future<void> addIngredient(Ingredient ingredient) async {
    await FireStoreService.current.addIngredient(ingredient);
  }
}