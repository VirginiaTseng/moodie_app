import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../widgets/safety_score_card.dart';
import '../widgets/weather_safety_card.dart';
import '../widgets/activity_card.dart';
import '../widgets/drawer_menu.dart';
import '../widgets/map_screen.dart';
import '../widgets/community_screen.dart';
import '../widgets/profile_screen.dart';
import '../widgets/safe_zones_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const MapScreen(),
    const SizedBox(), // Placeholder for emergency button
    const CommunityScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text('Moodie'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.mic),
            onPressed: () {},
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: buildBottomNavigationBar(_selectedIndex),
      floatingActionButton: buildEmergencyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildBottomNavigationBar(int selectedIndex) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: selectedIndex == 0 ? AppTheme.primaryColor : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                tooltip: 'Home',
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.map,
                  color: selectedIndex == 1 ? AppTheme.primaryColor : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                tooltip: 'Map',
              ),
            ),
            const Expanded(child: SizedBox()), // Space for emergency button
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.people,
                  color: selectedIndex == 3 ? AppTheme.primaryColor : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
                tooltip: 'Community',
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: selectedIndex == 4 ? AppTheme.primaryColor : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 4;
                  });
                },
                tooltip: 'Profile',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmergencyButton() {
    return FloatingActionButton(
      backgroundColor: AppTheme.accentColor,
      child: const Icon(Icons.warning_amber_rounded, size: 30),
      onPressed: () {
        // Show emergency options
      },
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SafetyScoreCard(score: 85, label: "Safety Score"),
                  SafeZonesCard(count: 3, label: "Safe Zones", zonesLabel: "Zones"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const WeatherSafetyCard(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(
                  context,
                  icon: Icons.shield,
                  label: 'Safety Check',
                  subLabel: 'Check your safety settings',
                  color: Colors.blue.shade50,
                  iconColor: Colors.blue,
                ),
                _buildActionButton(
                  context,
                  icon: Icons.location_on,
                  label: 'Safety Zones',
                  subLabel: 'Manage your safety zones',
                  color: Colors.purple.shade50,
                  iconColor: Colors.purple,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Activities',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const ActivityCard(
              icon: Icons.check_circle,
              title: 'Safety check completed',
              time: 'Today, 10:30 AM',
              iconColor: Colors.green,
            ),
            const ActivityCard(
              icon: Icons.add_location,
              title: 'New safe zone added',
              time: 'Yesterday, 3:45 PM',
              iconColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String subLabel,
    required Color color,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                subLabel,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
