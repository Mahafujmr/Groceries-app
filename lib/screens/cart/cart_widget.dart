import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_ui/widgets/heart_btn.dart';
import 'package:grocery_ui/widgets/text_widget.dart';

import '../../services/utils.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: size.width * 0.25,
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: FancyShimmerImage(
                          imageUrl:
                              'https://img.freepik.com/free-vector/full-peach-half-peach_1308-117219.jpg?w=740&t=st=1728122620~exp=1728123220~hmac=68f8ee2fa1fbe747e1d0d379f214834d3135be2580205d54ab71e00a5bc7fa38',
                          height: size.width * 0.21,
                          width: size.width * 0.2,
                          boxFit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'title',
                            color: color,
                            textSize: 20,
                            isTitle: true,
                          ),
                          const SizedBox(
                            height: 10.6,
                          ),
                          SizedBox(
                            width: size.width * 0.3,
                            child: Row(
                              children: [
                                _quantityController(
                                  fct: () {},
                                  color: Colors.red,
                                  icon: CupertinoIcons.minus,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: TextField(
                                    controller: _quantityTextController,
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'),
                                      ),
                                    ],
                                    onChanged: (v) {
                                      setState(() {
                                        if (v.isEmpty) {
                                          _quantityTextController.text = ('1');
                                        } else {
                                          return;
                                        }
                                      });
                                    },
                                  ),
                                ),
                                _quantityController(
                                  fct: () {},
                                  color: Colors.green,
                                  icon: CupertinoIcons.plus,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                CupertinoIcons.cart_badge_plus,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const HeartBTN(),
                            TextWidget(
                              text: '\$0.33',
                              color: color,
                              textSize: 18,
                              maxLines: 1,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _quantityController({
    required Function fct,
    required IconData icon,
    required Color color,
  }) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct();
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
