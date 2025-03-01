import 'package:flutter/material.dart';
import '../../utils/theme.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPageData> _pages = [
    OnboardingPageData(
      title: '随时随地保持安全',
      description: '实时追踪您的位置并与受信任的联系人共享，以增强个人安全。',
      imagePath: 'assets/images/location_shield.png',
    ),
    OnboardingPageData(
      title: '快速紧急响应',
      description: '一键紧急警报，向您信任的联系人发送您的确切位置和情况详情。',
      imagePath: 'assets/images/sos_button.png',
    ),
    OnboardingPageData(
      title: '追踪您的安全分数',
      description: '监控您的安全习惯并获取个性化建议以提高您的安全性。',
      imagePath: 'assets/images/safety_score.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                  title: _pages[index].title,
                  description: _pages[index].description,
                  imagePath: _pages[index].imagePath,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => buildDot(index),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage == _pages.length - 1) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Text(
                  _currentPage == _pages.length - 1 ? '开始使用' : '下一步',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 60), // 为底部导航栏留出空间
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButton: buildEmergencyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? AppTheme.primaryColor : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
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
                icon: const Icon(Icons.home),
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

class OnboardingPageData {
  final String title;
  final String description;
  final String imagePath;

  OnboardingPageData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}