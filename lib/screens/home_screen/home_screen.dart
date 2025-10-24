part of 'index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final disabledColor = Color(0xFFCBCBD4);
    final screenHeight = MediaQuery.of(context).size.height;
    final t = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    final products = mockProducts;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kVerticalSpace20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _getHeaderTitle(t),
                    style: textTheme.headlineSmall,
                  ),

                  Column(
                    children: [
                      SvgIcon(
                        iconName: "logout",
                        width: 32,
                        height: 32,
                      ),
                      Text(
                        t.logOut,
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: _buildBody(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgIcon(
              iconName: "home",
              color: _selectedIndex == 0 ? Colors.black : disabledColor,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(
              iconName: "wishlist",
              color: _selectedIndex == 1 ? Colors.black : disabledColor,
            ),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(
              iconName: "cart",
              color: _selectedIndex == 2 ? Colors.black : disabledColor,
            ),
            label: "Cart",
          ),
        ],
      ),
    );
  }

  String _getHeaderTitle(AppLocalizations t) {
    switch (_selectedIndex) {
      case 0:
        return "${t.welcome},\nUsername";
      case 1:
        return t.wishlist;
      case 2:
        return t.cart;
      default:
        return "${t.welcome},\nUsername";
    }
  }

  Widget _buildBody() {
    if (_selectedIndex == 0) {
      return HomeTabSection();
    }
    if (_selectedIndex == 1) {
      return WishlistTabSection();
    }
    if (_selectedIndex == 2) {
      return CartTabSection();
    }
    return Container();
  }
}
