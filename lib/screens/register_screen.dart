import 'package:flutter/material.dart';
import 'package:login_animation_design_i/constants/custom_colors.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Register Screen',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0),
                height: 200.0,
                width: 300.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(80.0),
                    bottomRight: Radius.circular(80.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 5.0),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Name',
                            hintStyle: TextStyle(fontSize: 25.0),
                            prefixIcon: Icon(
                              Icons.person,
                              size: 40.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 0.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Mail',
                            hintStyle: TextStyle(fontSize: 25.0),
                            prefixIcon: Icon(
                              Icons.mail,
                              size: 40.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 30.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(fontSize: 25.0),
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 40.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 260.0,
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 150.0),
              decoration: BoxDecoration(
                color: CustomColors.firstColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
