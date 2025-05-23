import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// --- New Color Palette ---
const Color colorBackground = Color(0xFF201E43);
const Color colorSurface = Color(0xFF134B70);     // For cards
const Color colorPrimary = Color(0xFF508C9B);     // Accent/interactive elements
const Color colorOnSurfaceAndBackground = Color(0xFFEEEEEE); // Text color
// --- End New Color Palette ---


void main() {
  runApp(MyApp());
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
          bodyMedium: TextStyle(fontFamily: 'Poppins', color: colorOnSurfaceAndBackground.withAlpha(200)),
          bodySmall: TextStyle(fontFamily: 'Poppins', color: colorOnSurfaceAndBackground.withAlpha(180)),
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
      icon: FontAwesomeIcons.tags, // Changed for variety
      brandColor: Color(0xFF34a853),
      iconForegroundColor: Colors.white,
    ),
    LinkItem(
      text: 'เรียกรถ',
      description: 'บริการเรียกรถ รับ-ส่ง สะดวก ปลอดภัย',
      url: 'https://www.facebook.com/people/WEGO-Car-Driver/61572616978837',
      icon: FontAwesomeIcons.carOn, // Changed for variety
      brandColor: Color(0xFF1877F2),
      iconForegroundColor: Colors.white,
    ),
    LinkItem(
      text: 'About Me',
      description: 'เกี่ยวกับผู้พัฒนาและโปรเจกต์นี้',
      url: '#', // Placeholder, update with actual link
      icon: FontAwesomeIcons.solidUserCircle, // Changed for variety
      brandColor: colorPrimary.withAlpha(150), // Use a theme color variation
      iconForegroundColor: colorOnSurfaceAndBackground,
    ),
  ];
  // --- End Data ---

  Future<void> _launchURL(String urlString, BuildContext context) async {
    if (urlString == '#') { // Handle placeholder URLs
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('ลิงก์นี้ยังไม่พร้อมใช้งาน (This link is not yet available)'),
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
      padding: EdgeInsets.only(bottom: 12.0, top: 20.0), // Adjusted padding
      child: Text(
        title,
        style: theme.textTheme.headlineSmall, // Using direct theme style
      ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.1, duration: 300.ms),
    );
  }

Widget _buildComingSoonSection(BuildContext context, double mainPadding) {
  final screenSize = MediaQuery.of(context).size;

  // --- Adjust these values to fine-tune the appearance ---
  // Height of the entire horizontal scrolling section
  final double horizontalSectionHeight = screenSize.height * 0.32; // e.g., 32% of screen height
  // Width of each card in the horizontal slider
  final double horizontalCardWidth = screenSize.width * 0.7; // e.g., 70% of screen width, to show part of next card
  // --- End of adjustable values ---

  if (_comingSoonItems.isEmpty) {
    return SizedBox.shrink(); // Don't build section if there are no "coming soon" items
  }

  return Container(
    height: horizontalSectionHeight,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(), // Adds the bounce effect on overscroll
      itemCount: _comingSoonItems.length,
      // Add some horizontal padding for the list itself so cards don't touch screen edges initially
      padding: EdgeInsets.symmetric(horizontal: mainPadding / 1.5),
      itemBuilder: (context, index) {
        final item = _comingSoonItems[index];
        return Padding(
          // Spacing between cards in the horizontal list
          padding: EdgeInsets.only(
            right: mainPadding, // Space to the right of each card
          ),
          child: SizedBox(
            width: horizontalCardWidth,
            // The GridItemCard will inherently try to fit its content.
            // Its height will be determined by its content and the constrained width.
            // Ensure horizontalSectionHeight is enough for the card's content + any vertical padding within ListView.
            child: GridItemCard(
              item: item,
              onTap: () => _launchURL(item.url, context),
              isEmphasized: true, // This will keep the "SOON" badge and specific styling
            )
            .animate() // Animate each card individually
            .fadeIn(duration: 400.ms, delay: (100 * index).ms)
            .slideX(begin: 0.2, end: 0, duration: 300.ms, curve: Curves.easeOutCubic),
          ),
        );
      },
    ),
  );
}

Widget _buildFeatureGridSection(BuildContext context, double mainPadding) {
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: mainPadding,
      mainAxisSpacing: mainPadding,
      childAspectRatio: 0.95, // Adjusted for text with description
    ),
    itemCount: _featureItems.length,
    itemBuilder: (context, index) {
      final item = _featureItems[index];
      final baseDelay = _comingSoonItems.isNotEmpty ? (200 + 150 * _comingSoonItems.length).ms : 200.ms;
      return GridItemCard(
        item: item,
        onTap: () => _launchURL(item.url, context),
        // isEmphasized is false by default, so regular grid styling
      )
      .animate()
      .fadeIn(duration: 500.ms, delay: baseDelay + (100 * index).ms)
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
        physics: BouncingScrollPhysics(), // Adds bounce to the main vertical scroll
        children: [
          _buildSectionHeader(context, "✨ เร็ว ๆ นี้ (Coming Soon)"),
          _buildComingSoonSection(context, mainPadding),
          SizedBox(height: mainPadding * 0.8), // Space between sections
          _buildSectionHeader(context, "🚀 ฟีเจอร์หลัก (Features)"),
          _buildFeatureGridSection(context, mainPadding),
          SizedBox(height: mainPadding), // Some padding at the bottom
        ],
      ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.03, end: 0.0, curve: Curves.easeOutCubic, duration: 500.ms), // Gentle entry animation
    );
  }
}

class GridItemCard extends StatelessWidget {
  final LinkItem item;
  final VoidCallback onTap;
  final bool isEmphasized; // Used for "Coming Soon" or other special cards

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

    final double cardPadding = screenSize.width * (isEmphasized ? 0.035 : 0.03);
    final double iconContainerSize = screenSize.width * (isEmphasized ? 0.15 : 0.13);
    final double iconSize = iconContainerSize * 0.55;
    final double titleFontSize = isEmphasized ? 15.5 : 14;
    final double descriptionFontSize = isEmphasized ? 12.5 : 11.5;


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
                      color: Colors.black.withAlpha(50), // Softer shadow
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
                    color: theme.colorScheme.onSurface.withAlpha(200), // Slightly less prominent
                  ),
                  maxLines: isEmphasized ? 3 : 2, // More lines for emphasized cards
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          );


    return Card(
      // Card uses theme.cardTheme
      child: InkWell(
        onTap: onTap,
        splashColor: item.brandColor.withAlpha(50), // Softer splash
        highlightColor: item.brandColor.withAlpha(30), // Softer highlight
        child: Padding(
          padding: EdgeInsets.all(cardPadding),
          child: isEmphasized && item.isComingSoon // Special badge for "Coming Soon"
            ? Stack(
                clipBehavior: Clip.none,
                children: [
                  cardContent,
                  Positioned(
                    top: -8, // Adjust to position correctly based on card padding
                    right: -8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withAlpha(220),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12), // Match card's border radius for the corner
                          bottomLeft: Radius.circular(8)
                        ),
                         boxShadow: [
                           BoxShadow(color: Colors.black.withAlpha(70), blurRadius: 4, offset: Offset(1,1))
                         ]
                      ),
                      child: Text(
                        "SOON",
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
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