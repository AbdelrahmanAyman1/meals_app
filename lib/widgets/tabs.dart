import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/favorite_provider.dart';
import 'package:meals_app/provider/meals_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/provider/filters_provider.dart';

const kInitialFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegetarian: false,
  Filters.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selctedPageIndex = 0;

  void selcetedPage(int index) {
    setState(() {
      _selctedPageIndex = index;
    });
  }

  void _selectedScreen(String indentfire) async {
    Navigator.of(context).pop();
    if (indentfire == 'filters') {
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (context) => const FiltersScreen(),
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    final activeilter = ref.watch(filterProvider);
    final meals = ref.watch(mealsProvider);
    final availabeMeals =ref.watch(filterMealsProvider) ;

    Widget activePage = CategoriesScreen(availableMeals: availabeMeals);

    var activePageTitle = 'Categories';

    if (_selctedPageIndex == 1) {
      final favoriteMeal = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(meals: favoriteMeal);
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      drawer: MainDrawer(onSelectScreen: _selectedScreen),
      bottomNavigationBar: BottomNavigationBar(
          onTap: selcetedPage,
          currentIndex: _selctedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite')
          ]),
    );
  }
}
