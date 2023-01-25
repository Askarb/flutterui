import 'package:classwork/cl_jan_17/models/car_model.dart';
import 'package:classwork/cl_jan_17/ui/theme/style.dart';
import 'package:classwork/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CarDetailWidget extends StatefulWidget {
  const CarDetailWidget({super.key});

  @override
  State<CarDetailWidget> createState() => _CarDetailWidgetState();
}

class _CarDetailWidgetState extends State<CarDetailWidget> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '555123456';

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as CarModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.carDetailBg,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColor.carDetailBg,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
            child: Stack(
              children: [
                Text(
                  'TIIRA',
                  style: AppStyle.w400s160.copyWith(
                    color: AppColor.white.withOpacity(.44),
                    height: 0.9,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    data.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      data.title,
                      style: AppStyle.w400s16,
                    ),
                    const Spacer(),
                    Text(
                      '\$${data.price}.00',
                      style: AppStyle.w700s12.copyWith(color: AppColor.red),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CharacteristicWidget(
                        title: 'Transition', value: data.transmission),
                    CharacteristicWidget(
                        title: 'Speed', value: ' ${data.speed}kmph'),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'RENDER',
                    style: AppStyle.w400s12.copyWith(color: AppColor.antr),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(AppImages.person),
                    const SizedBox(width: 15),
                    Text(
                      data.owner,
                      style: AppStyle.w400s13.copyWith(color: AppColor.antr),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(AppImages.iconMessage),
                    ),
                    IconButton(
                      onPressed: () {
                        if (_hasCallSupport) {
                          setState(() {
                            _launched = _makePhoneCall(_phone);
                          });
                        } else {
                          print('Phone call not supported');
                          setState(() {
                            _launched = _makePhoneCall(_phone);
                          });
                        }
                      },
                      icon: Image.asset(AppImages.iconPhone),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    IncDecButtonWidget(
                      icon: AppImages.plus,
                      onPressed: () {
                        print('Pressed +');
                      },
                    ),
                    const SizedBox(width: 9),
                    const Text(
                      '1',
                      style: AppStyle.w700s20,
                    ),
                    const SizedBox(width: 9),
                    IncDecButtonWidget(
                      icon: AppImages.minus,
                      onPressed: () {
                        print('Pressed -');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IncDecButtonWidget extends StatelessWidget {
  final String icon;
  final Function() onPressed;
  const IncDecButtonWidget({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 43,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: AppColor.carDetailBg),
        ),
        child: ImageIcon(
          AssetImage(icon),
          color: AppColor.carDetailBg,
        ),
      ),
    );
  }
}

class CharacteristicWidget extends StatelessWidget {
  final String title, value;
  const CharacteristicWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      height: 89,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 9),
        decoration: BoxDecoration(
            color: AppColor.gray,
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            boxShadow: [
              BoxShadow(
                  color: AppColor.black.withOpacity(.25),
                  offset: Offset.fromDirection(1, 4),
                  blurRadius: 4)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppStyle.w700s12.copyWith(color: AppColor.carDetailBg),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: AppStyle.w400s12,
            ),
          ],
        ),
      ),
    );
  }
}
