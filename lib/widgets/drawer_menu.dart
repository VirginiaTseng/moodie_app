import 'package:flutter/material.dart';
import '../utils/theme.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppTheme.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                const SizedBox(height: 10),
                const Text(
                  '用户名',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'user@example.com',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('设置'),
            onTap: () {
              Navigator.pop(context);
              // 导航到设置页面
            },
          ),
          ListTile(
            leading: const Icon(Icons.shield),
            title: const Text('安全设置'),
            onTap: () {
              Navigator.pop(context);
              // 导航到安全设置页面
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('紧急联系人'),
            onTap: () {
              Navigator.pop(context);
              // 导航到紧急联系人页面
            },
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('安全区域'),
            onTap: () {
              Navigator.pop(context);
              // 导航到安全区域页面
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('帮助与支持'),
            onTap: () {
              Navigator.pop(context);
              // 导航到帮助页面
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('关于'),
            onTap: () {
              Navigator.pop(context);
              // 导航到关于页面
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('退出登录', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
              // 处理退出登录
            },
          ),
        ],
      ),
    );
  }
}