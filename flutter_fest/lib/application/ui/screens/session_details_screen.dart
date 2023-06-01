import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/themes/app_colors.dart';
import 'package:flutter_fest/application/ui/themes/app_text_style.dart';
import 'package:flutter_fest/application/ui/themes/app_themes.dart';
import 'package:flutter_fest/resources/resources.dart';

class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: const _AddToFavoriteWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxScreenWidth),
          child: Stack(
            
            children: [
              ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.zero,
              children: const [
                _HeaderWidget(),
                _SessionTitleWidget(),
                _SessionDescriptionWidget(),
                _ScheduleInfoWidget(),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddToFavoriteConfiguration {
  final String text;
  final Icon icon;
  final Color iconColor;
  final Color? backgroundColor;
  final LinearGradient? backgroundGradient;

  static const favorite = _AddToFavoriteConfiguration(
    text: "B программе",
    icon: Icon(Icons.favorite),
    iconColor: AppColor.green,
    backgroundColor: AppColor.darkSecondary,
    backgroundGradient: null,
  );

  static const disFavorite = _AddToFavoriteConfiguration(
    text: "B мою программу",
    icon: Icon(Icons.favorite_border_rounded),
    iconColor: AppColor.white88,
    backgroundColor: null,
    backgroundGradient: LinearGradient(
      colors: <Color>[
        AppColor.green,
        AppColor.blue,
      ],
    ),
  );

  const _AddToFavoriteConfiguration({
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.backgroundGradient,
  });
}

class _AddToFavoriteWidget extends StatelessWidget {
  final isFavorite = false;
  const _AddToFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final text = isFavorite ? "B программе" : "B мою программу";
    final icon = isFavorite
        ? const Icon(Icons.favorite)
        : const Icon(Icons.favorite_border_rounded);
    final iconColor = isFavorite ? AppColor.green : AppColor.white88;
    final configuration = isFavorite
        ? _AddToFavoriteConfiguration.favorite
        : _AddToFavoriteConfiguration.disFavorite;
    return SizedBox(
      height: 48,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxScreenWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                elevation: MaterialStateProperty.all(0),
                minimumSize: MaterialStateProperty.all(Size.zero),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: configuration.backgroundGradient,
                  color: configuration.backgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      configuration.icon,
                      const SizedBox(
                        width: 16,
                      ),
                      Text(configuration.text),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Image.asset(
            AppImages.image,
            fit: BoxFit.fill,
          ),
        ),
        const _SpeakerInfoWidget(),
      ],
    );
  }
}

class _SpeakerInfoWidget extends StatelessWidget {
  const _SpeakerInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 312,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 124),
                Flexible(
                  flex: 56,
                  child: Text(
                    'Алексей\nЧyлпин',
                    style: AppTextStyle.speakerName.copyWith(
                      color: AppColor.white88,
                    ),
                  ),
                ),
                const Spacer(flex: 24),
                Flexible(
                  flex: 40,
                  child: Text(
                    'Ведущий\npaзpaбoтчик MTC',
                    style: AppTextStyle.bookTextItalic.copyWith(
                      color: AppColor.white88,
                    ),
                  ),
                ),
                const Spacer(flex: 68),
              ],
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomRight,
              child: FractionallySizedBox(
                widthFactor: 208 / 375,
                child: Image.asset(
                  AppImages.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SessionTitleWidget extends StatelessWidget {
  const _SessionTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 32,
        right: 32,
      ),
      child: Text(
        'Субьективность в оценке дизайна',
        style: AppTextStyle.steinbeckText.copyWith(
          color: AppColor.white88,
        ),
      ),
    );
  }
}

class _SessionDescriptionWidget extends StatelessWidget {
  const _SessionDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 16,
        right: 32,
      ),
      child: Text(
        'Teкcт описание краткой лекции. Что будет, раскрытие темы. Думаю, что на три или четыре строки. текста нет, так что пишу, что думаю бла бла бла...',
        style: AppTextStyle.bookText.copyWith(
          color: AppColor.white88,
        ),
      ),
    );
  }
}

class _ScheduleInfoWidget extends StatelessWidget {
  const _ScheduleInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 24, right: 20),
      child: Row(
        children: const [
          _ScheduleInfoElementWidget(
            label: "Старт",
            text: "8:00",
          ),
          SizedBox(width: 16),
          _ScheduleInfoElementWidget(
            label: "Секция",
            text: "#1",
          ),
        ],
      ),
    );
  }
}

class _ScheduleInfoElementWidget extends StatelessWidget {
  final String label;
  final String text;

  const _ScheduleInfoElementWidget({
    super.key,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 60,
      decoration: const BoxDecoration(
        color: AppColor.darkSecondary,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: GradientBorder(
        borderWidth: 2,
        radius: 16,
        gradient: const RadialGradient(
          center: Alignment(0.3, -1.3),
          colors: [
            Color(0xFF50AF64),
            Color(0xFF3D734D),
            Color(0xFF3D734D),
            Color(0xFF206D82),
          ],
          stops: [
            0.35,
            0,
            59,
            0.74,
            0.91,
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12,
            top: 10,
            right: 20,
            bottom: 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyle.snackText.copyWith(
                  color: AppColor.darkText,
                ),
              ),
              Text(
                text,
                style: AppTextStyle.timeText.copyWith(
                  color: AppColor.white88,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientBorder extends StatelessWidget {
  final double borderWidth;
  final double radius;
  final Gradient gradient;
  final Widget child;

  const GradientBorder({
    Key? key,
    required this.borderWidth,
    required this.radius,
    required this.gradient,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GradientPainter(
        borderWidth: borderWidth,
        radius: radius,
        gradient: gradient,
      ),
      child: child,
    );
  }
}

class _GradientPainter extends CustomPainter {
  final double borderWidth;
  final double radius;
  final Gradient gradient;

  _GradientPainter({
    required this.borderWidth,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect outerRect = Offset.zero & size;
    var outerRRect = RRect.fromRectAndRadius(
      outerRect,
      Radius.circular(radius),
    );

    final innerRect = Rect.fromLTWH(borderWidth, borderWidth,
        size.width - borderWidth * 2, size.height - borderWidth * 2);
    final innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - borderWidth));

    final paint = Paint()..shader = gradient.createShader(outerRect);

    final outerPath = Path()..addRRect(outerRRect);
    final innerPath = Path()..addRRect(innerRRect);
    final path = Path.combine(PathOperation.difference, outerPath, innerPath);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
