import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/screens/favorites_screen.dart';
import 'package:flutter_fest/application/ui/screens/main_tabs/main_tabs_view_model.dart';
import 'package:flutter_fest/application/ui/screens/main_tabs/schedule_widget.dart';
import 'package:provider/provider.dart';

class MainTabsScreen extends StatelessWidget {
  const MainTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.select(
      (MainTabsViewModel value) => value.currentTabIndex,
    );
    return const Scaffold(
      body: _BodyWidget(),
      bottomNavigationBar: _NavBarWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.select(
      (MainTabsViewModel value) => value.currentTabIndex,
    );
    return IndexedStack(
      index: currentIndex,
      children: const [
        ScheduleWidget(),
        FavoriteScreen(),
        Center(
          child: Text(
            '3',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

class _NavBarWidget extends StatelessWidget {
  const _NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainTabsViewModel>();
    final currentIndex = context.select(
      (MainTabsViewModel value) => value.currentTabIndex,
    );

    final theme = Theme.of(context).bottomNavigationBarTheme;
    final buttons = [
      _BottomNavigationBarItemFactory(const Icon(Icons.rocket), 'Расписание'),
      _BottomNavigationBarItemFactory(const Icon(Icons.rocket), 'Избранное'),
      _BottomNavigationBarItemFactory(
          const Icon(Icons.rocket), 'Как добраться'),
    ]
        .asMap()
        .map((index, value) {
          return MapEntry(index, value.build(index, currentIndex, theme));
        })
        .values
        .toList();
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: model.setCurrentTabIndex,
      items: buttons,
    );
  }
}

class _BottomNavigationBarItemFactory {
  final Icon iconName;
  final String tooltip;

  _BottomNavigationBarItemFactory(this.iconName, this.tooltip);

  BottomNavigationBarItem build(
    int index,
    int currentIndex,
    BottomNavigationBarThemeData theme,
  ) {
    final selectedColor = theme.selectedItemColor;
    final unselectedColor = theme.unselectedItemColor;
    final color = index == currentIndex ? selectedColor : unselectedColor;

    return BottomNavigationBarItem(
      label: '',
      icon: Icon(
        Icons.rocket,
        color: color,
      ),
      tooltip: tooltip,
    );
  }
}
