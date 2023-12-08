import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bash/widgets/widgets.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter_bash/providers/provider.dart';
import 'package:flutter_bash/services/firebase_service.dart';

List indexedContainer = [
  {
    "title": "description",
    "icon": Icons.description,
  },
  {
    "title": "amount",
    "icon": Icons.monetization_on,
  },
  {
    "title": "category",
    "icon": Icons.book,
  },
  {
    "title": "date",
    "icon": Icons.date_range,
  }
];

final class BillsScreen extends StatefulWidget {
  const BillsScreen({Key? key}) : super(key: key);

  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: const Text('Gastos'),
      drawer: const Nav(),
      appBarColor: Colors.red,
      headerWidget: FadeInUp(
        duration: Duration(milliseconds: 800),
        child: Container(
          color: Colors.red,
          alignment: Alignment.centerLeft,
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text('Gastos',
                        style: TextStyle(fontSize: 50, color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Text(
                    '\$3,345.00',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  subtitle: Text('Total de gastos'),
                ),
                ListTile(
                  title: Text(
                    'Comida',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  subtitle: Text('Categoria mas comun'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: [
        //Se generan botones que van a controlar el contenido que se mostrara del IndexedStack
        FadeInUp(
          duration: Duration(milliseconds: 800),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: FutureBuilder(
                future: getBills(context.watch<GmailProvider>().gmail),
                builder: (context, snapshot) {
                  return CustomList(
                      length: snapshot.data?.length,
                      height: 50,
                      width: 500,
                      itemBuilder: (context, index) {
                        if (snapshot.hasData) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5), // Espacio entre los botones
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    print(index);
                                    selectedIndex = index;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                child: Icon(Icons.file_copy)),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                      axis: Axis.horizontal);
                },
              ),
            ),
          ),
        ),

        //Generar de forma dinamica los registros
        FadeInUp(
          duration: Duration(milliseconds: 800),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
                future: getBills(context.watch<GmailProvider>().gmail),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return IndexedStack(
                      index: selectedIndex,
                      children: [
                        if (snapshot.hasData && snapshot.data != null)
                          for (int i = 0; i < snapshot.data!.length; i++)
                            CustomList(
                              length: snapshot.data?[i].length-1,
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width,
                              itemBuilder: (context, index) {
                                return RegisterItem(
                                  title: '${snapshot.data?[i]['${indexedContainer[index]['title']}']}',
                                  icon: indexedContainer[index]['icon'],
                                  subtitle: indexedContainer[index]['title'],
                                  leadingColor: Colors.red[600]!,
                                );
                              },
                              axis: Axis.vertical,
                            ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ),

        FadeInUp(
          duration: Duration(milliseconds: 800),
          child: const SizedBox(
              height: 300,
              width: 500,
              child: Padding(
                padding: EdgeInsets.all(40),
                child: MyPieChart(),
              )),
        ),
      ],
    );
  }
}
