import 'package:classwork/cl_jan_17/models/car_model.dart';
import 'package:classwork/cl_jan_17/navigation/main_navigation.dart';
import 'package:classwork/cl_jan_17/ui/theme/style.dart';
import 'package:classwork/cl_jan_17/ui/widgets/chip.dart';
import 'package:classwork/resources/resources.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

List<CarModel> data = [
  CarModel(
    image: AppImages.car1,
    owner: 'Lorem Ipsum',
    price: '300',
    title: 'TOYOTA',
    transmission: 'Auto',
    speed: '999',
    color: AppColor.purple,
  ),
  CarModel(
    image: AppImages.lamb,
    owner: 'Lorem Ipsum',
    price: '550',
    title: 'LAMBORGHINI',
    transmission: 'Auto',
    speed: '123',
    color: AppColor.lambBg,
  ),
  CarModel(
    image: AppImages.car2,
    owner: 'Lorem Ipsum',
    price: '150',
    title: 'RANGE ROVER',
    transmission: 'Auto',
    speed: '999',
    color: AppColor.car2bg,
  ),
  CarModel(
    image: AppImages.car3,
    owner: 'Lorem Ipsum',
    price: '150',
    title: 'TESLA',
    transmission: 'Auto',
    speed: '999',
    color: AppColor.car3bg,
  ),
];

class _MainScreenState extends State<MainScreen> {
  int selectedChip = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: Column(
          children: [
            IconButton(
              onPressed: () {
                print("Pressed");
              },
              icon: Image.asset(AppImages.drawerIcon),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: AppColor.antr,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: AppColor.white),
            padding: const EdgeInsets.all(17),
            child: Column(
              children: [
                Image.asset(AppImages.frame),
                Wrap(
                  spacing: 5,
                  runSpacing: 0,
                  children: [
                    MyChip(
                        label: "family cars",
                        isSelected: selectedChip == 1,
                        onPressed: () {
                          setState(() {
                            selectedChip = 1;
                          });
                        }),
                    MyChip(
                        label: "Cheap cars",
                        isSelected: selectedChip == 2,
                        onPressed: () {
                          setState(() {
                            selectedChip = 2;
                          });
                        }),
                    MyChip(
                        label: "Luxuly cars",
                        isSelected: selectedChip == 3,
                        onPressed: () {
                          setState(() {
                            selectedChip = 3;
                          });
                        }),
                    IconButton(
                      onPressed: () {
                        print('SearchPressed');
                      },
                      icon: Image.asset(AppImages.searchIcon),
                    )
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Cars Available Near You',
                    style: AppStyle.w400s20.copyWith(color: AppColor.black),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        print('pressed ViewMore');
                      },
                      child: Text(
                        'View more',
                        textAlign: TextAlign.end,
                        style: AppStyle.w400s12.copyWith(color: AppColor.red),
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) => GridItem(
                model: data[index].title,
                price: data[index].price,
                imagePath: data[index].image,
                bgColor: data[index].color,
                OnTap: () {
                  Navigator.pushNamed(
                    context,
                    MainNavigationRouteNames.detail,
                    arguments: data[index],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String model, price, imagePath;
  final Color bgColor;
  final Function() OnTap;
  const GridItem({
    Key? key,
    required this.model,
    required this.price,
    required this.imagePath,
    required this.bgColor,
    required this.OnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: OnTap,
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
              Text(
                model,
                style: const TextStyle(color: AppColor.antr),
              ),
              RichText(
                text: TextSpan(
                  text: '\$$price',
                  style: DefaultTextStyle.of(context).style,
                  children: const <TextSpan>[
                    TextSpan(
                      text: '/day',
                      style: TextStyle(fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 20,
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Image.asset(AppImages.heart),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 20,
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Image.asset(AppImages.arrow),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
