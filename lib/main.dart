import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// --- Assuming splash_screen.dart exists and is defined elsewhere ---
// For this example, I'll create a minimal placeholder for SplashScreen
// if you don't provide its content.
// If you have a splash_screen.dart, make sure it's correctly imported.

// Placeholder SplashScreen (replace with your actual SplashScreen code if different)
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 2500), () {}); // Simulate loading
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100)
                .animate()
                .fadeIn(duration: 600.ms)
                .scale(delay: 200.ms, duration: 800.ms, curve: Curves.elasticOut),
            SizedBox(height: 20),
            Text(
              'Paihaisuth Loading...',
              style: TextStyle(fontSize: 20, color: colorOnSurfaceAndBackground),
            ).animate().fadeIn(delay: 500.ms, duration: 600.ms),
          ],
        ),
      ),
    );
  }
}
// --- End Placeholder SplashScreen ---


// --- New Color Palette ---
const Color colorBackground = Color(0xFF201E43);
const Color colorSurface = Color(0xFF134B70);     // For cards
const Color colorPrimary = Color(0xFF508C9B);     // Accent/interactive elements
const Color colorOnSurfaceAndBackground = Color(0xFFEEEEEE); // Text color
// --- End New Color Palette ---


void main() {
  // runApp(MyApp());
  runApp(SplashScreenApp()); // NEW: Run the SplashScreenApp first
}

// WIDGET: This will be the root of your app temporarily to show the splash screen.
// It hosts a MaterialApp for the SplashScreen.
class SplashScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paihaisuth Loading', // You can have a different title for the loading phase
      themeMode: ThemeMode.dark, // Match your app's theme mode
      darkTheme: ThemeData( // Minimal theme for splash screen
        brightness: Brightness.dark,
        scaffoldBackgroundColor: colorBackground, // Use your app's background
      ),
      home: SplashScreen(), // Start with the SplashScreen widget
      debugShowCheckedModeBanner: false,
    );
  }
}

// Data class for link items
class LinkItem {
  final String text;
  final String? description;
  final String url;
  final IconData icon;
  final Color brandColor; // This is the icon's circle color, not theme related
  final Color iconForegroundColor;
  final bool isComingSoon;

  LinkItem({
    required this.text,
    this.description,
    required this.url,
    required this.icon,
    required this.brandColor,
    required this.iconForegroundColor,
    this.isComingSoon = false,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paihaisuth',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: colorPrimary,
          onPrimary: colorBackground, // Text on primary buttons (e.g., if solid)
          secondary: colorPrimary.withAlpha(200), // Can be another accent
          onSecondary: colorBackground,
          error: Colors.red.shade300,
          onError: Colors.black,
          surface: colorSurface,         // Card backgrounds, Dialogs
          onSurface: colorOnSurfaceAndBackground,      // Text on Cards
          background: colorBackground,    // Scaffold Background
          onBackground: colorOnSurfaceAndBackground // Text directly on Background
        ),
        scaffoldBackgroundColor: colorBackground, // Ensures match
        appBarTheme: AppBarTheme(
          backgroundColor: colorBackground.withAlpha(240), // Slightly transparent or solid
          elevation: 0,
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: colorOnSurfaceAndBackground.withAlpha(245), // Opacity via alpha
          ),
          iconTheme: IconThemeData(color: colorOnSurfaceAndBackground.withAlpha(245)),
        ),
        cardTheme: CardTheme(
          elevation: 4,
          color: colorSurface, // Explicitly use surface color for cards
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias, // Important for InkWell ripple
        ),
        textTheme: TextTheme(
          headlineSmall: TextStyle(fontFamily: 'Poppins', color: colorOnSurfaceAndBackground.withAlpha(245), fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontFamily: 'Poppins', color: colorOnSurfaceAndBackground.withAlpha(230), fontWeight: FontWeight.w600),
          titleMedium: TextStyle(fontFamily: 'Poppins', color: colorOnSurfaceAndBackground.withAlpha(220), fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(fontFamily: 'Poppins', color: colorOnSurfaceAndBackground.withAlpha(200), fontSize: 14.5),
          bodySmall: TextStyle(fontFamily: 'Poppins', color: colorOnSurfaceAndBackground.withAlpha(180), fontSize: 12.5),
          labelSmall: TextStyle(fontFamily: 'Poppins', color: colorOnSurfaceAndBackground.withAlpha(200), fontSize: 10),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// --- UPDATED _MyHomePageState Class ---
class _MyHomePageState extends State<MyHomePage> {
  // --- Data for Sections ---
  final List<LinkItem> _comingSoonItems = [
    LinkItem(
      text: 'Roblox Game',
      description: 'ผจญภัยในโลกกว้างกับเกม Roblox ของเรา (เร็วๆ นี้)',
      url: '#', // Placeholder URL
      icon: FontAwesomeIcons.gamepad,
      brandColor: Colors.deepPurpleAccent.shade100,
      iconForegroundColor: Colors.white,
      isComingSoon: true,
    ),
    LinkItem(
      text: 'เว็บคนกลาง',
      description: 'แพลตฟอร์มซื้อขาย ปลอดภัย ไร้กังวล (เร็วๆ นี้)',
      url: '#', // Placeholder URL
      icon: FontAwesomeIcons.shieldHalved, // More relevant icon
      brandColor: Colors.lightGreen.shade400,
      iconForegroundColor: Colors.black87,
      isComingSoon: true,
    ),
  ];

  final List<LinkItem> _featureItems = [
    LinkItem(
      text: 'เช็คด่านตำรวจ',
      description: 'ตรวจสอบข้อมูลด่าน จุดตรวจล่าสุด',
      url: 'https://check-darn-mai.vercel.app/',
      icon: FontAwesomeIcons.carBurst,
      brandColor: Color(0xFFfbbc05),
      iconForegroundColor: Colors.black,
    ),
    LinkItem(
      text: 'ล่าคูปองส่วนลด',
      description: 'รวมคูปอง โปรโมชั่นสุดคุ้ม ไม่พลาดทุกดีล',
      url: 'https://goldticket.vercel.app/',
      icon: FontAwesomeIcons.tags,
      brandColor: Color(0xFF34a853),
      iconForegroundColor: Colors.white,
    ),
    LinkItem(
      text: 'เรียกรถ',
      description: 'บริการเรียกรถ รับ-ส่ง สะดวก ปลอดภัย',
      url: 'https://www.facebook.com/people/WEGO-Car-Driver/61572616978837',
      icon: FontAwesomeIcons.carOn,
      brandColor: Color(0xFF1877F2),
      iconForegroundColor: Colors.white,
    ),
  ];

  final List<LinkItem> _aboutMeLinks = [
    LinkItem(
      text: 'TikTok',
      description: 'ติดตามคอนเทนต์สนุกๆ และข่าวสารของเราได้ที่นี่!',
      url: 'https://www.tiktok.com/@paihaisuth',
      icon: FontAwesomeIcons.tiktok,
      brandColor: Color(0xFF00f2ea),
      iconForegroundColor: Colors.black,
    ),
    LinkItem(
      text: 'Instagram',
      description: 'ภาพสวยๆ ไลฟ์สไตล์ และเรื่องราวของเรา',
      url: 'https://www.instagram.com/paihaisuth/',
      icon: FontAwesomeIcons.instagram,
      brandColor: Color(0xFFE4405F),
      iconForegroundColor: Colors.white,
    ),
  ];
  // --- End Data ---

  Future<void> _launchURL(String urlString, BuildContext context) async {
    if (urlString == '#') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'ลิงก์นี้ยังไม่พร้อมใช้งาน (This link is not yet available)',
            style: TextStyle(color: colorOnSurfaceAndBackground),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface.withAlpha(200),
        ),
      );
      return;
    }
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('เปิดลิงก์ไม่ได้: $urlString', style: TextStyle(color: Theme.of(context).colorScheme.onError)),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0, top: 20.0),
      child: Text(
        title,
        style: theme.textTheme.headlineSmall,
      ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.1, duration: 300.ms),
    );
  }

  Widget _buildComingSoonSection(BuildContext context, double mainPadding) {
    final screenSize = MediaQuery.of(context).size;
    final double horizontalSectionHeight = screenSize.height * 0.32;
    final double horizontalCardWidth = screenSize.width * 0.7;

    if (_comingSoonItems.isEmpty) {
      return SizedBox.shrink();
    }

    return Container(
      height: horizontalSectionHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: _comingSoonItems.length,
        padding: EdgeInsets.symmetric(horizontal: mainPadding / 1.5),
        itemBuilder: (context, index) {
          final item = _comingSoonItems[index];
          return Padding(
            padding: EdgeInsets.only(right: mainPadding),
            child: SizedBox(
              width: horizontalCardWidth,
              child: GridItemCard(
                item: item,
                onTap: () => _launchURL(item.url, context),
                isEmphasized: true,
              )
              .animate()
              .fadeIn(duration: 400.ms, delay: (100 * index).ms)
              .slideX(begin: 0.2, end: 0, duration: 600.ms, curve: Curves.elasticOut),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeatureGridSection(BuildContext context, double mainPadding) {
    if (_featureItems.isEmpty) {
      return SizedBox.shrink();
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: mainPadding,
        mainAxisSpacing: mainPadding,
        childAspectRatio: 0.95,
      ),
      itemCount: _featureItems.length,
      itemBuilder: (context, index) {
        final item = _featureItems[index];
        final baseDelay = _comingSoonItems.isNotEmpty ? (200 + 150 * _comingSoonItems.length).ms : 200.ms;
        return GridItemCard(
          item: item,
          onTap: () => _launchURL(item.url, context),
        )
        .animate()
        .fadeIn(duration: 500.ms, delay: baseDelay + (100 * index).ms)
        .slideY(begin: 0.2, end: 0, duration: 400.ms, curve: Curves.easeOutCubic);
      },
    );
  }

  Widget _buildAboutMeGridSection(BuildContext context, double mainPadding) {
    if (_aboutMeLinks.isEmpty) {
      return SizedBox.shrink();
    }
    // Calculate baseDelay for this section.
    // It should start after the "Coming Soon" and "Features" items have had a chance to start animating.
    final Duration comingSoonAnimationDuration = _comingSoonItems.isNotEmpty ? (200 + 150 * _comingSoonItems.length).ms : 0.ms;
    final Duration featuresAnimationDuration = _featureItems.isNotEmpty ? (100 * _featureItems.length).ms : 0.ms;
    final Duration baseDelayOffsetForFeatures = _comingSoonItems.isNotEmpty ? 200.ms : 200.ms; // Initial delay for features

    // Total delay before "About Me" starts = delay from "Coming Soon" + initial delay for "Features" + animation duration of "Features" items
    final Duration aboutMeBaseDelay = comingSoonAnimationDuration + baseDelayOffsetForFeatures + featuresAnimationDuration;


    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: mainPadding,
        mainAxisSpacing: mainPadding,
        childAspectRatio: 0.95,
      ),
      itemCount: _aboutMeLinks.length,
      itemBuilder: (context, index) {
        final item = _aboutMeLinks[index];
        return GridItemCard(
          item: item,
          onTap: () => _launchURL(item.url, context),
        )
        .animate()
        .fadeIn(duration: 500.ms, delay: aboutMeBaseDelay + (100 * index).ms)
        .slideY(begin: 0.2, end: 0, duration: 400.ms, curve: Curves.easeOutCubic);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double mainPadding = screenSize.width * 0.045;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Paihaisuth')
            .animate()
            .fadeIn(duration: 600.ms, delay: 300.ms)
            .slideY(begin: -0.2, end: 0, duration: 500.ms),
      ),
      body: ListView(
        padding: EdgeInsets.all(mainPadding),
        physics: BouncingScrollPhysics(),
        children: [
          if (_comingSoonItems.isNotEmpty) ...[
            _buildSectionHeader(context, "✨ เร็ว ๆ นี้ (Coming Soon)"),
            _buildComingSoonSection(context, mainPadding),
            SizedBox(height: mainPadding * 0.8),
          ],

          if (_featureItems.isNotEmpty) ...[
            _buildSectionHeader(context, "🚀 ฟีเจอร์หลัก (Features)"),
            _buildFeatureGridSection(context, mainPadding),
            SizedBox(height: mainPadding * 0.8),
          ],
          
          if (_aboutMeLinks.isNotEmpty) ...[
            _buildSectionHeader(context, "💡 เกี่ยวกับเรา (About Me)"),
            _buildAboutMeGridSection(context, mainPadding),
            SizedBox(height: mainPadding),
          ],
        ],
      )
    .animate()
    .fadeIn(duration: 500.ms, delay: 100.ms)
    .slideY(
        begin: 0.2,
        end: 0.0,
        curve: Curves.elasticOut,
        duration: 800.ms
    )
    .scaleXY(begin: 0.95, end: 1.0, curve: Curves.easeOutCubic, duration: 600.ms),
    );
  }
}
// --- End UPDATED _MyHomePageState Class ---


class GridItemCard extends StatelessWidget {
  final LinkItem item;
  final VoidCallback onTap;
  final bool isEmphasized;

  const GridItemCard({
    Key? key,
    required this.item,
    required this.onTap,
    this.isEmphasized = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    const double baseTitleEmphasized = 16.0;
    const double baseTitleNormal = 14.5;
    const double baseDescEmphasized = 13.0;
    const double baseDescNormal = 12.0;

    final double textScaleFactor = (screenSize.width / 375.0).clamp(0.9, 1.2);

    final double cardPadding = screenSize.width * (isEmphasized ? 0.035 : 0.03);
    final double iconContainerSize = screenSize.width * (isEmphasized ? 0.15 : 0.13);
    final double iconSize = iconContainerSize * 0.55;

    final double titleFontSize = (isEmphasized ? baseTitleEmphasized : baseTitleNormal) * textScaleFactor;
    final double descriptionFontSize = (isEmphasized ? baseDescEmphasized : baseDescNormal) * textScaleFactor;

    Widget cardContent = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: iconContainerSize,
                height: iconContainerSize,
                decoration: BoxDecoration(
                  color: item.brandColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50),
                      blurRadius: isEmphasized ? 8 : 5,
                      offset: Offset(0, isEmphasized ? 4 : 2),
                    )
                  ],
                ),
                child: Center(
                  child: FaIcon(
                    item.icon,
                    size: iconSize,
                    color: item.iconForegroundColor,
                  ),
                ),
              ),
              SizedBox(height: cardPadding * (isEmphasized ? 0.8 : 0.6)),
              Text(
                item.text,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: titleFontSize,
                  color: theme.colorScheme.onSurface,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (item.description != null && item.description!.isNotEmpty) ...[
                SizedBox(height: cardPadding * 0.4),
                Text(
                  item.description!,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: descriptionFontSize,
                    color: theme.colorScheme.onSurface.withAlpha(200),
                  ),
                  maxLines: isEmphasized ? 3 : 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          );

    return Card(
      child: InkWell(
        onTap: onTap,
        splashColor: item.brandColor.withAlpha(50),
        highlightColor: item.brandColor.withAlpha(30),
        child: Padding(
          padding: EdgeInsets.all(cardPadding),
          child: isEmphasized && item.isComingSoon
            ? Stack(
                clipBehavior: Clip.none,
                children: [
                  cardContent,
                  Positioned(
                    top: -8,
                    right: -8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withAlpha(220),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(8)
                        ),
                         boxShadow: [
                           BoxShadow(color: Colors.black.withAlpha(70), blurRadius: 4, offset: Offset(1,1))
                         ]
                      ),
                      child: Text(
                        "เร็วๆ นี้",
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 10 * textScaleFactor.clamp(1.0, 1.1),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : cardContent,
        ),
      ),
    );
  }
}