
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/fonts.dart';
import '../../utils/navigator.dart';
import '../auth/signin_screen/login_screen.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'image': 'assets/images/img2.png',
      'title': 'Profit increase',
      'description': ' Increase the number of customers for your store and expand the area',
    },
    {
      'image': 'assets/images/img2.png',
      'title': 'Track your drivers',
      'description': 'You can track drivers and distribute orders between them',
    },
    {
      'image': 'assets/images/img2.png',
      'title': 'Track Your Order',
      'description': 'Tracking Order',
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _onGetStartedPressed() {
    // Implement the logic for the "Get Started" button
    print("Get Started pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Image.asset(
                        _onboardingData[index]['image']!,
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(

                        child: Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildPageIndicator(),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                          ),

                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20,),
                              Text(
                                _onboardingData[index]['title']!,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                _onboardingData[index]['description']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 70),
                              SizedBox(
                                height: 50,
                                width: 200,
                                child: ElevatedButton(
                                  style:ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                                  ),

                                  onPressed: (){
                                    if(   _currentPage == _onboardingData.length - 1){
                                   pushReplacementScreen(context, const LoginScreen());
                                    }else{
                                      _pageController.nextPage(duration: const Duration(milliseconds:300 ), curve: Curves.linear);
                                    }

                                  },
                                  child: Text(
                                    _currentPage == _onboardingData.length - 1
                                        ? "Get Started"
                                        : "Next",
                                style: whitebasic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _onboardingData.length; i++) {
      indicators.add(
        Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i ? Colors.blue : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }
}
