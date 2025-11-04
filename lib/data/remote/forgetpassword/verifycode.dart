import 'package:projct2/core/class/crud.dart';
import 'package:projct2/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postdata(String email, String verfiycode) async {
    var response = await crud.postData(AppLink.verifycodeforgetpassword,
        {"email": email, "verfiycode": verfiycode});
    return response.fold((l) => l, (r) => r);
  }
}
