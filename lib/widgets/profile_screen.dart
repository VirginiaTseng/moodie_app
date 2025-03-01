import 'package:flutter/material.dart';
import '../utils/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人资料'),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 个人资料头部
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              color: AppTheme.primaryColor,
              child: Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '用户名',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '用户ID: 12345678',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit, color: AppTheme.primaryColor),
                      label: const Text(
                        '编辑资料',
                        style: TextStyle(color: AppTheme.primaryColor),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // 安全统计
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '安全统计',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.shield,
                          title: '安全分数',
                          value: '85%',
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.check_circle,
                          title: '安全检查',
                          value: '12',
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.location_on,
                          title: '安全区域',
                          value: '3',
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // 设置选项
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '设置',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSettingItem(
                    icon: Icons.person,
                    title: '账户信息',
                    subtitle: '管理您的个人信息',
                    iconColor: Colors.blue,
                  ),
                  _buildSettingItem(
                    icon: Icons.shield,
                    title: '安全设置',
                    subtitle: '管理您的安全偏好',
                    iconColor: Colors.green,
                  ),
                  _buildSettingItem(
                    icon: Icons.notifications,
                    title: '通知设置',
                    subtitle: '管理应用通知',
                    iconColor: Colors.orange,
                  ),
                  _buildSettingItem(
                    icon: Icons.privacy_tip,
                    title: '隐私设置',
                    subtitle: '管理您的隐私偏好',
                    iconColor: Colors.purple,
                  ),
                  _buildSettingItem(
                    icon: Icons.help,
                    title: '帮助与支持',
                    subtitle: '获取帮助和常见问题解答',
                    iconColor: Colors.teal,
                  ),
                  _buildSettingItem(
                    icon: Icons.info,
                    title: '关于',
                    subtitle: '应用信息和版本',
                    iconColor: Colors.grey,
                  ),
                ],
              ),
            ),
            
            // 退出登录按钮
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text(
                    '退出登录',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 60), // 为底部导航栏留出空间
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(4), // 4表示个人资料标签被选中
      floatingActionButton: buildEmergencyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
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