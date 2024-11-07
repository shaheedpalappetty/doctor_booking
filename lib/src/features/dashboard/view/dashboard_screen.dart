import 'package:astha_agent/src/features/dashboard/widget/consultation_box.dart';
import 'package:astha_agent/src/features/dashboard/widget/document_box.dart';
import 'package:astha_agent/src/features/dashboard/widget/linear_graph.dart';
import 'package:astha_agent/src/features/dashboard/widget/textTile.dart';
import 'package:astha_agent/utils/colors.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.all(10),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.99,
            height: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Book Consultation',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ConsultationOption(
                      color: Colors.orange,
                      icon: Icons.group,
                      label: 'Existing patient',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ConsultationOption(
                      color: Colors.blue,
                      icon: Icons.person_add,
                      label: 'New Patient',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 50, 176, 54),
        onPressed: () {
          showCustomDialog(context);
        },
        child: const Image(
            image: AssetImage("assets/images/action_button_icon.png")),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: primaryColor.withOpacity(0.8),
            ),
          ),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              child: ListView(
                children: [
                  ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        builder: (context) {
                          return SizedBox(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 19),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Jennifer lawres",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      TextTile(
                                        title: "Email address",
                                        text: "michael@jordan.com",
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextTile(
                                              title: "Gender",
                                              text: "Male",
                                            ),
                                            TextTile(
                                              title: "Age",
                                              text: "28",
                                            ),
                                          ],
                                        ),
                                      ),
                                      DocumentBox(text: "ID Proof"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    title: const Text(
                      'Jennifer lawres',
                      style: TextStyle(
                          fontSize: 19.0,
                          fontFamily: "ReadexPro",
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    subtitle: const Text(
                      '+91 8755896432',
                      style: TextStyle(
                          fontFamily: "ReadexPro",
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    trailing: const CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/men.webp",
                      ),
                      radius: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute(builder: (ctx) {
                            //   return const RequestScreen();
                            // }));
                          },
                          child: const ConsultationBox(
                              count: "08",
                              title: "Schedule",
                              color: Color(0xff29536B)),
                        ),
                        const ConsultationBox(
                            count: "23",
                            title: "Total",
                            color: Color(0xff29536B))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          child: Row(children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 24),
                                child: Text(
                                  "31.04.2024",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: "ReadexPro",
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 7),
                          child: Text(
                            "to",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: "ReadexPro",
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 24),
                                child: Text(
                                  "31.04.2024",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: "ReadexPro",
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ])),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.all(7),
                                child: Icon(
                                  Icons.wallet,
                                  size: 29,
                                  color: primaryColor,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  LinearGraph(title: "Consultation"),
                  LinearGraph(
                    title: "Orders",
                  ),
                  const SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConsultationOption extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ConsultationOption({
    Key? key,
    required this.color,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
