import 'package:flutter/cupertino.dart';

abstract class ISplashService {
  //check ınternet connection
  Future<void> checkEthernetConnection(BuildContext context) async {}
  //Change checkInternet Parametre
  void changeCheckInternet(BuildContext context) {}
  //Make checkInternet Default
  void makeCheckInternetDefault(BuildContext context) {}
  //go to NEXT PAGE
  Future<void> skipNextPage(BuildContext context) async {}
  //get Started, take all func to one func
  Future<void> getStart(BuildContext context) async {}
}
