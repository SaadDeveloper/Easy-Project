class Utils{

  static bool isValidEmail(String email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  static String validate(String cf) {
    cf = normalize(cf);
    if( cf.length == 0 )
      return "Questo campo è obbligatorio";
    else if( cf.length == 16 )
      return validate_regular(cf);
    else if( cf.length == 11 )
      return validate_temporary(cf);
    else
      return "IMPORTANTE! Il Codice Fiscale deve coincidere con l'operatore presente all'interno del portale GSE";
  }

  static String normalize(String cf) {
    cf = cf.replaceAll("[ \t\r\n]", "");
    cf = cf.toUpperCase();
    return cf;
  }

  static String format(String cf) {
    return normalize(cf);
  }

  static String validate_regular(String cf) {

    if(!RegExp('^[0-9A-Z]{16}\$').hasMatch(cf))
      return "Caratteri non validi";
    /*int s = 0;
    String even_map = "BAFHJNPRTVCESULDGIMOQKWZYX";
    for(int i = 0; i < 15; i++){
      int c = int.parse(cf[i]);
      int n;
      if( (0 <= c) && c <= 9 )
        n = c - 0;
      else
        n = c - 'A';
      if( (i & 1) == 0 )
        n = even_map.charAt(n) - 'A';
      s += n;
    }
    if( s%26 + 'A' != cf.charAt(15) )
      return "CODICE FISCALE non valido";*/
    return null;
  }

  static String validate_temporary(String cf) {
    if(!RegExp("^[0-9]{11}\$").hasMatch(cf) )
      return "Caratteri non validi";
    int s = 0;
    for(int i = 0; i < 11; i++){
      int n = int.parse(cf[i]) - 0;
      if( (i & 1) == 1 ){
        n *= 2;
        if( n > 9 )
          n -= 9;
      }
      s += n;
    }
    if( s % 10 != 0 )
      return "CODICE FISCALE non valido";
    return null;
  }
}