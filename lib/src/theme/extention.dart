import 'package:flutter/material.dart';
import 'package:tele_app/src/theme/light_color.dart';

class CustomFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final BorderRadiusGeometry borderRadius;
  final Color color;
  final Color textColor;
  final String text;

  const CustomFlatButton({
    Key? key,
    required this.onPressed,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.color = Colors.blue,
    this.textColor = Colors.white,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      onPressed: onPressed,
      color: color,
      textColor: textColor,
      child: Text(text),
    );
  }
}

extension TextStyleHelpers on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get subTitleColor => copyWith(color: LightColor.subTitleTextColor);
}

extension PaddingHelper on Widget {
  Padding get p16 => Padding(padding: const EdgeInsets.all(16), child: this);

  Padding p(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  Padding get hP4 =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: this);
  Padding get hP8 =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: this);
  Padding get hP16 =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: this);

  Padding get vP16 =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 16), child: this);
  Padding get vP8 =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: this);
  Padding get vP4 =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 4), child: this);
}

extension Extended on Widget {
  Expanded get extended => Expanded(
        child: this,
      );
}

extension CornerRadius on Widget {
  ClipRRect get circular => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
        child: this,
      );
}

extension OnPressed on Widget {
  String get buttonText => '';

  Widget ripple(VoidCallback onPressed,
      {BorderRadiusGeometry borderRadius =
          const BorderRadius.all(Radius.circular(5)),
      required String text}) {
    return Stack(
      children: <Widget>[
        this,
        Positioned.fill(
          child: CustomFlatButton(
            onPressed: onPressed,
            borderRadius: borderRadius,
            text: text,
          ),
        ),
      ],
    );
  }
}

extension ExAlignment on Widget {
  Widget get alignTopCenter =>
      Align(alignment: Alignment.topCenter, child: this);
  Widget get alignCenter => Align(alignment: Alignment.center, child: this);
  Widget get alignBottomCenter =>
      Align(alignment: Alignment.bottomCenter, child: this);
  Widget get alignBottomLeft =>
      Align(alignment: Alignment.bottomLeft, child: this);
}
