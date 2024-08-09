// Type your code here, or load an example.
void addToArrayWrong()
{
    final names1 = ['Foo 1', 'Foo 2', 'Foo 3'];
    final names2 = ['Baz 1', 'Baz 2', 'Baz 3'];
    final allNamesWrong = names1;
    allNamesWrong.addAll(names2);
    print(names1);
    print(names2);
    print(allNamesWrong);
}

void addToArrayWright()
{
    final names1 = ['Foo 1', 'Foo 2', 'Foo 3'];
    final names2 = ['Baz 1', 'Baz 2', 'Baz 3'];
    final allNamesRight = {...names1, ...names2}; // spread operator copy
    print(names1);
    print(names2);
    print('Spread operator copy ${allNamesRight}');
    final allNamesAnotherWay = [...names1]..addAll(names2);
    print('Spread operator copy combined with addAll ${allNamesAnotherWay}');
}

class MyData {
  String value;
  
  MyData(this.value);
  
  // A method that creates a deep copy of the MyData instance.
  MyData clone() {
    return MyData(this.value);
  }
  
  void updateValue(String newValue) {
    value = newValue;
  }
}

void main(List<String> args) {
    addToArrayWrong();
    print('--------------------');
    addToArrayWright();

    print('--------------------');
    print('Unwanted reference update');
    var original = MyData('original');
    var anotherReference = original; // This does not copy the object, just the reference
    print(original.value); // Output: updated

    print('');
    anotherReference.updateValue('updated');

    print(original.value); // Output: updated
    print(anotherReference.value); // Output: updated

    print('--------------------');

    print('Deep copy update');
    var original_1 = MyData('original');
    //var anotherReference_1 = original_1.clone; // missing brackets will cause unwanted issues
    var anotherReference_1 = original_1.clone(); // This does not copy the object, just the reference
    print(original.value); // Output: updated

    print('After update');
    anotherReference.updateValue('updated');

    print(original_1.value); // Output: updated
    print(anotherReference_1.value); // Output: updated
}
