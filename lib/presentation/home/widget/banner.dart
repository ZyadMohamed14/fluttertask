import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSection extends StatefulWidget {
  @override
  _BannerSectionState createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  final List<String> imagePaths = [
    'assets/images/hotdeal.png',
    'assets/images/hotdeal.png', // Add more image paths as needed
    'assets/images/hotdeal.png',
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double bannerHeight = constraints.maxWidth * 0.4; // Adjust height as needed

        return Column(
          children: [
            Container(
              height: bannerHeight,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return _buildImagePage(imagePaths[index]);
                },
              ),
            ),
            SizedBox(height: 10.0),
            SmoothPageIndicator(
              controller: _pageController,
              count: imagePaths.length,
              effect: ExpandingDotsEffect(
                dotHeight: 8.0,
                dotWidth: 8.0,
                activeDotColor: Colors.blue,
                dotColor: Colors.grey,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildImagePage(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
