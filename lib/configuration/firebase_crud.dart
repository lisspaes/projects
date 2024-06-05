import 'package:cloud_firestore/cloud_firestore.dart';
FirebaseFirestore db = FirebaseFirestore.instance;

class FirebaseCRUD{
  static Future saveToken(fcmToken) async{
    Map<String, dynamic> data = {
      "nombre" : 'Usuario 1',
      "token" : fcmToken,
    };
    try{
      await db.collection('user_data').doc('1').set(data);
    }catch(e){
      print('Error al guardar los datos');
      print(e);
    }
  }
}