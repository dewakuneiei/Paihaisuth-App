import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:async';
import 'main.dart'; // To navigate to your existing MyApp

// Re-use colors from your main.dart for consistency
const Color colorBackground = Color(0xFF201E43);
// const Color colorPrimary = Color(0xFF508C9B);
// const Color colorOnSurfaceAndBackground = Color(0xFFEEEEEE);

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // --- Etsy-Inspired Animation Durations (in milliseconds) ---

  static const int _initialDelayMs = 200;

  // Appearance
  static const int _fadeInDurationMs = 500;
  static const int _initialScaleUpDurationMs = 500; // Icon scales from 0.8 to 1.0

  // Playful "Bop"
  static const int _bopAnticipationMs = 150;    // Icon scales down slightly (e.g., to 0.92)
  static const int _bopOvershootMs = 250;       // Icon scales up slightly (e.g., to 1.08)
  static const int _bopSettleMs = 350;          // Icon settles back to 1.0 with elasticOut

  // Hold
  static const int _holdDurationMs = 700; // How long the icon stays static after the bop

  // Exit
  static const int _exitAnimationDurationMs = 400; // Icon scales down and fades out

  // Calculate total duration for navigation
  // Sum of all sequential animation phases.
  final int _totalSplashScreenDurationMs = _initialDelayMs +
      _fadeInDurationMs +
      _initialScaleUpDurationMs +
      _bopAnticipationMs +
      _bopOvershootMs +
      _bopSettleMs +
      _holdDurationMs +
      _exitAnimationDurationMs +
      100; // Small buffer before navigation starts

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: _totalSplashScreenDurationMs));

    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => MyApp(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 600), // Page transition fade
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const double initialImageDisplaySize = 120.0;

    return Scaffold(
      backgroundColor: colorBackground,
      body: Center(
        child: Image.asset(
          'assets/icon/app_icon.jpg', // Ensure this path is correct
          width: initialImageDisplaySize,
          height: initialImageDisplaySize,
          fit: BoxFit.contain,
        )
        .animate(delay: _initialDelayMs.ms)

        // 1. Initial Appearance: Fade in, then scale up
        .fadeIn(duration: _fadeInDurationMs.ms, curve: Curves.easeOutCubic)
        .then() // Ensure fadeIn completes before scale starts
        .scale(
            duration: _initialScaleUpDurationMs.ms,
            begin: const Offset(0.8, 0.8), // Start slightly smaller
            end: const Offset(1.0, 1.0),   // Scale to normal size
            curve: Curves.easeOutBack, // A curve with a slight overshoot
        )

        // 2. Playful "Bop" Sequence
        .then() // Wait for initial scale to complete
        .scale( // Anticipation: scale down a bit
            duration: _bopAnticipationMs.ms,
            end: const Offset(0.92, 0.92),
            curve: Curves.easeInQuad,
        )
        .scale( // Overshoot: scale up a bit
            duration: _bopOvershootMs.ms,
            end: const Offset(1.08, 1.08),
            curve: Curves.easeOutQuad,
        )
        .scale( // Settle: back to normal size with an elastic feel
            duration: _bopSettleMs.ms,
            end: const Offset(1.0, 1.0),
            curve: Curves.elasticOut, // Standard ElasticOutCurve
        )

        // 3. Hold: Icon remains static for a period
        .then(delay: _holdDurationMs.ms)

        // 4. Exit Animation: Scale down and fade out concurrently
        .scale(
            duration: _exitAnimationDurationMs.ms,
            end: const Offset(0.7, 0.7), // Scale down
            curve: Curves.easeInCubic,
        )
        .fadeOut(
            duration: _exitAnimationDurationMs.ms, // Same duration as scale
            curve: Curves.easeInCubic,
        ),
      ),
    );
  }
}