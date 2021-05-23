import 'package:easy/constants.dart';
import 'package:easy/screens/user_type/user_type_screen.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsConditionScreen extends StatefulWidget {
  @override
  _TermsConditionScreenState createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  bool rememberMe = true;

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = TextStyle(
        fontFamily: 'Comfortaa', fontSize: getProportionateScreenWidth(12));
    TextStyle linkStyle =
        TextStyle(color: kPrimaryColor, decoration: TextDecoration.underline);
    return ListView(
      children: [
        Text(
          'TERMINI E CONDIZIONI DI UTILIZZO',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Comfortaa',
            color: kTextLight,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        Column(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: _onRememberMeChanged,
              activeColor: kPrimaryColor,
            ),
            Text(
              'Dichiaro di aver letto l\'informativa sulla privacy e acconsento al trattamento dei miei dati personali per le finalità di erogazione del servizio e per l\'adempimento degli obblighi di legge',
              style: TextStyle(
                fontFamily: 'Comfortaa',
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(5),
            ),
            RichText(
              text: TextSpan(
                  text: 'INFORMATIVA SULLA PRIVACY',
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchInBrowser("https://sosfer.com/informativa-privacy");
                    }),
            ),
            /*Text(
              'INFORMATIVA SULLA PRIVACY',
              style: TextStyle(
                color: kPrimaryColor,
                decoration: TextDecoration.underline,
              ),
            ),*/
          ],
        ),
        Column(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: _onRememberMeChanged,
              activeColor: kPrimaryColor,
            ),
            Text(
              'Dichiaro di approvare ai sensi degli artt. 1341 – 1342 del Codice Civile Italiano i seguenti articoli delle condizioni generali di contratto: 2 (Corrispettivi, modalità di pagamento e conclusione del contratto); 3 (Attivazione e erogazione dei servizi);4 (Durata, rinnovo e cessazione dei Servizi oggetto del contratto); 7 (Modifiche ai termini e loro accettazione); 9 (Diritti di proprietà industriale e/o intellettuale); 10 (Obblighi, divieti e responsabilità del Cliente); 12 (Limitazioni della responsabilità di SOSFER); 14 (Clausola risolutiva espressa); 17 (Foro competente)',
              style: TextStyle(
                fontFamily: 'Comfortaa',
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(5),
            ),
            RichText(
              text: TextSpan(
                  text: 'CONDIZIONI GENERALI DI CONTRATTO',
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchInBrowser("https://sosfer.com/condizioni-generali-contratto");
                    }),
            )
            /*Text(
              'CONDIZIONI GENERALI DI CONTRATTO',
              style: TextStyle(
                color: kPrimaryColor,
                decoration: TextDecoration.underline,
              ),
            )*/,
          ],
        ),
        Column(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: _onRememberMeChanged,
              activeColor: kPrimaryColor,
            ),
            Text(
              'ACCONSENTO al trattamento dei miei dati personali per l\'invio tramite sms e/o e-mail di comunicazioni informative e promozionali inerenti l\'impianto o l\'associazione di prodotti che ne ottimizzano il suo rendimento, nonché newsletter da parte di SOSFER SRLS in relazione alle proprie iniziative',
              style: TextStyle(
                fontFamily: 'Comfortaa',
              ),
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenWidth(10),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, UserTypeScreen.routeName);
            },
            style: ElevatedButton.styleFrom(
              primary: kPrimaryColor,
            ),
            child: Text(
              'PROSEGUI',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: getProportionateScreenWidth(20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void launchUrl(String _url) async {
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  void _onRememberMeChanged(bool newValue) => setState(
        () {
          rememberMe = newValue;
          if (rememberMe) {
            // TODO: Here goes your functionality that remembers the user.
          } else {
            // TODO: Forget the user
          }
        },
      );
}
