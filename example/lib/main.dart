import 'package:flutter/material.dart';
import 'package:simple_page_transition/simple_page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Type Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPage createState() => _FirstPage();
}

class CurveItem {
  final String name;
  final Curve curve;

  CurveItem({required this.name, required this.curve});
}

class _FirstPage extends State<FirstPage> {
  late CurveItem selectedItem;
  final List<CurveItem> curves = [
    CurveItem(name: 'Linear', curve: Curves.linear),
    CurveItem(name: 'Ease', curve: Curves.ease),
    CurveItem(name: 'EaseIn', curve: Curves.easeIn),
    CurveItem(name: 'EaseOut', curve: Curves.easeOut),
    CurveItem(name: 'EaseInOut', curve: Curves.easeInOut),
    CurveItem(name: 'EaseInCirc', curve: Curves.easeInCirc),
    CurveItem(name: 'EaseOutCirc', curve: Curves.easeOutCirc),
    CurveItem(name: 'EaseInOutCirc', curve: Curves.easeInOutCirc),
    CurveItem(name: 'EaseInBack', curve: Curves.easeInBack),
    CurveItem(name: 'EaseOutBack', curve: Curves.easeOutBack),
    CurveItem(name: 'EaseInOutBack', curve: Curves.easeInOutBack),
    CurveItem(name: 'EaseInQuart', curve: Curves.easeInQuart),
    CurveItem(name: 'EaseOutQuart', curve: Curves.easeOutQuart),
    CurveItem(name: 'EaseInOutQuart', curve: Curves.easeInOutQuart),
    CurveItem(name: 'EaseInQuint', curve: Curves.easeInQuint),
    CurveItem(name: 'EaseOutQuint', curve: Curves.easeOutQuint),
    CurveItem(name: 'EaseInOutQuint', curve: Curves.easeInOutQuint),

  ];

  @override
  void initState() {
    super.initState();
    selectedItem = curves[curves.length - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: DropdownMenu<CurveItem>(
              trailingIcon: const Icon(Icons.arrow_drop_down, color: Colors.white,),
              initialSelection: selectedItem,
              requestFocusOnTap: true,
              textStyle: const TextStyle(color: Colors.white),
              label: const Text('Curves', style: TextStyle(color: Colors.white)),
              onSelected: (CurveItem? newValue) {
                setState(() {
                  selectedItem = newValue!;
                });
              },
              dropdownMenuEntries: curves.map<DropdownMenuEntry<CurveItem>>((CurveItem item) {
                return DropdownMenuEntry<CurveItem>(
                  value: item,
                  label: item.name,
                  style: MenuItemButton.styleFrom(
                    foregroundColor: Colors.black, //text color
                    backgroundColor: Colors.white, //unselected background color,
                  ),
                );
              }).toList(),
              inputDecorationTheme: const InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                Fade(
                    page: ResultPage(
                      pageName: "Fade",
                    ),
                    animationDuration: const Duration(seconds: 2),
                    curve: selectedItem.curve),
              );
            },
            child: Text('Fade'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                SlideLeftRight(
                    page: ResultPage(
                      pageName: "Slide left to right",
                    ),
                    animationDuration: const Duration(milliseconds: 1100),
                    curve: selectedItem.curve),
              );
            },
            child: Text('Slide left to right'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                SlideRightLeft(
                    page: ResultPage(
                      pageName: "Slide right to left",
                    ),
                    animationDuration: const Duration(milliseconds: 1100),
                    curve: selectedItem.curve),
              );
            },
            child: Text('Slide right to left'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                SlideTopBottom(
                    page: ResultPage(
                      pageName: "Slide top to bottom",
                    ),
                    animationDuration: const Duration(milliseconds: 1100),
                    curve: selectedItem.curve),
              );
            },
            child: Text('Slide top to bottom'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                SlideBottomTop(
                    page: ResultPage(
                      pageName: "Slide bottom to top",
                    ),
                    animationDuration: const Duration(milliseconds: 1100),
                    curve: selectedItem.curve),
              );
            },
            child: Text('Slide bottom to top'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                Scale(
                    page: ResultPage(
                      pageName: "Scale",
                    ),
                    alignment: Alignment.bottomCenter,
                    animationDuration: const Duration(milliseconds: 1100),
                    curve: selectedItem.curve),
              );
            },
            child: Text('Scale'),
          ),
        ],
      )),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String pageName;

  ResultPage({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Back to First Page'),
        ),
      ),
    );
  }
}
