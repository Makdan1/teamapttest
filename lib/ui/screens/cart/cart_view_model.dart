

import 'package:teamapttest/core/model/Items.dart';
import 'package:teamapttest/core/services/database_service.dart';
import 'package:teamapttest/utils/base_model.dart';
import 'package:teamapttest/utils/helpers.dart';
import 'package:teamapttest/utils/locator.dart';

class CartViewModel extends BaseModel {
  Items? items;
  final DatabaseService helper = locator<DatabaseService>();
  List<Items> cartList = [];


  //Get all the employess on the database
  getCart() async {
    List<Items> res = await helper.getCartList();
    if(res.isEmpty){
      cartList =  [];
    }

    else  if (res.isNotEmpty) {
      cartList = res;
      notifyListeners();
    }
    return cartList;
  }


  //Function to delete employee
  deleteCart(Items items) async {
    setBusy(true);
    int result;
    result = await helper.deleteCart(items);
    if (result != 0) {
      setBusy(false);
      //Success
      showToast("Employee deleted cart");
      getCart();
      notifyListeners();
    } else {
      setBusy(false);
      // Failure
      showToast("Problem deleting cart'");
      notifyListeners();
    }
  }


}