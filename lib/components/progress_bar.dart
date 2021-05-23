import 'package:flutter/cupertino.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ProgressBar {
  ProgressDialog progressDialog;

  ProgressBar._();

  static final ProgressBar indicator = ProgressBar._();

  show(BuildContext context) {
    progressDialog = new ProgressDialog(context);
    progressDialog.style(message: 'Please wait...');
    progressDialog.show();
  }

  hide() {
    progressDialog.hide();
  }
}
