import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:provider/provider.dart';
import 'package:sang/features/form/view_model/add_project_view_model.dart';
import 'package:sang/res/constants/app_colors.dart';

class SignatureScreen extends StatelessWidget {
  SignatureScreen({super.key});

  final _sign = GlobalKey<SignatureState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.kBlack,
      body: Consumer<AddProjectViewModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: Signature(
                  color: AppColors.kBlack,
                  // backgroundPainter: AppColors.kWhite,
                  key: _sign,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async {
                      final sign = _sign.currentState;
                      final image = await sign?.getData();
                      var data = await image?.toByteData(
                          format: ui.ImageByteFormat.png);
                      value.setSignature(data?.buffer.asUint8List());
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.done,
                      color: AppColors.kBlack,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.undo,
                      color: AppColors.kBlack,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.redo,
                      color: AppColors.kBlack,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final sign = _sign.currentState;
                      sign?.clear();
                      value.setSignature(null);
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: AppColors.kBlack,
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
