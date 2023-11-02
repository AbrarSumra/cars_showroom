import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "../Constant/custom_Image.dart";
import "../Constant/icon_with_text.dart";
import "../data/car_images_data.dart";
import "cars_details.dart";
import 'package:carousel_slider/carousel_slider.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({super.key});

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  bool _isSearch = false;
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.double_arrow),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        backgroundColor: Colors.cyan,
        title: const Text("Car Showroom"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isSearch
                    ? SizedBox(
                        height: 50,
                        width: 290,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              CupertinoIcons.search,
                              color: Colors.black,
                              size: 20,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            label: Text("Search your car here..."),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.search),
            onPressed: () {
              setState(() {
                _isSearch = !_isSearch;
              });
            },
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.line_horizontal_3_decrease,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            SizedBox(
              height: 2330,
              child: Image.asset(
                "assets/images/engine_logo_png/background.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 10),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    initialPage: _currentIndex,
                    enableInfiniteScroll: true,
                  ),
                  items: allCars.map((photo) {
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CstmImage(
                      name: "Creta",
                      assetsPath: "assets/images/creta/creta5.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Hyundai Creta",
                              price: "10.87 - 19.20 Lakh",
                              engine: "1498 cc",
                              bhp: "138.12",
                              capacity: "5",
                              mileage: "16.8 kmpl",
                              fuelType: "Petrol/Diesel",
                              carImage: cretaImages,
                            ),
                          ),
                        );
                      },
                    ),
                    CstmImage(
                      name: "Swift",
                      assetsPath:
                          "assets/images/swift/swift-exterior-left-front-three-quarter.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Maruti Swift",
                              price: "5.99 - 9.03 Lakh",
                              engine: "1197 cc",
                              bhp: "88.5",
                              capacity: "5",
                              mileage: "22.38kmpl",
                              fuelType: "Petrol / CNG",
                              carImage: swiftImages,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CstmImage(
                      name: "Thar",
                      assetsPath:
                          "assets/images/thar/thar-exterior-right-front-three-quarter-32.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Mahindra Thar",
                              price: "10.98 - 16.94 Lakh",
                              engine: "2184 cc",
                              bhp: "150.0",
                              capacity: "4",
                              mileage: "15.2 kmpl",
                              fuelType: "Petrol/Diesel",
                              carImage: tharImages,
                            ),
                          ),
                        );
                      },
                    ),
                    CstmImage(
                      name: "Innova",
                      assetsPath:
                          "assets/images/innova/toyota-innova-crysta-left-front-three-quarter1.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Toyota Innova",
                              price: "19.99 - 26.05 Lakh",
                              engine: "2393 cc",
                              bhp: "147.51",
                              capacity: "7, 8",
                              mileage: "Manual",
                              fuelType: "Diesel",
                              carImage: innovaImages,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CstmImage(
                      name: "Harrier",
                      assetsPath:
                          "assets/images/harrier/harrier-facelift-exterior-right-front-three-quarter-2.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Tata Harrier",
                              price: "15.49 - 26.44 Lakh",
                              engine: "1956 cc",
                              bhp: "167.62",
                              capacity: "5",
                              mileage: "16.8 kmpl",
                              fuelType: "Diesel",
                              carImage: harrier,
                            ),
                          ),
                        );
                      },
                    ),
                    CstmImage(
                      name: "Fortuner",
                      assetsPath:
                          "assets/images/fortuner/toyota-fortuner-right-front-three-quarter29.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Toyota Fortuner",
                              price: "33.43 - 51.44 Lakh",
                              engine: "2755 cc",
                              bhp: "201.15",
                              capacity: "7",
                              mileage: "10.0 kmpl",
                              fuelType: "Petrol/Diesel",
                              carImage: fortuner,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CstmImage(
                      name: "XUV 700",
                      assetsPath:
                          "assets/images/xuv/xuv700-exterior-right-front-three-quarter-2.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Mahindra XUV700",
                              price: "14.03 - 26.57 Lakh",
                              engine: "2198 cc",
                              bhp: "197.13",
                              capacity: "7",
                              mileage: "13.0 kmpl",
                              fuelType: "Petrol/Diesel",
                              carImage: xuv,
                            ),
                          ),
                        );
                      },
                    ),
                    CstmImage(
                      name: "Brezza",
                      assetsPath:
                          "assets/images/brezza/brezza-exterior-left-front-three-quarter.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Maruti Brezza",
                              price: "8.29 - 14.14 Lakh",
                              engine: "1462 cc",
                              bhp: "101.65",
                              capacity: "5",
                              mileage: "17.38 - 19.8 kmpl",
                              fuelType: "Petrol/CNG",
                              carImage: brezza,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CstmImage(
                      name: "Safari",
                      assetsPath:
                          "assets/images/safari/safari-facelift-exterior-right-front-three-quarter-38.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Tata Safari",
                              price: "16.19 - 27.34 Lakh",
                              engine: "1956 cc",
                              bhp: "167.62",
                              capacity: "7",
                              mileage: "14.5 kmpl",
                              fuelType: "Diesel",
                              carImage: safari,
                            ),
                          ),
                        );
                      },
                    ),
                    CstmImage(
                      name: "Seltos",
                      assetsPath:
                          "assets/images/seltos/seltos-exterior-left-front-three-quarter.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Kia Seltos",
                              price: "10.90 - 20.30 Lakh",
                              engine: "1497 cc",
                              bhp: "157.81",
                              capacity: "5",
                              mileage: "17.0 kmpl",
                              fuelType: "Petrol/Diesel",
                              carImage: seltos,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CstmImage(
                      name: "Baleno",
                      assetsPath:
                          "assets/images/baleno/baleno-exterior-right-front-three-quarter-64.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Maruti Baleno",
                              price: "6.61 - 9.88 Lakh",
                              engine: "1197 cc",
                              bhp: "88.5",
                              capacity: "5",
                              mileage: "22.94 kmpl",
                              fuelType: "Petrol/CNG",
                              carImage: baleno,
                            ),
                          ),
                        );
                      },
                    ),
                    CstmImage(
                      name: "Compass",
                      assetsPath:
                          "assets/images/jeep_compass/compass-exterior-left-front-three-quarter.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Jeep Compass",
                              price: "20.49 - 32.07 Lakh",
                              engine: "1956 cc",
                              bhp: "167.67",
                              capacity: "5",
                              mileage: "17.1 kmpl",
                              fuelType: "Diesel",
                              carImage: compass,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CstmImage(
                      name: "Wranglor",
                      assetsPath:
                          "assets/images/wranglor/wrangler-exterior-right-front-three-quarter-51.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Jeep Wranglor",
                              price: " 62.64 - 66.64 Lakh",
                              engine: "1995 cc",
                              bhp: "167.67",
                              capacity: "5",
                              mileage: "10.35 kmpl",
                              fuelType: "Deisel",
                              carImage: wranglor,
                            ),
                          ),
                        );
                      },
                    ),
                    CstmImage(
                      name: "Amaze",
                      assetsPath:
                          "assets/images/amaze/amaze-facelift-exterior-left-front-three-quarter-2.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Honda Amaze",
                              price: "7.10 - 9.86 Lakh",
                              engine: "1199 cc",
                              bhp: "88.5",
                              capacity: "5",
                              mileage: "18.6 kmpl",
                              fuelType: "Petrol/Diesel",
                              carImage: amaze,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CstmImage(
                      name: "Hector",
                      assetsPath:
                          "assets/images/hector/hector-exterior-right-front-three-quarter-73.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "MG Hector",
                              price: "14.73 - 21.93 Lakh",
                              engine: "1956 cc",
                              bhp: "167.76",
                              capacity: "5",
                              mileage: "15.58 kmpl",
                              fuelType: "Petrol/Diesel",
                              carImage: hector,
                            ),
                          ),
                        );
                      },
                    ),
                    CstmImage(
                      name: "Kodiaq",
                      assetsPath:
                          "assets/images/kodiaq/kodiaq-exterior-left-front-three-quarter.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Skoda Kodiaq",
                              price: "38.50 - 41.95 Lakh",
                              engine: "1984 cc",
                              bhp: "187.74",
                              capacity: "7",
                              mileage: "12.78 kmpl",
                              fuelType: "Petrol",
                              carImage: kodiaq,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CstmImage(
                      name: "BMW i7",
                      assetsPath:
                          "assets/images/bmw/i7-exterior-right-front-three-quarter-6.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "BMW i7",
                              price: "2.03 - 2.50 Cr",
                              engine: "2998 cc",
                              bhp: "536.4",
                              capacity: "5",
                              mileage: "101.7 kwh",
                              fuelType: "Electric",
                              carImage: bmw,
                            ),
                          ),
                        );
                      },
                    ),
                    CstmImage(
                      name: "Polo",
                      assetsPath:
                          "assets/images/polo/polo-exterior-left-front-three-quarter-6.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Volkswagen Polo",
                              price: "8 Lakh",
                              engine: "999 cc",
                              bhp: "167.76",
                              capacity: "5",
                              mileage: "12.50 kmpl",
                              fuelType: "Petrol",
                              carImage: polo,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CstmImage(
                      name: "Discovery",
                      assetsPath:
                          "assets/images/discovery/landrover-discovery-sport-right-front-three-quarter339.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Land Rover Discovery",
                              price: "95.65 Lakh - 1.32 Cr",
                              engine: "2998 cc",
                              bhp: "355.37",
                              capacity: "4",
                              mileage: "11.23 kmpl",
                              fuelType: "Petrol/Diesel",
                              carImage: discovery,
                            ),
                          ),
                        );
                      },
                    ),
                    CstmImage(
                      name: "Mercedes E-Class",
                      assetsPath:
                          "assets/images/mercedes_e_class/e-class-exterior-left-front-three-quarter.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Mercedes-E-Class",
                              price: "75 - 88 Lakh",
                              engine: "2925 cc",
                              bhp: "281.61",
                              capacity: "5",
                              mileage: "13.9 kmpl",
                              fuelType: "Petrol/Diesel",
                              carImage: mercedes,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CstmImage(
                      name: "Gloster",
                      assetsPath:
                          "assets/images/gloster/gloster-exterior-right-front-three-quarter.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "MG Gloster",
                              price: "38.80 - 43.87 Lakh",
                              engine: "1996 cc",
                              bhp: "212.55",
                              capacity: "7",
                              mileage: "13.92 kmpl",
                              fuelType: "Diesel",
                              carImage: gloster,
                            ),
                          ),
                        );
                      },
                    ),
                    CstmImage(
                      name: "Audi A4",
                      assetsPath:
                          "assets/images/audi/a4-exterior-left-front-three-quarter-3.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Audi A4",
                              price: "43.85 - 51.85 Lakh",
                              engine: "1998 cc",
                              bhp: "187.74",
                              capacity: "5",
                              mileage: "14.5 kmpl",
                              fuelType: "Petrol",
                              carImage: audi,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CstmImage(
                      name: "Jaguar F-Pace",
                      assetsPath:
                          "assets/images/jaguar/f-pace-exterior-right-front-three-quarter-3.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Jaguar F-Pace",
                              price: "77.41 Lakh",
                              engine: "1997 cc",
                              bhp: "246.74",
                              capacity: "5",
                              mileage: "19.3 kmpl",
                              fuelType: "Petrol/Diesel",
                              carImage: jaguar,
                            ),
                          ),
                        );
                      },
                    ),
                    CstmImage(
                      name: "Mini Cooper",
                      assetsPath:
                          "assets/images/mini_cooper/cooper-se-exterior-left-front-three-quarter-2.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Mini Cooper SE-3",
                              price: "42.70 Lakh",
                              engine: "1998 cc",
                              bhp: "189.08",
                              capacity: "2",
                              mileage: "17.33 kmpl",
                              fuelType: "Petrol",
                              carImage: miniCooper,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CstmImage(
                      name: "Alcazar",
                      assetsPath:
                          "assets/images/alcazar/alcazar-exterior-right-front-three-quarter-10.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Hyundai Alcazar",
                              price: "16.77 - 21.23 Lakh",
                              engine: "1498 cc",
                              bhp: "157.57",
                              capacity: "7",
                              mileage: "20.4 kmpl",
                              fuelType: "Petrol/Diesel",
                              carImage: alcazar,
                            ),
                          ),
                        );
                      },
                    ),
                    CstmImage(
                      name: "Cruiser",
                      assetsPath:
                          "assets/images/urban_cruiser/urban-cruiser-hyryder-exterior-left-front-three-quarter-2.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Urban Cruiser",
                              price: "10.86 - 19.99 Lakh",
                              engine: "1490 cc",
                              bhp: "101.64",
                              capacity: "5",
                              mileage: "27.97 kmpl",
                              fuelType: "Petrol / CNG",
                              carImage: urbanCruiser,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CstmImage(
                      name: "Endeavour",
                      assetsPath:
                          "assets/images/endeavour/endeavour-exterior-right-front-three-quarter-149471.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Ford Endeavour",
                              price: "29.99 - 36.27 Lakh",
                              engine: "1996 cc",
                              bhp: "167.62",
                              capacity: "7",
                              mileage: "13.9 kmpl",
                              fuelType: "Diesel",
                              carImage: endeavour,
                            ),
                          ),
                        );
                      },
                    ),
                    CstmImage(
                      name: "Carnival",
                      assetsPath:
                          "assets/images/carnival/kia-carnival-left-front-three-quarter1.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Kia Carnival",
                              price: "40 Lakh",
                              engine: "2199 cc",
                              bhp: "167.62",
                              capacity: "7",
                              mileage: "13.45 kmpl",
                              fuelType: "Diesel",
                              carImage: carnival,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CstmImage(
                      name: "Honda City",
                      assetsPath:
                          "assets/images/honda_city/city-exterior-right-front-three-quarter-74.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Honda City",
                              price: "11.63 - 16.11 Lakh",
                              engine: "1498 cc",
                              bhp: "119.35",
                              capacity: "5",
                              mileage: "18.4 kmpl",
                              fuelType: "Petrol",
                              carImage: hondaCity,
                            ),
                          ),
                        );
                      },
                    ),
                    CstmImage(
                      name: "Slavia",
                      assetsPath:
                          "assets/images/slavia/slavia-exterior-left-front-three-quarter-2.jpeg.webp",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CstmCar(
                              carName: "Skoda Slavia",
                              price: "10.89 - 19.12 Lakh",
                              engine: "1498 cc",
                              bhp: "147.52",
                              capacity: "5",
                              mileage: "19.47 kmpl",
                              fuelType: "Petrol",
                              carImage: slavia,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_double_arrow_down,
                    color: Colors.black,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  label: const Text(
                    "Show more",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              color: Colors.blue.shade200,
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const CircleAvatar(
                      maxRadius: 30,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "English",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade900,
                        fixedSize: const Size(100, 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Login"),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  CstmIcon(
                    iconData: Icons.home_outlined,
                    name: "Home",
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  CstmIcon(
                    iconData: Icons.car_rental_outlined,
                    name: "New Cars",
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  CstmIcon(
                    iconData: Icons.list_alt_outlined,
                    name: "Reviews and News",
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  CstmIcon(
                    iconData: Icons.favorite_border,
                    name: "My Shortlist",
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  CstmIcon(
                    iconData: Icons.wallet,
                    name: "Car Loan",
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  CstmIcon(
                    iconData: Icons.local_atm_outlined,
                    name: "Loan Against Car",
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  CstmIcon(
                    iconData: Icons.language,
                    name: "Choose Language",
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  const Text("TOLL FREE NUMBER"),
                  const SizedBox(height: 2),
                  InkWell(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Icon(
                          CupertinoIcons.phone,
                          color: Colors.blue,
                        ),
                        Text(
                          "1800 1234 123",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
