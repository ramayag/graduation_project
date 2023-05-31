import 'package:gui/core/utils/app_assets.dart';
import 'package:gui/core/utils/color_manager.dart';
import 'package:gui/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        // body: BaseView<SettingsViewModel>(
        //   vmBuilder: (context) => SettingsViewModel(context: context),
        //   builder: _buildScreen,
        // ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: ColorsManager.darkTeal,
                backgroundImage: AssetImage(AppAssets.profileImage),
              ),
              Constants.verticalSpaceMedium(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Text(
                  "Name",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
              ),
              Card(
                elevation: 1,
                color: ColorsManager.darkTeal.withOpacity(0.2),
                shape: Constants.kRoundedRectangle,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                  child: Text(
                    "Alaa Shouk",
                    style: Theme.of(context).primaryTextTheme.labelMedium,
                  ),
                ),
              ),
              Constants.verticalSpaceSmall(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Text(
                  "Email",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Card(
                elevation: 1,
                color: ColorsManager.darkTeal.withOpacity(0.2),
                shape: Constants.kRoundedRectangle,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                  child: Text(
                    "AlaaShouk@gmail.com",
                    style: Theme.of(context).primaryTextTheme.labelMedium,
                  ),
                ),
              ),
              Constants.verticalSpaceSmall(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Text(
                  "Password",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Card(
                elevation: 1,
                color: ColorsManager.darkTeal.withOpacity(0.2),
                shape: Constants.kRoundedRectangle,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                  child: Text(
                    "********",
                    style: Theme.of(context).primaryTextTheme.labelMedium,
                  ),
                ),
              ),
              Constants.verticalSpaceSmall(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Text(
                  "Mobile",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Card(
                elevation: 1,
                color: ColorsManager.darkTeal.withOpacity(0.2),
                shape: Constants.kRoundedRectangle,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                  child: Text(
                    "0987654321",
                    style: Theme.of(context).primaryTextTheme.labelMedium,
                  ),
                ),
              ),
              Constants.verticalSpaceLarge(),
              Align(
                alignment: Alignment.bottomRight,
                child: Text.rich(
                  TextSpan(
                    text: 'Joined ',
                    children: const <InlineSpan>[
                      TextSpan(
                          text: '23 May 2023',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
