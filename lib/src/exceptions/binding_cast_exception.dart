import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms/src/exceptions/reactive_forms_exception.dart';

/// Represents an exception that is thrown when trying to bound a widget that is
/// expecting a specific data type, to a control with a different data type.
class BindingCastException<T> extends ReactiveFormsException {
  final ReactiveFormField<T> field;
  final FormControl<dynamic> control;

  /// Constructs the instance of the exception.
  ///
  /// The Arguments [field] and [control] must not be null.
  BindingCastException(this.field, this.control)
      : assert(field != null),
        assert(control != null);

  @override
  String toString() {
    return '''BindingCastException: The widget ${this.field.runtimeType} bound to "${this.field.formControlName}" control
    is expecting a "FormControl<$T>" data type, 
    but received a "${control.runtimeType}" data type.
    
    This is caused because the template data type declared in the widget "${this.field.runtimeType}"
    is not a 'subtype' of the template data type declared in the control "${control.runtimeType}".
    
    To fix the error:
    
    1- Explicitly set the data type of the control in its declaration. 
      
    Example: 
    { '${this.field.formControlName}': FormControl<$T>(), }
    
    2- If you are using the syntax: "{ '${this.field.formControlName}': [], }"
    Then you should initialize the control with a default value (not-null) or use "fb.control"
    to explicitly set a data type.
    
    Examples:
    1. Set a not-null default value
    { 'control': [''], } // the control is implicitly set to 'String' data type.
    
    2. Set a not-null default value with "fb.control"
    { 'control': fb.control(''), } // the control is implicitly set to 'String' data type.
    
    3. Set explicitly data type with "fb.control"
    { 'control': fb.control<String>(null), } // the control is explicitly set to 'String' data type.
    
    ''';
  }
}
