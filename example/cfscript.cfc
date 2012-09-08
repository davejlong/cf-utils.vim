component {
  // TODO Write come code here
  public any function init(string arg="mystring") {
    var thisval = "This Value";
    Variables.somevar = Arguments.arg;
    
    if( Arguments.arg IS 'mystring' ) {
      Arguments.arg = '#thisval# mystring';
    } else if( Arguments.arg is true ) {
      Arguments.arg = false;
    return this;
  }

  public date function getCurrentTime() {
    return now();
  }







  /*
    I want to have as many functions as needed to test everything from the syntax
    TODO: add more code
    XXX
    TBD
  */
  /*
   * Hello
   TODO
   todo Hello World
  */








}
