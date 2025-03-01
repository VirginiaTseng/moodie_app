import 'package:flutter/material.dart';
import '../utils/theme.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('社区'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 心愿瓶
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '心愿瓶',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    '分享你的心愿或阅读他人的',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      3,
                      (index) => _buildWishBottle(index),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // 发现你的兴趣
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '发现你的兴趣',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '加入本地活动，结识志同道合的人',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // 你的兴趣
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '你的兴趣',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildInterestChip('瑜伽', true),
                      _buildInterestChip('艺术', true),
                      _buildInterestChip('阅读', true),
                      _buildInterestChip('烹饪', false),
                      _buildInterestChip('摄影', true),
                      _buildInterestChip('音乐', false),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // 即将举行的活动
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '即将举行的活动',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('查看全部'),
                  ),
                ],
              ),
            ),
            
            // 活动列表
            _buildEventCard(
              image: 'assets/images/yoga.jpg',
              title: '公园瑜伽',
              date: '2025-02-20 at 09:00 AM',
              location: '中央公园',
              participants: 15,
              category: '健康',
            ),
            _buildEventCard(
              image: 'assets/images/art.jpg',
              title: '艺术与手工工作坊',
              date: '2025-02-22 at 02:00 PM',
              location: '社区中心',
              participants: 8,
              category: '创意',
            ),
            _buildEventCard(
              image: 'assets/images/book.jpg',
              title: '读书俱乐部会议',
              date: '2025-02-24 at 06:30 PM',
              location: '当地图书馆',
              participants: 12,
              category: '教育',
            ),
            
            const SizedBox(height: 20),
            
            // 每日健康小贴士
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '每日健康小贴士',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade300,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.psychology,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '练习正念',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '今天花5分钟专注于呼吸，活在当下。',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 60), // 为底部导航栏留出空间
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(3), // 3表示社区标签被选中
      floatingActionButton: buildEmergencyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildWishBottle(int index) {
    return Stack(
      children: [
        Container(
          width: 80,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        if (index == 2)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                size: 16,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildInterestChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryColor : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey.shade700,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildEventCard({
    required String image,
    required String title,
    required String date,
    required String location,
    required int participants,
    required String category,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey.shade300,
                    child: Center(
                      child: Icon(
                        title.contains('瑜伽') ? Icons.self_improvement :
                        title.contains('艺术') ? Icons.palette :
                        Icons.book,
                        size: 40,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                category,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue.shade800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 14,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              date,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 14,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              location,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.people,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '$participants 人已加入',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primaryColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                '加入',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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