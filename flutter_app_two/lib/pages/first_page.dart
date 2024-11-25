import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  const FirstPage({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Flutter App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('No new notifications'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
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
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.9),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "FL",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Flutter App",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Version 1.0",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              _buildDrawerItem(
                icon: Icons.home,
                title: "HOME",
                index: 0,
                onTap: () {
                  Navigator.pushNamed(context, '/homepage');
                },
              ),
              _buildDrawerItem(
                icon: Icons.person,
                title: "PROFILE",
                index: 1,
                onTap: () {
                  Navigator.pushNamed(context, '/profilepage');
                },
              ),
              _buildDrawerItem(
                icon: Icons.settings,
                title: "SETTINGS",
                index: 2,
                onTap: () {
                  Navigator.pushNamed(context, '/settingspage');
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Made with ❤️ using Flutter",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back!",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Explore the app's features and customize your experience.",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                ),
                const SizedBox(height: 24),
                _buildFeatureCard(
                  context,
                  "Customize Theme",
                  "Switch between light and dark mode",
                  Icons.palette,
                  Colors.purple,
                  () => widget.toggleTheme(),
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  context,
                  "View Profile",
                  "Check and update your profile information",
                  Icons.person,
                  Colors.blue,
                  () => Navigator.pushNamed(context, '/profilepage'),
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  context,
                  "Settings",
                  "Configure app preferences",
                  Icons.settings,
                  Colors.orange,
                  () => Navigator.pushNamed(context, '/settingspage'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/homepage');
              break;
            case 1:
              Navigator.pushNamed(context, '/profilepage');
              break;
            case 2:
              Navigator.pushNamed(context, '/settingspage');
              break;
          }
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

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required int index,
    required VoidCallback onTap,
  }) {
    final isSelected = _selectedIndex == index;
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          letterSpacing: 1,
        ),
      ),
      onTap: onTap,
      selected: isSelected,
      selectedTileColor: Colors.white.withOpacity(0.1),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    String description,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).textTheme.bodySmall?.color,
                          ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}