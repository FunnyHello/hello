import 'package:flutter/material.dart';
import 'package:hello/page/home_page.dart';
import 'package:hello/page/register_page.dart';
import 'package:hello/utils/cache_utils.dart';
import 'package:hello/utils/constant.dart';
import 'package:hello/utils/toast_util.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  var leftRightPadding = 30.0;
  var topBottomPadding = 4.0;
  var textTips = TextStyle(fontSize: 16.0, color: Colors.black);
  var hintTips = TextStyle(fontSize: 15.0, color: Colors.black26);

  var _userPassController = TextEditingController();
  var _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: initView(),
    );
  }

  Widget initView() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(
              leftRightPadding, 50.0, leftRightPadding, topBottomPadding),
          child: TextField(
            style: hintTips,
            controller: _userNameController,
            decoration: InputDecoration(hintText: "请输入用户名"),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              leftRightPadding, 30.0, leftRightPadding, topBottomPadding),
          child: TextField(
            style: hintTips,
            controller: _userPassController,
            decoration: InputDecoration(hintText: "请输入用户密码"),
            obscureText: true,
          ),
        ),
        Container(
          width: 360.0,
          margin: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
          padding: EdgeInsets.fromLTRB(leftRightPadding, topBottomPadding,
              leftRightPadding, topBottomPadding),
          child: Card(
            color: Colors.green,
            elevation: 6.0,
            child: FlatButton(
                onPressed: () {
                  if (_userNameController.text.isEmpty &&
                      _userNameController.text.toString().length < 5) {
                    ToastUtil.showMsg("请输入正确的用户名");
                    return;
                  }
                  if (_userPassController.text.isEmpty &&
                      _userNameController.text.toString().length < 5) {
                    ToastUtil.showMsg("请输入正确的用户密码");
                    return;
                  }

                  CacheUtils.setString(Constant.LOGIN_TOKEN,
                      _userNameController.text.toString());

                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return HomePage();
                    },
                  ), (route) => route == null);
                },
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '登录',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                )),
          ),
        ),
        Container(
          width: 360.0,
          margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          padding: EdgeInsets.fromLTRB(leftRightPadding, topBottomPadding,
              leftRightPadding, topBottomPadding),
          child: Card(
            color: Colors.green,
            elevation: 6.0,
            child: FlatButton(
                onPressed: () {
                  ToastUtil.showMsg("点击注册");
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return RegisterPage();
                  }));
                },
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '注册',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                )),
          ),
        )
      ],
    );
  }
}
