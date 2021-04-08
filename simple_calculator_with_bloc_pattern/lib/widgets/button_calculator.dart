import 'package:flutter/material.dart';

class ButtonCalculator extends StatelessWidget {
  final String buttonText;
  final VoidCallback callback;
  final Color color;

  const ButtonCalculator(
      {@required this.buttonText,
      @required this.callback,
      this.color = Colors.black38});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: this.callback,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: this.color,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(2.0, 1.0),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Center(
            child: Text(
              this.buttonText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
