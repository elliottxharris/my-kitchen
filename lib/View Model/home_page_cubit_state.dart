import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_kitchen/Model/ingredient.dart';
import 'package:my_kitchen/Service/firestore_service.dart';


part 'home_page_cubit.dart';

abstract class HomePageCubitState extends Equatable {
  const HomePageCubitState();

  @override
  List<Object> get props => [];
}

class HomePageCubitUninitialized extends HomePageCubitState {}

class HomePageCubitLoading extends HomePageCubitState {}

class HomePageCubitInitialized extends HomePageCubitState {
  final List<Ingredient> ingredients;

  @override
  List<Object> get props => [ingredients];

  const HomePageCubitInitialized({required this.ingredients});
}