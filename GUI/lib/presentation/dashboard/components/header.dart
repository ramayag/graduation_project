import 'package:gui/core/utils/color_manager.dart';
import 'package:gui/core/utils/constants.dart';
import 'package:gui/core/utils/responsive.dart';
import 'package:gui/presentation/dashboard/MenuAppController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context)) ...{
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: ColorsManager.darkTeal,
            ),
            onPressed: context.read<MenuAppController>().controlMenu,
          )
        },
        if (Responsive.isMobile(context)) ...{
          Text(
            "Dashboard",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: ColorsManager.darkTeal),
          )
        },
        if (Responsive.isMobile(context)) ...{
          Divider(
            thickness: 1,
            height: 1,
          )
        },
        Constants.verticalSpaceMedium()
      ],
    );
  }
}
