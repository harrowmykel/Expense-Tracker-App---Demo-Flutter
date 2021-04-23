import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/**
 * implement of different button design based
 * on os to improve app adaptibility
 */
class AdaptiveButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  AdaptiveButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              text,
            ),
            onPressed: () => onPressed(),
          )
        : ElevatedButton(
            child: Text(
              text,
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).textTheme.button.color),
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
            ),
            onPressed: () => onPressed(),
          );
  }
}
