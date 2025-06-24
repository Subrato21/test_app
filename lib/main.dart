import 'package:flutter/material.dart';

void main() => runApp(const HomeServicesApp());

class HomeServicesApp extends StatelessWidget {
  const HomeServicesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Services',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Map<String, String>> categories = [
    {'icon': 'assets/images/cleaning.png', 'label': 'Cleaning'},
    {'icon': 'assets/images/painting.png', 'label': 'Painting'},
    {'icon': 'assets/images/plumbing.png', 'label': 'Plumbing'},
    {'icon': 'assets/images/laundry.png', 'label': 'Laundry'},
    {'icon': 'assets/images/shopping.png', 'label': 'Shopping'},
  ];

  final List<Map<String, String>> providers = [
    {
      'image': 'assets/images/ML1.png',
      'name': 'Jane Cooper',
      'role': 'Painter'
    },
    {
      'image': 'assets/images/ML22.png',
      'name': 'Julian Norman',
      'role': 'Painting'
    },
    {
      'image': 'assets/images/FML7.png',
      'name': 'Robertina Fox',
      'role': 'Painter'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTopBarSection(),
              const SizedBox(height: 8),
              _buildCategoryList(),
              _buildServiceCards(),
              _buildPromotionBanner(),
              const SizedBox(height: 16),
              _buildProviderList(),
              _buildPostAJob(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBarSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF007FFF), Color(0xFF00BFFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/home-03.png', width: 24, height: 24),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Home',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Text('264 Boncycle, FL 32328',
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
              const Spacer(),
              // Notification Icon with white circular background
              // Notification Icon with badge
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset('assets/images/notification_icon.png',
                        width: 18, height: 18),
                  ),
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: const Center(
                        child: Text(
                          '5',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(width: 12),
              // Cart Icon with white circular background
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Image.asset('assets/images/shopping-cart.png',
                    width: 18, height: 18),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Search Bar (rounded)
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 8),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.grey),
                      isDense: true,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.tune, color: Colors.grey),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return Container(
      height: 100, // Increased to fit icon + label
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFE0E0E0), // light border
                    width: 1,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(12), // To center the icon inside
                child: Image.asset(
                  categories[index]['icon']!,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                categories[index]['label']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.33,
                  letterSpacing: -0.36,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildServiceCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: _serviceCard('assets/images/Rectangle-10.png',
                'Home Cleaning Services at Miami, FL', '\$199', 'Robert Fox'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _serviceCard(
                'assets/images/Rectangle-11.png',
                'Reliable Plumbing - Quick and Efficient',
                '\$189',
                'Robert Fox'),
          ),
        ],
      ),
    );
  }

  Widget _serviceCard(String image, String title, String price, String author) {
    return Container(
      width: 204, // Hug width (fixed)
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 12), // Padding per spec
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1), // 1px border
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Image area
          Container(
            width: 188,
            height: 128,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover, // Same as CSS cover
              ),
            ),
          ),
          const SizedBox(height: 12), // Gap between image and text
          // ✅ Text flow area
          SizedBox(
            width: 180, // Hug width
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '★ 4.5 · 1 hr · Painting',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF0F172A),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 20 / 14, // 142.857%
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  author,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromotionBanner() {
    return Column(
      children: [
        Center(
          child: Container(
            width: 307,
            height: 150,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.lightBlue.shade50,
            ),
            child: Row(
              children: [
                // 📷 Image
                Image.asset(
                  'assets/images/roof_cleaning.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),

                // 📄 Text + Button
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Get your roofs cleaned',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0F172A),
                          height: 1.375, // ≈22px
                        ),
                      ),
                      const SizedBox(height: 4),
                      const SizedBox(
                        width: 165,
                        child: Text(
                          'Don’t let your mind stick to the ugly roofs.',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 112,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade400,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // 🔵 Pagination Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Active dot
            Container(
              width: 12,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.blue, // Active color
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(width: 4),
            // Inactive dots
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProviderList() {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: providers.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(providers[index]['image']!),
                  radius: 24,
                ),
                const SizedBox(height: 6),
                Text(providers[index]['name']!,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold)),
                Text(providers[index]['role']!,
                    style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPostAJob() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Image.asset('assets/images/Finding.png', width: 200, height: 132),
          const SizedBox(height: 12),
          const Text(
            "Post a Job",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF0F172A), // SLATE-900
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 24 / 18, // line-height ÷ font-size = 1.3333
              fontStyle: FontStyle.normal,
            ),
          ),
          const Text("Didn't find what you're looking for?"),
          SizedBox(
            height: 24,
          ),
          SizedBox(
            width: 327,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: const Color(0xFF175CDE), // background: #175CDE
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // border-radius: 10px
                ),
              ),
              child: const Text(
                'Post a Job',
                style: TextStyle(
                  color: Colors
                      .white, // Matches selection color hsba(0, 0%, 100%, 1)
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 24 / 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        //border: Border.all(color: Colors.purpleAccent),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _navItem('assets/images/home-01.png', 'HOME', 0),
            const SizedBox(width: 32),
            _navIcon('assets/images/list.png', 1),
            const SizedBox(width: 32),
            _navIcon('assets/images/message-chat-circle.png', 2),
            const SizedBox(width: 32),
            _navIcon('assets/images/briefcase-01.png', 3),
            const SizedBox(width: 32),
            _navIcon('assets/images/user-01.png', 4),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String iconPath, String label, int index) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Container(
        width: 116,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF175CDE) : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
              color: isSelected ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navIcon(String iconPath, int index) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: SizedBox(
        width: 20,
        height: 20,
        child: Image.asset(
          iconPath,
          width: 20,
          height: 20,
          fit: BoxFit.contain,
          color: isSelected ? const Color(0xFF175CDE) : Colors.black,
        ),
      ),
    );
  }
}
