import 'package:flutter/material.dart';
import 'package:flutter_app_two/pages/profile_page.dart';
import 'package:flutter_app_two/pages/setting_page.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeContent(),
          ProfilePage(isDarkMode: widget.isDarkMode),
          SettingsPage(
            isDarkMode: widget.isDarkMode,
            toggleTheme: widget.onThemeToggle,
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          floating: false,
          pinned: true,
          actions: [
            IconButton(
              icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: widget.onThemeToggle,
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              "Welcome Home",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.8),
                  ],
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.home,
                  size: 80,
                  color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Quick Actions",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _buildQuickActionCard(
                      context,
                      "Profile",
                      Icons.person,
                      Colors.blue,
                      () => Navigator.pushNamed(context, '/profilepage'),
                    ),
                    _buildQuickActionCard(
                      context,
                      "Settings",
                      Icons.settings,
                      Colors.orange,
                      () => Navigator.pushNamed(context, '/settingspage'),
                    ),
                    _buildQuickActionCard(
                      context,
                      "Messages",
                      Icons.message,
                      Colors.green,
                      () {},
                    ),
                    _buildQuickActionCard(
                      context,
                      "Notifications",
                      Icons.notifications,
                      Colors.purple,
                      () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  "Recent Activity",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                _buildRecentActivityList(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: color,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentActivityList(BuildContext context) {
    final activities = [
      {
        'title': 'Profile Updated',
        'time': '2 hours ago',
        'icon': Icons.person,
        'color': Colors.blue,
      },
      {
        'title': 'Settings Changed',
        'time': '5 hours ago',
        'icon': Icons.settings,
        'color': Colors.orange,
      },
      {
        'title': 'New Message',
        'time': '1 day ago',
        'icon': Icons.message,
        'color': Colors.green,
      },
    ];

    return Column(
      children: activities.map((activity) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: (activity['color'] as Color).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                activity['icon'] as IconData,
                color: activity['color'] as Color,
              ),
            ),
            title: Text(
              activity['title'] as String,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            subtitle: Text(
              activity['time'] as String,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
          ),
        );
      }).toList(),
    );
  }
}
