import 'package:flutter/material.dart';

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

  Container search() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.only(left: 24),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: 'Search destination here...',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: EdgeInsets.all(0),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton.filledTonal(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 24,
            ),
          )
        ],
      ),
    );
  }

  SingleChildScrollView categories() {
    List list = [
      'Beach',
      'Lake',
      'Mountain',
      'Forest',
      'City',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          list.length,
          (index) {
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 30 : 10,
                right: index == list.length - 1 ? 30 : 10,
                bottom: 10,
                top: 4,
              ),
              child: Material(
                color: Colors.white,
                elevation: 4,
                shadowColor: Colors.grey[300],
                borderRadius: BorderRadius.circular(30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 16,
                  ),
                  child: Text(
                    list[index],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  topDestination() {
    return const SizedBox();
  }

  allDestination() {
    return const SizedBox();
  }
}
