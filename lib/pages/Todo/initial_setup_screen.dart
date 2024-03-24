import 'package:app/components/todo/ButtonLogin.dart';
import 'package:app/pages/Todo/Onboarding.dart';
import 'package:flutter/material.dart';

final List<String> suggestionsTasks = <String>[
  "☀️ Plan tasks",
  "🎯 Set goals",
  "🚶‍♂️ Take breaks",
  "💪 Move and refresh",
  "📝 Prioritize",
  "🔍 Break tasks down",
  "🚫 No multitasking",
  "📵 Minimize distractions",
  "⏰ Limit social media"
];

class InitialSetUpScreen extends StatelessWidget {
  const InitialSetUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Colors.black,
              )),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(
            children: [
              const Initialinfo(),
              const SuggestionsTask(),
              Button(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const OnBoarding()));
                },
                title: 'I AGREE',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Initialinfo extends StatelessWidget {
  const Initialinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Text(
        'Let’s make a contract',
        style: TextStyle(
            fontFamily: 'poppinsextrabold', color: Colors.black, fontSize: 25),
      ),
    );
  }
}

class SuggestionsTask extends StatelessWidget {
  const SuggestionsTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 80),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'I will',
          style: TextStyle(fontFamily: 'poppinsbold', fontSize: 15),
        ),
        SizedBox(
          width: double.infinity,
          height: 400,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: suggestionsTasks.length,
            itemBuilder: (BuildContext context, int index) {
              final task = suggestionsTasks[index];
              return ItemSuggestionTask(
                task: task,
              );
            },
          ),
        )
      ]),
    );
  }
}

class ItemSuggestionTask extends StatelessWidget {
  const ItemSuggestionTask({super.key, this.task});
  final task;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task),
      leading: Container(
        height: 8,
        width: 8,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(29)),
      ),
    );
  }
}
