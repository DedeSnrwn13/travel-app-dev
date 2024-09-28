import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 30),
        header(),
        const SizedBox(height: 20),
        search(),
        const SizedBox(height: 24),
        categories(),
        const SizedBox(height: 20),
        topDestination(),
        const SizedBox(height: 30),
        allDestination(),
      ],
    );
  }

  Padding header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
            ),
            padding: const EdgeInsets.all(2),
            child: const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Hi, Dre!',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const Spacer(),
          const Badge(
            backgroundColor: Colors.red,
            alignment: Alignment(0.6, -0.6),
            child: Icon(
              Icons.notifications_none,
            ),
          )
        ],
      ),
    );
  }

  search() {
    return const SizedBox();
  }

  categories() {
    return const SizedBox();
  }

  topDestination() {
    return const SizedBox();
  }

  allDestination() {
    return const SizedBox();
  }
}
