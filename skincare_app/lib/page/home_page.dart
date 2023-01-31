import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: demo_data.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                  image: demo_data[index].image,
                  title: demo_data[index].title,
                  description: demo_data[index].description,
                ),
              ),
            ),
            Row(
              children: [
                ...List.generate(
                  demo_data.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Dotindicator(isActive: index == _pageIndex),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 69, 44, 0),
                      shape: const CircleBorder(),
                    ),
                    child: Image.asset(
                      "assets/images/kotak5.png",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

class Dotindicator extends StatelessWidget {
  const Dotindicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 2 : 4,
      width: 2,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 69, 44, 0),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demo_data = [
  Onboard(
    image: "assets/images/kotak1.png",
    title: "Temukan Berbagai Informasi \nMengenai Kulit Anda",
    description:
        "Edukasi Dini Bagi Skin Berrier Yang Dapat Dilakukan Dirumah Dengan Menggunakan Bahan-Bahan Alami Disekitar Anda",
  ),
  Onboard(
    image: "assets/images/kotak2.png",
    title: "Temukan Berbagai Informasi \nMengenai Merias Diri",
    description:
        "Edukasi Dini Bagi Skin Berrier Yang Dapat Dilakukan Dirumah Dengan Menggunakan Bahan-Bahan Alami Disekitar Anda",
  ),
  Onboard(
    image: "assets/images/kotak3.png",
    title: "Temukan Berbagai Informasi \nMengenai Perawatan Facial Mask Alami",
    description:
        "Edukasi Dini Bagi Skin Berrier Yang Dapat Dilakukan Dirumah Dengan Menggunakan Bahan-Bahan Alami Disekitar Anda",
  ),
  Onboard(
    image: "assets/images/kotak4.png",
    title:
        "Temukan Berbagai Informasi \nMengenai Rekomendasi Serum Terbaik Untuk Anda",
    description:
        "Edukasi Dini Bagi Skin Berrier Yang Dapat Dilakukan Dirumah Dengan Menggunakan Bahan-Bahan Alami Disekitar Anda",
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          "assets/images/kotak1.png",
          height: 250,
        ),
        const Spacer(),
        Text(
          "Temukan Berbagai Informasi \nMengenai Kulit Anda",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        const Text(
          "Edukasi Dini Bagi Skin Berrier Yang Dapat Dilakukan Dirumah Dengan Menggunakan Bahan-Bahan Alami Disekitar Anda",
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
