import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/meals_provider.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FilterNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.lactoseFree: false,
          Filters.vegetarian: false,
          Filters.vegan: false,
        });
  void setFilters(Map<Filters, bool> choosenFilters) {
    state = choosenFilters;
  }

  void setFilter(Filters filters, bool isActive) {
    state = {...state, filters: isActive};
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<Filters, bool>>(
        (ref) => FilterNotifier());

final filterMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilter = ref.watch(filterProvider);
  return meals.where((meal) {
    if (activeFilter[Filters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilter[Filters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilter[Filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilter[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
