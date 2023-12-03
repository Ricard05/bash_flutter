import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bash/widgets/widgets.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter_bash/models/indexed_item.dart';
import 'package:flutter_bash/widgets/pie_chart_widget.dart';

 List<List<IndexedItem>> IndexedContainerIncome = [
  //Primer registro
      [
        //Campos de cada registro
          IndexedItem(title: 'Hamburguesa', subtitle: 'Descripcion', icon: Icons.description),
          IndexedItem(title: '123.00', subtitle: 'Cantidad', icon: Icons.monetization_on_rounded),
          IndexedItem(title: '2023-11-08', subtitle: 'Fecha', icon: Icons.date_range),
          IndexedItem(title: 'Comida', subtitle: 'Categoria', icon: Icons.fastfood),
      ],

//Segundo registro
      [
        IndexedItem(title: 'Uber', subtitle: 'Descripcion', icon: Icons.description),
        IndexedItem(title: '69.89', subtitle: 'Cantidad', icon: Icons.monetization_on_rounded),
        IndexedItem(title: '2023-11-23', subtitle: 'Fecha', icon: Icons.date_range),
        IndexedItem(title: 'Transporte', subtitle: 'Categoria', icon: Icons.bus_alert),
      ],

//Tercer registro
      [
        IndexedItem(title: 'Electricidad', subtitle: 'Descripcion', icon: Icons.description),
        IndexedItem(title: '546.24', subtitle: 'Cantidad', icon: Icons.monetization_on_rounded),
        IndexedItem(title: '2023-11-08', subtitle: 'Fecha', icon: Icons.date_range),
        IndexedItem(title: 'Vivienda', subtitle: 'Categoria', icon: Icons.house),
      ],
  ];

final 
class IncomesScreen extends StatefulWidget {
  const IncomesScreen({Key? key}) : super(key: key);

  @override
  State<IncomesScreen> createState() => _IncomesScreenState();
}

class _IncomesScreenState extends State<IncomesScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: const Text('Ingresos'),
      drawer: const Nav(),  
      headerWidget: FadeInUp(
        duration: Duration(milliseconds: 800),
        child: Container(
          alignment: Alignment.centerLeft,
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Row(
                  children: [
                    Text('Ingresos', style: TextStyle(fontSize: 50, color: Colors.white)),
                  ],
                ),
                SizedBox(height: 20,),
                ListTile(
                  title: Text('\$4,500.00', style: TextStyle(color: Colors.white, fontSize: 20),),
                  subtitle: Text('Total de ingresos'),
                ),
                ListTile(
                  title: Text('Salario', style: TextStyle(color: Colors.white, fontSize: 20),),
                  subtitle: Text('Ingreso mas comun'),
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
                child: CustomList(
                  length: IndexedContainerIncome.length,
                  height: 50,
                  width: 500,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5), // Espacio entre los botones
                      child: ElevatedButton(
                        onPressed: (){
                          setState(
                            () {
                              selectedIndex = index;
                            }
                          );
                        },
                        child: Icon(Icons.file_copy)
                      ),
                    );
                  },
                  axis: Axis.horizontal
                ),
              ),
            ),
          ),

          FadeInUp(
            duration: Duration(milliseconds: 800),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IndexedStack(
                index: selectedIndex,
                children: [
                  for (int i = 0; i < IndexedContainerIncome.length; i++)
                    CustomList(
                      length: IndexedContainerIncome[i].length,
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      itemBuilder: (context, index) {
                        return RegisterItem(
                          title: IndexedContainerIncome[i][index].title,
                          icon: IndexedContainerIncome[i][index].icon,
                          subtitle: IndexedContainerIncome[i][index].subtitle,
                        );
                      },
                      axis: Axis.vertical
                    )
                  ],
              ),
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
              )
                  ),
          ),
      ]
    );
  }
}