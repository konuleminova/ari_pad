import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextField extends HookWidget {
  final String value;
  final void Function(String value) onChanged;
  final InputDecoration decoration;

  CustomTextField({
    this.value,
    this.onChanged,
    this.decoration,
  });


  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: value);

    print('Controller text:  ${controller.text}');

    useEffect(() {
      controller.text = value;
      return () {};
    }, [controller, value]);

    useEffect(() {
      final listener = () {
        onChanged(controller.text);
      };
      controller.addListener(listener);
      return () {
        controller.removeListener(listener);
      };
    }, [controller, onChanged]);

    return TextField(
      controller: controller,
      decoration: decoration,
    );
  }
}
