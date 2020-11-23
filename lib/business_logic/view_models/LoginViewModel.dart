import 'package:ari_pad/business_logic/models/RestourantResponse.dart';
import 'package:ari_pad/business_logic/routes/route_navigation.dart';
import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/hooks/useSideEffect.dart';
import 'package:ari_pad/services/hooks/use_callback.dart';
import 'package:ari_pad/services/services/login_service.dart';
import 'package:ari_pad/ui/common_widgets/error_handler.dart';
import 'package:ari_pad/ui/views/login/login.dart';
import 'package:ari_pad/utils/sharedpref/prefence_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginViewModel extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final loginController = useTextEditingController(text: '');
    final passController = useTextEditingController(text: '');
    final ValueNotifier<String> login = useState<String>('');
    final ValueNotifier<String> password = useState<String>('');

    final loginCallBack = useCallback(() {
      if (loginController.text != null &&
          passController.text != null &&
          loginController.text.isNotEmpty &&
          passController.text.isNotEmpty) {
        login.value = loginController.text;
        password.value = passController.text;
      }
    }, [login.value, password.value]);

    ApiResponse<RestourantResponse> apiResponse =
        useLogin(login?.value, password?.value);

    useSideEffect(() {
      if (apiResponse?.data?.token != null) {
        PreferenceUtils.setString('token', apiResponse.data.token);
        PreferenceUtils.setString('name surname', apiResponse.data.name);
        pushRouteWithName('/home');
      }
      return () {};
    }, [apiResponse]);
    // TODO: implement build
    return CustomErrorHandler(
      statuses: [apiResponse.status],
      errors: [apiResponse.error],
      isInitial: !(loginController.text != null &&
          passController.text != null &&
          loginController.text.isNotEmpty &&
          passController.text.isNotEmpty),
      child: LoginView(
        loginController: loginController,
        passController: passController,
        apiResponse: apiResponse,
        loginCallback: loginCallBack,
      ),
    );
  }
}
