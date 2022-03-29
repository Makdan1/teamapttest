import 'package:teamapttest/core/model/Items.dart';
import 'package:teamapttest/core/services/database_service.dart';
import 'package:teamapttest/utils/base_model.dart';
import 'package:teamapttest/utils/helpers.dart';
import 'package:teamapttest/utils/locator.dart';

class HomeViewModel extends BaseModel {
  final DatabaseService helper = locator<DatabaseService>();

  List<Items> trendingList = [
    Items(
        itemId: "0",
        price: "100",
        title: 'Birthday',
        subtitle: "Happy Birthday",
        asset: "trending.jpeg",
        description:
            "ORB is a set of seven metal candle holders stacked on top of one another to form a modern spherical sculpture. Designed to be functional."),
    Items(
        itemId: "1",
        price: "70",
        title: "Royal",
        subtitle: "Royal chair",
        asset: "trending2.jpeg",
        description:
            "ORB is a set of seven metal candle holders stacked on top of one another to form a modern spherical sculpture. Designed to be functional."),
    Items(
        itemId: "2",
        price: "80",
        title: "Rocket",
        subtitle: "Green Rocket",
        asset: "trending3.jpeg",
        description:
            "ORB is a set of seven metal candle holders stacked on top of one another to form a modern spherical sculpture. Designed to be functional."),
  ];

  List<Items> chairList = [
    Items(
        itemId: "3",
        price: "120",
        title: "Dinning",
        subtitle: "Dinning table",
        asset: "chair4.jpeg",
        description:
            "ORB is a set of seven metal candle holders stacked on top of one another to form a modern spherical sculpture. Designed to be functional."),
    Items(
        itemId: "4",
        price: "150",
        title: 'Ankara',
        subtitle: "Akara Single",
        asset: "chair.jpeg",
        description:
            "ORB is a set of seven metal candle holders stacked on top of one another to form a modern spherical sculpture. Designed to be functional."),
    Items(
        itemId: "5",
        price: "130",
        title: "Curve",
        subtitle: "Curve Desing",
        asset: "chair2.jpeg",
        description:
            "ORB is a set of seven metal candle holders stacked on top of one another to form a modern spherical sculpture. Designed to be functional."),
  ];

  List<Items> decoList = [
    Items(
        itemId: "6",
        price: "240",
        title: "Seven",
        subtitle: "Seven Deco",
        asset: "deco2.jpeg",
        description:
            "ORB is a set of seven metal candle holders stacked on top of one another to form a modern spherical sculpture. Designed to be functional."),
    Items(
        itemId: "7",
        price: "125",
        title: "Ice",
        subtitle: "Ice-Cream Deco",
        asset: "deco3.jpeg",
        description:
            "ORB is a set of seven metal candle holders stacked on top of one another to form a modern spherical sculpture. Designed to be functional."),
    Items(
        itemId: "8",
        price: "300",
        title: 'Noom',
        subtitle: "Natural Deco",
        asset: "deco4.jpeg",
        description:
            "ORB is a set of seven metal candle holders stacked on top of one another to form a modern spherical sculpture. Designed to be functional."),
  ];

  //Function to save after the save button clicked
  saveFavorite(Items items) async {
    setBusy(true);
    //This convert the payload to the model
    //Items msg = Items.fromJson(items);
    notifyListeners();
    int result;
    //Then the model is passed to the database
    result = await DatabaseService.insert(items);
    if (result != 0) {
      setBusy(false);
      //Success
      showToast("Favorite saved successfully");
    } else {
      setBusy(false);
      // Failure
      showToast("Problem Saving Favorite'");
    }
  }

  saveCart(Items items) async {
    setBusy(true);
    //This convert the payload to the model
    //Items msg = Items.fromJson(items);
    notifyListeners();
    int result;
    //Then the model is passed to the database
    result = await DatabaseService.insertCart(items);
    if (result != 0) {
      setBusy(false);
      //Success
      showToast("Cart saved successfully");
    } else {
      setBusy(false);
      // Failure
      showToast("Cart Saving Employee'");
    }
  }

  deleteFavorite(Items items) async {
    setBusy(true);
    int result;
    result = await helper.delete(items);
    if (result != 0) {
      setBusy(false);
      //Success
      showToast("Favorite removed successfully");
      notifyListeners();
    } else {
      setBusy(false);
      // Failure
      showToast("Problem deleting Employee'");
      notifyListeners();
    }
  }
}
