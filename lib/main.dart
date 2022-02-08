import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

void main() {
  runApp(MyApp());
}

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar({required this.color, required this.tabBar});

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        color: color,
        child: tabBar,
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vertical Scrollable TabView Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Vertical Scrollable TabView Plugin'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Category> data = ExampleData.data;

  // TabController More Information => https://api.flutter.dev/flutter/material/TabController-class.html
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: data.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          //backgroundColor: Colors.white,
          body: Stack(
            children: [
              VerticalScrollableTabView(
                tabController: tabController,
                listItemData: data,
                verticalScrollPosition: VerticalScrollPosition.middle,
                eachItemChild: (object, index) =>
                    CategorySection(category: object as Category),
                slivers: [
                  SliverAppBar(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent),
                    stretch: true,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white54),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    pinned: true,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white54),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                              ),
                            )),
                      )
                    ],
                    expandedHeight: MediaQuery.of(context).size.height * .5,
                    flexibleSpace: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      var top = constraints.biggest.height;
                      return FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          centerTitle: true,
                          titlePadding: EdgeInsets.only(bottom: 66),
                          title: AnimatedOpacity(
                              curve: Curves.easeInCubic,
                              duration: Duration(milliseconds: 300),
                              opacity: top > 130 && top < 140 ? 1.0 : 0.0,
                              //opacity: .0,
                              child: Text(
                                "مطعم الصباحي",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                          background: Container(
                            height: MediaQuery.of(context).size.height * .3,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.network(
                                    "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVzdGF1cmFudCUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80",
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 50),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    //color: Colors.blue,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            //color: Colors.yellow,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'مطعم الصباحي',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 25),
                                                  ),
                                                  Text(
                                                    'مشويات , مأكولات بحرية , بيتزا',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 17),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            //color: Colors.green,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('معلومات المطعم'),
                                                    Text('25 دقيقة للتوصيل'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ));
                    }),
                    bottom: ColoredTabBar(
                      color: Colors.white,
                      tabBar: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        padding: EdgeInsets.all(2.0),
                        physics: BouncingScrollPhysics(),
                        isScrollable: true,
                        indicator: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(20)),
                        controller: tabController,
                        indicatorPadding: const EdgeInsets.all(4),
                        indicatorColor: Colors.deepOrange,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey,
                        indicatorWeight: 3.0,
                        tabs: data.map((e) {
                          return Tab(text: e.title);
                        }).toList(),
                        onTap: (index) {
                          VerticalScrollableTabBarStatus.setIndex(index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.deepOrange,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ExampleData {
  ExampleData._internal();

  static List<String> images = [
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
  ];

  static List<Category> data = [
    category1,
    category2,
    category3,
    category4,
    category3,
    category2,
    category3,
    category2,
    category4,
  ];

  static Category category1 = Category(
    title: "الأكثر طلبا",
    subtitle: "الطلبات الاكثر طلبا ",
    isHotSale: false,
    foods: List.generate(
      5,
      (index) {
        return Food(
          name: " مشكل مشويات  $index",
          price: "200",
          comparePrice: "\$198",
          imageUrl: images[index % images.length],
          isHotSale: false,
        );
      },
    ),
  );

  static Category category2 = Category(
    title: "الحـلـويات",
    subtitle: "أحلي حلويات شرقية",
    isHotSale: false,
    foods: List.generate(
      3,
      (index) {
        return Food(
          name: "بسبوسة بالنوتيلا",
          price: "230",
          comparePrice: "\$250",
          imageUrl: images[index % images.length],
          isHotSale: false,
        );
      },
    ),
  );

  static Category category3 = Category(
    title: "سناكس",
    subtitle: null,
    isHotSale: false,
    foods: List.generate(
      1,
      (index) {
        return Food(
          name: "منوعات",
          price: "258",
          comparePrice: "\$289",
          imageUrl: images[index % images.length],
          isHotSale: false,
        );
      },
    ),
  );

  static Category category4 = Category(
    title: "المشروبات",
    subtitle: "عصاير طبيعية",
    isHotSale: false,
    foods: List.generate(
      5,
      (index) {
        return Food(
          name: "728. 連庭素食鍋",
          price: "240",
          comparePrice: "\$300",
          imageUrl: images[index % images.length],
          isHotSale: index == 3 ? true : false,
        );
      },
    ),
  );
}

class Category {
  String title;
  String? subtitle;
  List<Food> foods;
  bool isHotSale;

  Category({
    required this.title,
    required this.subtitle,
    required this.foods,
    required this.isHotSale,
  });
}

class Food {
  String name;
  String price;
  String comparePrice;
  String imageUrl;
  bool isHotSale;

  Food({
    required this.name,
    required this.price,
    required this.comparePrice,
    required this.imageUrl,
    required this.isHotSale,
  });
}

class CategorySection extends StatelessWidget {
  const CategorySection({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFoodTileList(context),
        ],
      ),
    );
  }

  Widget _buildFoodTileList(BuildContext context) {
    return Column(
      children: List.generate(
        category.foods.length,
        (index) {
          final food = category.foods[index];
          bool isLastIndex = index == category.foods.length - 1;
          return _buildFoodTile(
            food: food,
            context: context,
            isLastIndex: isLastIndex,
          );
        },
      ),
    );
  }

  Widget _buildFoodTile({
    required BuildContext context,
    required bool isLastIndex,
    required Food food,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildFoodImage(
                'https://goldencorner.com.sa/uploads/product/16066681941801426.png',
                context),
            _buildFoodDetail(food: food, context: context),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.deepOrange,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Icon(
                    Icons.favorite_outline,
                    color: Colors.deepOrange,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Icon(
                    Icons.share,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ],
        ),
        !isLastIndex ? const Divider(height: 16.0) : const SizedBox(height: 8.0)
      ],
    );
  }

  Widget _buildFoodImage(String url, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/logo.png',
        image: url,
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width * .4,
        height: 100,
      ),
    );
  }

  Widget _buildFoodDetail({
    required BuildContext context,
    required Food food,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * .45,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('بيتزا رانش دجاج',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
            Container(
                child: Text(
              'المكوّنات · مقادير العجينة: · دقيق. كوبان · خميرة. ملعقة صغيرة · ملح. رشة · حليب بودرة. ملعقتان كبيرتان · زيت نباتي. ربع كوب · ماء ',
              overflow: TextOverflow.fade,
              maxLines: 3,
              style: TextStyle(fontSize: 10, color: Colors.grey),
            )),
            Text('25 ر.س', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodHotSaleIcon() {
    return Container(
      child: Icon(Icons.whatshot, color: Colors.pink, size: 16.0),
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.pink.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  TextTheme _textTheme(context) => Theme.of(context).textTheme;
}
