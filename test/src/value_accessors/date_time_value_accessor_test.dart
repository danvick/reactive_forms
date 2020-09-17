import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  group('DateTimeValueAccessor Tests', () {
    test('DateTimeValueAccessor converts to view value', () {
      // Given: a control
      final control = fb.control(DateTime.now());

      // And: an int value accessor
      final valueAccessor = DateTimeValueAccessor();

      // When: register control
      valueAccessor.registerControl(control);

      // And: set control value:
      control.value = DateTime(2020, 12, 30);

      // Then: value is converted correctly
      expect(valueAccessor.modelToViewValue(control.value), '2020/12/30');
    });

    test('DateTimeValueAccessor converts to model value', () {
      // Given: a control
      final control = fb.control(DateTime.now());

      // And: an int value accessor
      final valueAccessor = DateTimeValueAccessor();

      // When: register control
      valueAccessor.registerControl(control);

      // And: update accessor model value:
      valueAccessor.updateModel('2020/12/30');

      // Then: value is converted correctly
      expect(control.value, DateTime(2020, 12, 30));
    });

    test('DateTimeValueAccessor converts to empty string a null value', () {
      // Given: a control
      final control = fb.control(DateTime.now());

      // And: an int value accessor
      final valueAccessor = DateTimeValueAccessor();

      // When: register control
      valueAccessor.registerControl(control);

      // And: set control value:
      control.value = null;

      // Then: value is converted correctly
      expect(valueAccessor.modelToViewValue(control.value), '');
    });

    test('DateTimeValueAccessor converts to null empty string', () {
      // Given: a control
      final control = fb.control(DateTime.now());

      // And: an int value accessor
      final valueAccessor = DateTimeValueAccessor();

      // When: register control
      valueAccessor.registerControl(control);

      // And: update accessor model value:
      valueAccessor.updateModel('');

      // Then: value is converted correctly
      expect(control.value, null);
    });
  });
}
