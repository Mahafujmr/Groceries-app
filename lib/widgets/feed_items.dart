import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_ui/widgets/price_widget.dart';
import 'package:grocery_ui/widgets/text_widget.dart';

import '../services/utils.dart';
import 'heart_btn.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              FancyShimmerImage(
                imageUrl:
                    'https://img.freepik.com/free-vector/full-peach-half-peach_1308-117219.jpg?w=740&t=st=1728122620~exp=1728123220~hmac=68f8ee2fa1fbe747e1d0d379f214834d3135be2580205d54ab71e00a5bc7fa38',
                height: size.width * 0.21,
                width: size.width * 0.2,
                boxFit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'Title',
                      color: color,
                      textSize: 22,
                      isTitle: true,
                    ),
                    HeartBTN(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 4,
                      child: PriceWidget(
                        salePrice: 3.99,
                        price: 5.9,
                        textPrice: _quantityTextController.text,
                        isOnSale: true,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: FittedBox(
                              child: TextWidget(
                                text: 'KG',
                                color: color,
                                textSize: 18,
                                isTitle: true,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                              flex: 2,
                              child: TextFormField(
                                controller: _quantityTextController,
                                key: const ValueKey('10'),
                                style: TextStyle(
                                  color: color,
                                  fontSize: 18,
                                ),
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                enabled: true,
                                onChanged: (valueee) {
                                  setState(() {});
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.]'),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: TextWidget(
                    text: 'add to cart',
                    maxLines: 1,
                    color: color,
                    textSize: 20,
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).cardColor),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
