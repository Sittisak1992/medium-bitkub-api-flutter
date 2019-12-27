import 'package:crypto/crypto.dart';
import 'dart:convert' as convert;
class CoinSecurity {

  String coinHmacSign(var timestamp, String apiSecret) {
    try {
      var timestampEncode = convert.utf8.encode(convert.jsonEncode(timestamp));
      var secretEncode = convert.utf8.encode(apiSecret);

      var hmacSha256 = new Hmac(sha256, secretEncode); // HMAC-SHA256
      var digest = hmacSha256.convert(timestampEncode);
      return digest.toString();
    } catch (e) {
      print('$e');
      throw e;
    }
  }
}
