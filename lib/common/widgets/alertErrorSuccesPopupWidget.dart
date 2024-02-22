import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:key_stroke_wfh/common/constents/common_imports.dart';
import 'package:key_stroke_wfh/common/utils/colors.dart';
import 'package:key_stroke_wfh/common/utils/hexColorConverter.dart';
import 'package:key_stroke_wfh/common/widgets/mazzard_widget.dart';
import 'package:sizer/sizer.dart';

enum AlertType {
  error,
  success,
}

class CommonAlert<T> {
  final String? title; //title
  final String? message; //body
  final String? assetSrc; //image source
  final String? button1Text; //text for first button
  final String? button2Text; // text for seccond button
  final VoidCallback? btn1onPressed; //when click first button
  final VoidCallback? btn2onPressed; //when click seccond button

  static bool _isDialogShowing = false;

  final bool? onlyNeedOneButton;
  final AlertType?
      alertType; //this decide this is error message or success message

  CommonAlert({
    @required this.title,
    @required this.onlyNeedOneButton,
    @required this.message,
    @required this.alertType,
    this.assetSrc,
    this.btn1onPressed,
    this.btn2onPressed,
    this.button1Text,
    this.button2Text,
  });

  static Color alertSuccessTitleBlueColor = HexColorConverter("#044472");
  static Color alertErrorTitleRedColor = HexColorConverter("#D43345");
  static Color alertErrorButtonRedColor = HexColorConverter("#D31309");
  static Color whiteBtnColor = HexColorConverter("#E3E3E3");

  Future<void> show(BuildContext context) async {
    if (_isDialogShowing) {
      return;
    }
    _isDialogShowing = true;

    Color titleColor;
    Color buttonColor;
    if (alertType == AlertType.error) {
      titleColor = alertErrorTitleRedColor;
      buttonColor = alertErrorButtonRedColor;
    } else {
      titleColor = alertSuccessTitleBlueColor;
      buttonColor = alertSuccessTitleBlueColor;
    }

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: FittedBox(
            child: SizedBox(
              width: 45.3.h,
              height: 30.3.h,
              child: Column(
                children: [
                  Center(
                    child: Container(
                        width: double.infinity,
                        height: 7.0.h,
                        color: titleColor ?? alertErrorTitleRedColor,
                        child: Center(
                          child: MazzardTextWidget(
                            text: title ?? "Delete Question",
                            textCenterAlign: true,
                            fontSize: 13.4.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorData.corporateWhite,
                          ),
                        )),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              MazzardTextWidget(
                                // text: "Ensure that the popup description is clear, concise, and visually appealing to enhance user engagement. The ideal size for a popup description is typically limited to a few lines of text, striking a balance between providing sufficient information and avoiding overwhelming the user.",
                                text:
                                    message ?? "Are you sure want to delete?",
                                fontWeight: FontWeight.w400,
                                fontSize: 2.2.h,
                                maxLine: 5,
                                textCenterAlign: true,
                                color: HexColorConverter("#4A4A4A"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: onlyNeedOneButton == true
                              ? InkWell(
                                  onTap: btn1onPressed ??
                                      () {
                                        Navigator.of(context).pop();
                                        // Navigator.of(context).popUntil((route) => route
                                        //     .isFirst); // Dismiss all previous routes
                                        _isDialogShowing = false;

                                        // Navigator.of(context).pop();
                                      },
                                  child: AlertButtonWidget(
                                      btnText: button1Text ?? "Yes",
                                      context: context,
                                      colorData: buttonColor ??
                                          alertErrorButtonRedColor),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: btn1onPressed,
                                      child: AlertButtonWidget(
                                          btnText: button1Text ?? "Yes",
                                          context: context,
                                          colorData: buttonColor ??
                                              alertErrorButtonRedColor),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: btn2onPressed,
                                      child: AlertButtonWidget(
                                          btnText: button2Text ?? "No",
                                          context: context,
                                          colorData: ColorData.blueTextColor),
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).then((_) {
      _isDialogShowing = false; // Reset the flag when the dialog is dismissed
    });
  }

  Widget AlertButtonWidget({context, Color? colorData, String? btnText}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        width: 10.0.h,
        height: 5.h,
        child: Container(
          color: colorData ?? alertErrorButtonRedColor,
          child: Center(
            child: MazzardTextWidget(
                text: btnText ?? "Yes",
                fontWeight: FontWeight.w500,
                fontSize: 12.9.sp,
                color: ColorData.corporateWhite),
          ),
        ),
      ),
    );
  }
}

showSuccessMsgPopup({String? msg, BuildContext? context, String? title}) {
  return CommonAlert(
          title: title ?? 'Success',
          message: msg,
          button1Text: "OK",
          alertType: AlertType.success,
          onlyNeedOneButton: true)
      // .show(context);
      .show(Injector().navigatorKey.currentContext!);
}

showErrorMsgPopup(
    {String? msg, BuildContext? context, String? title, String? btnText}) {
  return CommonAlert(
    title: title ?? "Error",
    message: msg,
    button1Text: btnText ?? "Cancel",
    alertType: AlertType.error,
    onlyNeedOneButton: true,
  )
      // .show(context!);
      .show(Injector().navigatorKey.currentContext!);
}
