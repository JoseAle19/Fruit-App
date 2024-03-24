import 'package:app/components/todo/ButtonOptions.dart';
import 'package:app/components/todo/CategoryWidget.dart';
import 'package:app/pages/Todo/HeadTask.dart';
import 'package:app/providers/todo/PagesTaskProvider.dart';
import 'package:app/providers/todo/categoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  PagesTaskProvider? _pagesTaskProvider;

  @override
  void initState() {
    _pagesTaskProvider = Provider.of<PagesTaskProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _pagesTaskProvider!.resetSelected();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pagesTaskProvider = Provider.of<PagesTaskProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const HeadTask(),
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ButtonOptions(),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                child: PageView.builder(
                  itemCount: categoryProvider.categories.length,
                  controller: pagesTaskProvider.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => CategoryWidget(
                      categoryName: categoryProvider.categories[index].name),
                ),
              ),
            )
          ],
        ));
  }
}

class AllTask extends StatelessWidget {
  const AllTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("All Task"),
      ),
    );
  }
}

class DaiLyRoutine extends StatelessWidget {
  const DaiLyRoutine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Daily Routine"),
      ),
    );
  }
}

class StudyRoutine extends StatelessWidget {
  const StudyRoutine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
