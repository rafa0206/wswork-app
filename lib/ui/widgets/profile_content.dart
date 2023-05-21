import 'package:flutter/material.dart';

import 'carsapp_theme_data.dart';

//ignore: must_be_immutable
class ProfileContent extends StatelessWidget {
  String userName;
  String userEmail;
  String userPhone;

  ProfileContent({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 72, bottom: 55),
              child: Icon(
                (Icons.account_circle),
                color: CarsAppTheme.mainDarkGrey,
                size: 75,
              ),
            ),
            Text(
              userName,
              style: const TextStyle(
                  color: CarsAppTheme.mainBlue,
                  fontFamily: 'SF-Mono',
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 30),
        const Divider(
          color: CarsAppTheme.mainGrey,
          thickness: 2,
        ),
        const SizedBox(height: 30),
        Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    (Icons.local_phone),
                    color: CarsAppTheme.mainBlue,
                    size: 21,
                  ),
                ),
                Text(
                  userEmail,
                  style: const TextStyle(
                      color: CarsAppTheme.mainDarkGrey,
                      fontFamily: 'SF-Mono',
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    (Icons.mail),
                    color: CarsAppTheme.mainBlue,
                    size: 21,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  userPhone,
                  style: const TextStyle(
                      color: CarsAppTheme.mainDarkGrey,
                      fontFamily: 'SF-Mono',
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
