import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/navigation/main_navigation.dart';
import 'package:flutter_fest/application/ui/screens/session_details_screen.dart';
import 'package:flutter_fest/application/ui/widgets/shedule_row/shedule_row_session_widget.dart';
import 'package:flutter_fest/application/ui/widgets/shedule_row/shedule_row_time_widget.dart';

abstract class ScheduleRowWidget extends StatelessWidget {
  const ScheduleRowWidget({super.key});

  factory ScheduleRowWidget.single({Key? key}) =>
      _ScheduleRowSingleSessionWidget(key: key);

  factory ScheduleRowWidget.multi({Key? key}) =>
      _ScheduleRowMultiSessionWIdget(key: key);
}

class _ScheduleRowSingleSessionWidget extends ScheduleRowWidget {
  const _ScheduleRowSingleSessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const progressStatus =
        ScheduleRowWidgetConfigurationProgressStatus.oncoming;
    const configuration = ScheduleRowSessionWidgetConfiguration(
      avatarUrl:
          'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg',
      speakerName: 'Алексей чулпин',
      sessionTitle: 'Субьективность в оценке дизайна',
      isFavorite: true,
      progressStatus: progressStatus,
    );

    const ddd = ScheduleRowTimeWidgetConfiguration(
      startTime: '8:00',
      endTime: '10:30',
      progressStatus: progressStatus,
    );
    return Stack(
      children: [
        IntrinsicHeight(
          child: Row(
            children: const [
              ScheduleRowTimeWidget(
                configuration: ddd,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: ScheduleRowSessionWidget(
                  configuration: configuration,
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () =>
                  Navigator.of(context).pushNamed(Screens.sesssionDetails),
            ),
          ),
        ),
      ],
    );
  }
}

class _ScheduleRowMultiSessionWIdget extends ScheduleRowWidget {
  const _ScheduleRowMultiSessionWIdget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

enum ScheduleRowWidgetConfigurationProgressStatus { oncoming, current, past }
