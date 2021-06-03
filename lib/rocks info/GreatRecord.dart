import 'package:flutter/foundation.dart';
import 'dart:io';
import '../clases/record copy.dart';

//ChangeNotifier is a mixin that allows to call notifyListeners which
//will be uused by provide pack to update all the record
class GreatRecord with ChangeNotifier {
  //but here private so this cann't be changed from outside
  List<Record> _items = [];

//unprivate item so i can use it any where in the app
  List<Record> get items {
    return [..._items];
  }

  void addPlace(
    //String pickedTitle,

    File pickedImage,
  ) {
    final newPlace = Record(
      EC: null,
      EH: null,
      city: null,
      date: null,
      pH: null,
      remark: null,
      siteName: null,
      stream: null,
      temp: null,
      latitude: null,
      //  images: null,
      longitude: null,

      // title: pickedTitle,

      //location: null,
    );
    // Imag newI = new Imag(image: pickedImage);
    // newPlace.images.add(newI);
    _items.add(newPlace);
    //to inform that the data is changed
    notifyListeners();
  }
}
