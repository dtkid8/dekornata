import 'package:dekornata/filter.dart';
import 'package:flutter/material.dart';

class ProductPageScreen extends StatefulWidget {
  @override
  _ProductPageScreenState createState() => _ProductPageScreenState();
}

class _ProductPageScreenState extends State<ProductPageScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width;
    final double heightScreen = mediaQueryData.size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Women's Tops",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Colors.black87,
            ),
            onPressed: () {}),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              _buildTopNavigation(),
              SizedBox(height: 1),
              _buildGridProduct(widthScreen, heightScreen),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavbar(),
    );
  }

  Widget _buildBottomNavbar() {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            _iconBottomNavigationBar(
              icon: Icons.home,
              text: "Home",
              selected: false,
            ),
            _iconBottomNavigationBar(
              icon: Icons.shopping_cart,
              text: "Shop",
              selected: true,
            ),
            _iconBottomNavigationBar(
              icon: Icons.local_mall,
              text: "Bag",
              selected: false,
            ),
            _iconBottomNavigationBar(
              icon: Icons.favorite_border,
              text: "Favorites",
              selected: false,
            ),
            _iconBottomNavigationBar(
              icon: Icons.person_outline,
              text: "Profile",
              selected: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridProduct(final widthScreen, final heightScreen) {
    return Expanded(
      child: Container(
        color: Color(0xFFF6F6F6),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: widthScreen / heightScreen,
              children: <Widget>[
                _gridCell(
                  name: "T-Shirt Spanish",
                  brand: "Mango",
                  price: 9,
                  ordered: 3,
                  discount: 0,
                  image: "assets/model.jpg",
                  rating: 4,
                ),
                _gridCell(
                  name: "T-Shirt Spanish",
                  brand: "Mango",
                  price: 21,
                  ordered: 10,
                  discount: 20,
                  image: "assets/model2.jpg",
                  rating: 5,
                ),
                _gridCell(
                  name: "T-Shirt Spanish",
                  brand: "Mango",
                  price: 9,
                  ordered: 0,
                  discount: 0,
                  image: "assets/model.jpg",
                  rating: 0,
                ),
                _gridCell(
                  name: "T-Shirt Spanish",
                  brand: "Mango",
                  price: 21,
                  ordered: 10,
                  discount: 20,
                  image: "assets/model2.jpg",
                  rating: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _gridCellRating(int rating) {
    List<Widget> ratingWidget = [];
    for (var i = 1; i <= 5; i++) {
      if (rating >= i) {
        ratingWidget.add(
          Icon(
            Icons.favorite,
            color: Colors.orange,
            size: 16,
          ),
        );
      } else {
        ratingWidget.add(
          Icon(
            Icons.favorite_border,
            color: Colors.grey,
            size: 16,
          ),
        );
      }
    }
    return ratingWidget;
  }

  Widget _gridCell({
    String name,
    String brand,
    int ordered,
    double price,
    int discount,
    String image,
    int rating,
  }) {
    double discountPrice = price - ((discount / 100) * price);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        child: Stack(
          children: <Widget>[
            Container(
              width: 180,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 210,
              child: Row(
                children: <Widget>[
                  Row(
                    children: _gridCellRating(rating),
                  ),
                  SizedBox(width: 4),
                  Text(
                    "($ordered)",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 227,
              child: Text(
                brand,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            Positioned(
              top: 245,
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
                top: 270,
                child: Row(
                  children: <Widget>[
                    Text(
                      "${price.toInt()}\$",
                      style: TextStyle(
                        color: discount > 0 ? Colors.grey : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration: discount > 0 ? TextDecoration.lineThrough : TextDecoration.none,
                      ),
                    ),
                    SizedBox(width: 4),
                    discount > 0
                        ? Text(
                            "${discountPrice.toInt()}\$",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : Container(),
                  ],
                )),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 80.0,
                ),
                child: Container(
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                    size: 18,
                  ),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 5.0,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            discount > 0
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        //color: ,
                        decoration: BoxDecoration(
                          color: Color(0xFFDB3022),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "-$discount%",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _iconBottomNavigationBar({IconData icon, String text, bool selected}) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            color: selected ? Color(0xFFDB3022) : Colors.grey,
            size: 36,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: selected ? Color(0xFFDB3022) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 4.0,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 4),
          _buildContentTag(),
          SizedBox(
            height: 8,
          ),
          _buildOption(),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildOption() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: Container(
        color: Color(0xFFF5F5F5),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildOptionButton(
                  text: "Filters",
                  icon: Icons.filter_list,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FilterPage(),
                      ),
                    );
                  }),
              _buildOptionButton(text: "Price: lowest to high", icon: Icons.swap_vert),
              _buildOptionButton(text: "", icon: Icons.view_list),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton({String text, IconData icon, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 28,
          ),
          text != "" ? SizedBox(width: 8) : SizedBox(),
          text != ""
              ? Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Widget _buildContentTag() {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildTag("T-shirts"),
          _buildTag("Crop Tops"),
          _buildTag("Blouses"),
          _buildTag("Shirt"),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 4.0,
        right: 4.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 26.0,
            right: 26.0,
            top: 8.0,
            bottom: 8.0,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
