import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var _selectedRange = RangeValues(78.0, 143.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Filters",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: SafeArea(
        child: Container(
          color: Color(0xFFF9F9F9),
          child: ListView(
            children: <Widget>[
              _buildFilterHeader(
                "Price range",
              ),
              _buildFilterContent(
                child: _buildRangeSlider(),
                height: 85,
              ),
              _buildFilterHeader("Colors"),
              _buildFilterContent(
                child: _buildColorsContent(),
                height: 85,
              ),
              _buildFilterHeader("Sizes"),
              _buildFilterContent(
                child: _buildSizesContent(),
                height: 100,
              ),
              _buildFilterHeader("Category"),
              _buildFilterContent(
                child: _buildCategoryContent(),
                height: 160,
              ),
              _buildFilterHeaderAndButton(
                text: "Brand",
                textDetail: "adidas Originals, Jack & Jones, s.Oliver",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRangeSlider() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 13.0,
            bottom: 13.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "\$${_selectedRange.start.toInt()}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                "\$${_selectedRange.end.toInt()}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        RangeSlider(
          activeColor: Color(0xFFDB3022),
          inactiveColor: Color(0xFF9B9B9B),
          values: _selectedRange,
          min: 0,
          max: 220,
          onChanged: (RangeValues newRange) {
            setState(() {
              _selectedRange = newRange;
            });
          },
        ),
      ],
    );
  }

  Widget _buildColorsContent() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildColorsButton(
            Colors.black,
            true,
          ),
          _buildColorsButton(
            Color(0xFFF6F6F6),
            false,
          ),
          _buildColorsButton(
            Color(0xFFB82222),
            false,
          ),
          _buildColorsButton(
            Color(0xFFBEA9A9),
            false,
          ),
          _buildColorsButton(
            Color(0xFFE2BB8D),
            true,
          ),
          _buildColorsButton(
            Color(0xFF151867),
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildColorsButton(Color color, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 13.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: selected ? Color(0xFFDB3022) : Colors.transparent,
              ),
            ),
          ),
          Positioned(
            left: 5,
            top: 5,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizesContent() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildSizesButton(
            selected: false,
            text: "XS",
          ),
          _buildSizesButton(
            selected: true,
            text: "S",
          ),
          _buildSizesButton(
            selected: true,
            text: "M",
          ),
          _buildSizesButton(
            selected: false,
            text: "L",
          ),
          _buildSizesButton(
            selected: false,
            text: "XL",
          ),
        ],
      ),
    );
  }

  Widget _buildSizesButton({
    String text,
    bool selected,
  }) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.only(right: 13.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: selected ? Color(0xFFDB3022) : Colors.grey.withOpacity(0.4),
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
          ),
        ),
        color: selected ? Color(0xFFDB3022) : Colors.white,
        onPressed: () {},
      ),
    );
  }

  Widget _buildFilterContent({Widget child, double height}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 1.0,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildFilterHeaderAndButton({String text, String textDetail}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  textDetail,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryContent() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildCategoryButton(text: "All", selected: true),
                  _buildCategoryButton(text: "Women", selected: false),
                  _buildCategoryButton(text: "Men", selected: false),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildCategoryButton(text: "Boys", selected: false),
                  _buildCategoryButton(text: "Girls", selected: false),
                  Container(width: 110),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton({String text, bool selected}) {
    return Container(
      height: 50,
      width: 110,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: selected ? Color(0xFFDB3022) : Colors.grey.withOpacity(0.4),
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
        color: selected ? Color(0xFFDB3022) : Colors.white,
        onPressed: () {},
      ),
    );
  }

  Widget _buildFilterHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0.0, 1.0),
            blurRadius: 1.0,
            spreadRadius: 1,
          ),
        ],
      ),
      height: 75,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Discard",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 30),
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Color(0xFFDB3022)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Apply",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  color: Color(0xFFDB3022),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
