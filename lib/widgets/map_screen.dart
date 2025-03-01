import 'package:flutter/material.dart';
import '../utils/theme.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('安全地图'),
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
      body: Column(
        children: [
          // 搜索栏
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '搜索位置...',
                  prefixIcon: const Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 24,
                        width: 1,
                        color: Colors.grey.shade300,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      IconButton(
                        icon: const Icon(Icons.mic),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // 过滤器按钮
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildFilterChip(
                  label: '安全路线',
                  icon: Icons.shield,
                  color: AppTheme.primaryColor,
                  isSelected: true,
                ),
                const SizedBox(width: 8),
                _buildFilterChip(
                  label: '风险区域',
                  icon: Icons.warning,
                  color: Colors.red,
                  isSelected: false,
                ),
                const SizedBox(width: 8),
                _buildFilterChip(
                  label: '帮助点',
                  icon: Icons.local_hospital,
                  color: Colors.green,
                  isSelected: false,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // 地图区域（实际应用中会使用地图插件）
          Expanded(
            child: Stack(
              children: [
                // 模拟地图
                Container(
                  color: Colors.grey.shade200,
                  child: Center(
                    child: Text(
                      '地图区域\n(实际应用中使用地图插件)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                
                // 地图控制按钮
                Positioned(
                  right: 16,
                  top: 16,
                  child: Column(
                    children: [
                      _buildMapControlButton(Icons.layers),
                      const SizedBox(height: 8),
                      _buildMapControlButton(Icons.navigation),
                      const SizedBox(height: 8),
                      _buildMapControlButton(Icons.add),
                      const SizedBox(height: 8),
                      _buildMapControlButton(Icons.remove),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // 底部信息卡片
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildInfoCard(
                    title: '风险等级',
                    value: '中等',
                    subtitle: '当前区域',
                    icon: Icons.trending_up,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildInfoCard(
                    title: '事件',
                    value: '3',
                    subtitle: '过去24小时',
                    icon: Icons.warning_amber_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          
          // 安全路线建议
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '建议安全路线',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                _buildRouteOption(
                  icon: Icons.directions_walk,
                  title: '通过主街',
                  details: '12分钟 • 照明良好 • 人流量大',
                  color: Colors.blue.shade100,
                ),
                const SizedBox(height: 8),
                _buildRouteOption(
                  icon: Icons.directions_bike,
                  title: '自行车道',
                  details: '8分钟 • 专用车道',
                  color: Colors.green.shade100,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(1), // 1表示地图标签被选中
      floatingActionButton: buildEmergencyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildFilterChip({
    required String label,
    required IconData icon,
    required Color color,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? color.withOpacity(0.2) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? color : Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: isSelected ? color : Colors.grey.shade600,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? color : Colors.grey.shade600,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapControlButton(IconData icon) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Icon(
        icon,
        size: 20,
        color: Colors.grey.shade700,
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRouteOption({
    required IconData icon,
    required String title,
    required String details,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade700),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  details,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.grey.shade600,
          ),
        ],
      ),
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
                onPressed: () {},
                tooltip: 'Home',
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.map,
                  color: selectedIndex == 1 ? AppTheme.primaryColor : Colors.grey,
                ),
                onPressed: () {},
                tooltip: 'Map',
              ),
            ),
            const Expanded(child: SizedBox()), // 为紧急按钮留出空间
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: selectedIndex == 3 ? AppTheme.primaryColor : Colors.grey,
                ),
                onPressed: () {},
                tooltip: 'Community',
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: selectedIndex == 4 ? AppTheme.primaryColor : Colors.grey,
                ),
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