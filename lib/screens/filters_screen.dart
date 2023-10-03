import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(children: [
        SwitchListTile(
          value: activeFilter[Filters.glutenFree]!,
          onChanged: (isChecked) {
            ref.read(filterProvider.notifier)
            .setFilter(Filters.glutenFree, isChecked);
            
          },
          title: Text(
            'Gulten-free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Only includ gulten-free meals',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: activeFilter[Filters.lactoseFree]!,
          onChanged: (isChecked) {
            ref.read(filterProvider.notifier)
            .setFilter(Filters.lactoseFree, isChecked);
          },
          title: Text(
            'Lactose-free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Only includ lactose-free meals',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
         value: activeFilter[Filters.vegetarian]!,
          onChanged: (isChecked) {
            ref.read(filterProvider.notifier)
            .setFilter(Filters.vegetarian, isChecked);
          },
          title: Text(
            'Vegetarian',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Only includ vegetarian meals',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
         value: activeFilter[Filters.vegan]!,
          onChanged: (isChecked) {
            ref.read(filterProvider.notifier)
            .setFilter(Filters.vegan, isChecked);
          },
          title: Text(
            'Vegan',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Only includ Vegan meals',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        )
      ]),
    );
  }
}
