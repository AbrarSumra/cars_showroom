import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CstmCar extends StatefulWidget {
  const CstmCar({
    super.key,
    required this.carName,
    required this.price,
    required this.engine,
    required this.mileage,
    required this.capacity,
    required this.bhp,
    required this.fuelType,
    required this.carImage,
  });

  final String carName;
  final String price;
  final String engine;
  final String mileage;
  final String capacity;
  final String bhp;
  final String fuelType;
  final List<String> carImage;

  @override
  State<CstmCar> createState() => _CstmCarState();
}

class _CstmCarState extends State<CstmCar> {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            SizedBox(
              height: 900,
              child: Image.asset(
                "assets/images/engine_logo_png/background.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        CupertinoIcons.back,
                        size: 35,
                      ),
                    ),
                    Text(
                      widget.carName,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    initialPage: _currentIndex,
                    enableInfiniteScroll: true,
                  ),
                  items: widget.carImage.map((photo) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 200,
                        width: 350,
                        child: Image.asset(
                          photo,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.left_chevron),
                      Text(
                        "Swipe left",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Swipe Right",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(CupertinoIcons.right_chevron),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade400,
                        ),
                        child: Center(
                          child: Text(
                            widget.carName,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.indigoAccent,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.price,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "Avg.Ex-Showroom price",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 25,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    "Buy",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 100,
                                height: 25,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    "Sell",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade400,
                        ),
                        child: const Center(
                          child: Text(
                            "Key Specifications",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.indigoAccent,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      cstmText(
                        engine: widget.engine,
                        mileage: widget.mileage,
                        bhp: widget.bhp,
                        fuel: widget.fuelType,
                        capacity: widget.capacity,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cstmText({
    String engine = "",
    String mileage = " ",
    String bhp = "",
    String fuel = "",
    String capacity = "",
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/engine_logo_png/engine.png",
                    color: Colors.orange,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Engine",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    engine,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 70),
            Expanded(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/engine_logo_png/speedometer.png",
                    color: Colors.orange,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Mileage",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    mileage,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 70),
            Expanded(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/engine_logo_png/seat.png",
                    color: Colors.orange,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Seats",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    capacity,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/engine_logo_png/flash.png",
                    color: Colors.orange,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "BHP",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    bhp,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/engine_logo_png/gasoline-pump.png",
                    color: Colors.orange,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Fuel",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    fuel,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
