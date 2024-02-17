import '../constents/common_imports.dart';

class MazzardTextWidget extends StatelessWidget {
  final String? text;
  final double? fontSize, lineHeight;
  final Color? color;
  final FontWeight? fontWeight;
  final bool? textCenterAlign;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final int? maxLine;
  final TextDecoration? textDecoration;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final Color? decorationColor;

  const MazzardTextWidget(
      {Key? key,
      this.text,
      this.fontSize,
      this.textOverflow,
      this.color,
      this.fontWeight,
      this.fontFamily,
      this.textCenterAlign = false,
      this.fontStyle,
      this.maxLine,
      this.lineHeight,
      this.textDecoration,
      this.letterSpacing,
      this.decorationColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      overflow: textOverflow,
      textAlign: textCenterAlign == false ? TextAlign.start : TextAlign.center,
      style: commonTextStyle(fontFamily),
      maxLines: maxLine ?? null,
    );
  }

  TextStyle commonTextStyle(String? fontFamily) {
    return TextStyle(
      fontFamily: fontFamily ?? "Mazzard",
      fontSize: fontSize,
      height: lineHeight ?? 24 / 20,
      color: color ?? Colors.grey,
      fontWeight: fontWeight ?? FontWeight.w700,
      fontStyle: fontStyle ?? FontStyle.normal,
      decoration: textDecoration ?? null,
      letterSpacing: letterSpacing ?? 0.0,
      decorationColor: decorationColor,
      // overflow: TextOverflow.ellipsis,
    );
  }
}
