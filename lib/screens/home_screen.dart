import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../widgets/safety_score_card.dart';
import '../widgets/weather_safety_card.dart';
import '../widgets/activity_card.dart';
import '../widgets/drawer_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moodie'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
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
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 顶部卡片区域
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SafetyScoreCard(score: 85),
                    ContactsCard(count: 5),
                    SafeZonesCard(count: 3),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              
              // SOS 和安全行走按钮
              Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      context,
                      icon: Icons.warning_amber_rounded,
                      label: 'SOS 警报',
                      subLabel: '紧急帮助',
                      color: Colors.red.shade100,
                      iconColor: AppTheme.accentColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildActionButton(
                      context,
                      icon: Icons.directions_walk,
                      label: '安全行走',
                      subLabel: '追踪行程',
                      color: Colors.purple.shade50,
                      iconColor: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // 天气和安全信息
              const WeatherSafetyCard(),
              
              const SizedBox(height: 20),
              
              // 最近活动
              const Text(
                '最近活动',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const ActivityCard(
                icon: Icons.check_circle,
                title: '安全检查已完成',
                time: '今天, 10:30 AM',
                iconColor: Colors.green,
              ),
              const ActivityCard(
                icon: Icons.add_location,
                title: '新安全区域已添加',
                time: '昨天, 3:45 PM',
                iconColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButton: buildEmergencyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                  fontSize: 16,
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

  Widget buildBottomNavigationBar() {
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
                icon: const Icon(Icons.home, color: AppTheme.primaryColor),
                onPressed: () {},
                tooltip: 'Home',
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.map),
                onPressed: () {},
                tooltip: 'Map',
              ),
            ),
            const Expanded(child: SizedBox()), // 为紧急按钮留出空间
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {},
                tooltip: 'Community',
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {},
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
        // 显示紧急选项
      },
    );
  }
}

class ContactsCard extends StatelessWidget {
  final int count;
  
  const ContactsCard({Key? key, required this.count}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.people, color: Colors.white, size: 30),
        const SizedBox(height: 8),
        Text(
          '联系人',
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
        ),
        Text(
          '$count 活跃',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class SafeZonesCard extends StatelessWidget {
  final int count;
  
  const SafeZonesCard({Key? key, required this.count}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.location_on, color: Colors.white, size: 30),
        const SizedBox(height: 8),
        Text(
          '安全区域',
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
        ),
        Text(
          '$count 区域',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}