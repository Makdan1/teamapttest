

import 'package:teamapttest/core/model/Items.dart';
import 'package:teamapttest/core/services/database_service.dart';
import 'package:teamapttest/utils/base_model.dart';
import 'package:teamapttest/utils/helpers.dart';
import 'package:teamapttest/utils/locator.dart';

class FavViewModel extends BaseModel {
  Items? items;
  final DatabaseService helper = locator<DatabaseService>();
  List<Items> employeeDataList = [];


  //Get all the employess on the database
  getFavorites() async {
    List<Items> res = await helper.getList();
    if(res.isEmpty){
      employeeDataList =  [];
    }

    else  if (res.isNotEmpty) {
      employeeDataList = res;
      notifyListeners();
    }
    return employeeDataList;
  }


  //Function to delete employee
  deleteFavorite(Items items) async {
    setBusy(true);
    int result;
    result = await helper.delete(items);
    if (result != 0) {
      setBusy(false);
      //Success
      showToast("favorite deleted successfully");
      getFavorites();
      notifyListeners();
    } else {
      setBusy(false);
      // Failure
      showToast("favorite deleting Employee'");
      notifyListeners();
    }
  }


}