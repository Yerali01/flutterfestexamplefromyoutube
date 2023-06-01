import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/themes/app_colors.dart';
import 'package:flutter_fest/application/ui/themes/app_text_style.dart';
import 'package:flutter_fest/application/ui/widgets/shedule_row/shedule_row_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          const _Header(),
          _NotificationControlWidget(),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 20,
                  right: 20,
                ),
                child: ScheduleRowWidget.single(),
              );
            }, childCount: 10),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 80, right: 20),
        child: RichText(
          text: TextSpan(
            text: "Moя\n",
            style: AppTextStyle.steinbeckText.copyWith(
              color: AppColor.white88,
              height: 44 / 36,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Программа",
                style: AppTextStyle.steinbeckHeadNormal.copyWith(
                  color: AppColor.white88,
                  height: 44 / 36,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationControlWidget extends StatelessWidget {
  const _NotificationControlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 28, right: 20),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColor.darkSecondary,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 12,
                    bottom: 12,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Напомнить мне o лекциях\nзa 10 минут до начала',
                      style: AppTextStyle.bookText.copyWith(
                        color: AppColor.white88,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  bottom: 16,
                  right: 20,
                ),
                child: Center(
                  child: CupertinoSwitch(
                    activeColor: AppColor.green,
                    trackColor: AppColor.darkText,
                    thumbColor: AppColor.darkSecondary,
                    value: true,
                    onChanged: (_) {},
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
