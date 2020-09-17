import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  group('IntValueAccessor Tests', () {
    test('IntValueAccessor converts to view value', () {
      // Given: a control
      final control = fb.control(0);

      // And: an int value accessor
      final valueAccessor = IntValueAccessor();

      // When: register control
      valueAccessor.registerControl(control);

      // And: set control value:
      control.value = 20;

      // Then: value is converted correctly
      expect(valueAccessor.modelToViewValue(control.value), '20');
    });

    test('IntValueAccessor converts to view value', () {
      // Given: a control
      final control = fb.control(0);

      // And: an int value accessor
      final valueAccessor = IntValueAccessor();

      // When: register control
      valueAccessor.registerControl(control);

      // And: update accessor model value:
      valueAccessor.updateModel('20');

      // Then: value is converted correctly
      expect(control.value, 20);
    });

    test('IntValueAccessor converts to empty string a null value', () {
      // Given: a control
      final control = fb.control(0);

      // And: an int value accessor
      final valueAccessor = IntValueAccessor();

      // When: register control
      valueAccessor.registerControl(control);

      // And: set control value:
      control.value = null;

      // Then: value is converted correctly
      expect(valueAccessor.modelToViewValue(control.value), '');
    });

    test('IntValueAccessor converts to null an empty string', () {
      // Given: a control
      final control = fb.control(0);

      // And: an int value accessor
      final valueAccessor = IntValueAccessor();

      // When: register control
      valueAccessor.registerControl(control);

      // And: update accessor model value:
      valueAccessor.updateModel('');

      // Then: value is converted correctly
      expect(control.value, null);
    });
  });
}
