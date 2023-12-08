import 'package:cloud_firestore/cloud_firestore.dart';

//Instancia de Firebase Firestore
FirebaseFirestore db = FirebaseFirestore.instance;

Future<bool> getUsers (email, password) async {
  List users = [];
  //Referencia a la conexion de la base de datos
  CollectionReference collectionReferenceUsers = db.collection('users');

  QuerySnapshot queryUsers = await collectionReferenceUsers.where('email', isEqualTo: email).where('password', isEqualTo: password).get();

  queryUsers.docs.forEach((user) {
    users.add(user.data());
   }
  );

  if (users.length == 0) {
    return false;
  } else {
    return true;
  }
}

Future<List> getBills (email) async {
  List bills = [];
  //Referencia a la conexion de la base de datos
  CollectionReference collectionReferenceUsers = db.collection('bills');

  QuerySnapshot queryUsers = await collectionReferenceUsers.where('email', isEqualTo: email).get();

  queryUsers.docs.forEach((bill) {
    bills.add(bill.data());
   }
  );

  return bills;
}

Future<List> getIncomes (email) async {
  List incomes = [];
  //Referencia a la conexion de la base de datos
  CollectionReference collectionReferenceUsers = db.collection('incomes');

  QuerySnapshot queryUsers = await collectionReferenceUsers.where('email', isEqualTo: email).get();

  queryUsers.docs.forEach((income) {
    incomes.add(income.data());
   }
  );

  return incomes;
}

Future<bool> addUser (username, password, lastname, email) async {
  List users = [];
  //Referencia a la conexion de la base de datos
  CollectionReference collectionReferenceUsers = db.collection('users');
  QuerySnapshot queryUsers = await collectionReferenceUsers.where('email', isEqualTo: email).get();
  print(queryUsers);

  if (queryUsers.size == 0) {
    await db.collection('users').add(
    {
      "username": username,
      "lastname": lastname,
      "password": password,
      "email": email,
    }
    );
    return true;
  } else {
    return false;
  } 
}