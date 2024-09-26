import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../generated/l10n.dart';

/// `IntroPage` is a StatefulWidget that represents an introduction screen with a series of slides.
/// It allows users to navigate through the slides and complete the introduction.
class IntroPage extends StatefulWidget {
  /// Creates an instance of `IntroPage`.
  ///
  /// @param key An optional key to identify the widget.
  const IntroPage({final Key? key}) : super(key: key);

  @override
  _IntroPage createState() => _IntroPage();
}

class _IntroPage extends State<IntroPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    ///< Initializes the PageController for slide navigation.
  }

  @override
  Widget build(final BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final slideList = slides(mediaQuery.size);

    return Scaffold(
      body: SafeArea(
        child: GFIntroScreen(
          color: Colors.blueGrey,
          slides: slideList,

          ///< List of slides to be displayed.
          pageController: _pageController,

          ///< Controller to manage the slide page changes.
          currentIndex: 0,

          ///< Initial index of the current slide.
          pageCount: slideList.length,

          ///< Total number of slides.
          introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
            pageController: _pageController,
            pageCount: slideList.length,
            currentIndex: 0,
            onDoneTap: _completeIntro,

            ///< Action to perform when the introduction is completed.
          ),
        ),
      ),
    );
  }

  /// Creates a list of slides to be displayed on the introduction screen.
  ///
  /// @param size The size of the screen to adjust the slides accordingly.
  /// @return A list of widgets representing the slides.
  List<Widget> slides(final Size size) {
    return [
      Container(
        child: GFImageOverlay(
          width: size.width,
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 70.0, left: 20),
                child: Text(
                  S.of(context).welcomeText,
                  style: const TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 25),
                ),
              ),
            ],
          ),
          color: Colors.orange,
          image: const AssetImage('assets/images/splash_background.jpg'),
          boxFit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withAlpha((0.2 * 255).toInt()), BlendMode.darken),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      // Add other slides here
    ];
  }

  /// Marks the introduction as complete and navigates to the home page.
  ///
  /// This method is called when the user finishes the introduction slides.
  Future<void> _completeIntro() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('intro_seen', true);

    ///< Saves the 'intro_seen' flag in shared preferences.

    // Navigate to home page after completion
    if (mounted) {
      context.go('/home');

      ///< Navigates to the home page.
    }
  }
}
