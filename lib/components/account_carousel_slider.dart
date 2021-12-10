import 'package:bankapp/components/account_card.dart';
import 'package:bankapp/domain/models/account_model.dart';
import 'package:bankapp/mobx/helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AccountCarouselSlider extends StatelessWidget {
  const AccountCarouselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height * 0.20;

    return Observer(
      builder: (_) {
        if (Store.global.userAccounts.isEmpty) {
          return SizedBox(
            height: _height,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            ),
          );
        }

        if (Store.global.userAccounts.length == 1) {
          return Center(
            child: AccountCard(account: Store.global.userAccounts.first),
          );
        }

        return CarouselSlider.builder(
          itemCount: Store.global.userAccounts.length,
          options: CarouselOptions(height: _height),
          itemBuilder: (BuildContext context, int index, int pageViewIndex) {
            Account _account = Store.global.userAccounts[index];
            return AccountCard(account: _account);
          },
        );
      },
    );
  }
}
