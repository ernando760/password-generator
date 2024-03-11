import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/src/shared/constant/colors.dart';
import 'package:password_generator/src/shared/constant/text_style.dart';

void showDialogPasswordGenerated(BuildContext context, String password) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            alignment: Alignment.center,
            actionsAlignment: MainAxisAlignment.center,
            actionsOverflowButtonSpacing: 25,
            icon: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                  )),
            ),
            iconPadding: EdgeInsets.zero,
            contentPadding:
                const EdgeInsets.only(left: 24, right: 24, bottom: 27),
            titlePadding: const EdgeInsets.only(bottom: 40),
            title: const Text(
              "Sua Senha",
              textAlign: TextAlign.center,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            titleTextStyle:
                headLine22Bold.copyWith(fontSize: 25, color: richBlack),
            contentTextStyle:
                headLine20SemiBold.copyWith(overflow: TextOverflow.ellipsis),
            content: Text(
              password,
              style: headLine20SemiBold.copyWith(
                  color: richBlack, overflow: TextOverflow.ellipsis),
              textAlign: TextAlign.center,
            ),
            actions: [
              IconButton(
                  onPressed: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    await Clipboard.setData(ClipboardData(text: password));
                    messenger.showSnackBar(const SnackBar(
                        elevation: 9, content: Text("A senha foi copiada")));
                  },
                  style: IconButton.styleFrom(backgroundColor: orange),
                  icon: const Icon(
                    Icons.copy,
                    color: white,
                  )),
              IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(backgroundColor: green),
                  icon: const Icon(
                    Icons.save_outlined,
                    color: white,
                  )),
            ],
          ));
}
