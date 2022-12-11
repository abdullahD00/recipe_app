import 'package:flutter/cupertino.dart';

abstract class ISplashService {
  //check ınternet connection
  Future<void> checkEthernetConenction(BuildContext context) async {}
  //Change checkInternet Parametre
  Future<void> changeCheckInternet(BuildContext context) async {}
  //Make checkInternet Default
  Future<void> makeCheckInternetDefault(BuildContext context) async {}
  //go to NEXT PAGE
  Future<void> skipNextPage(BuildContext context) async {}
  //get Started, take all func to one func
  Future<void> getStart(BuildContext context) async {}
}
