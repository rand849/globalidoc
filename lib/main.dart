// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print, depend_on_referenced_packages, avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:camera/camera.dart';
import 'package:globalidoc/screen/camera.dart';
// import 'package:lottie/lottie.dart';

void main() {
  runApp(const GlobalIDoc());
}

class GlobalIDoc extends StatelessWidget {
  const GlobalIDoc({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
            children: const [
              Scaffold(
                backgroundColor: Colors.transparent,
                body: WelcomeWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
         body: 
        Stack(
          children:[
        Container(
          height: double.infinity,
          width:double.infinity,
          decoration:BoxDecoration( 
            image:DecorationImage(
            image:AssetImage('images/welcome.jpg'),
            fit: BoxFit.fill,
            ),
        ),),
               Container(
                     width: 125,
                      height:50,
                      margin: EdgeInsets.only(
                              left:130, right: 37, top: 200,),
                      decoration: BoxDecoration(
                           border: Border.all(
                            color: Colors.black,
                            width:2,
                           ),
                           borderRadius: BorderRadius.circular(40),
                           boxShadow: const [
                            BoxShadow(
                            blurRadius: 1,
                            color: Colors.white,
                            )]
                       ),
                        padding: const EdgeInsets.fromLTRB(12,11,0,0),
                      child: InkWell(
                        child: Text(
                          "Get Started ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SigninWidget()));   
                        },
                      ),
                      ),
          ]),
        );
      }
    );
  }
}

class SigninWidget extends StatefulWidget {
  const SigninWidget({Key? key}) : super(key: key);

  @override
  State<SigninWidget> createState() => _SigninWidgetState();
}

class _SigninWidgetState extends State<SigninWidget> {
  var IDnum;
  var Nationalty;
  var Town;
  var Doc;
  var Email;
  final TextEditingController textEditingController = TextEditingController();
  GlobalKey<FormFieldState> FormF =  GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> FormB =  GlobalKey<FormFieldState>();
  send() {
      var formdata = FormF.currentState;
      if (formdata!.validate()) {
        formdata.save();
        print("IDnum=$IDnum");
        print("Nationalty=$Nationalty");
      } else {
        print("not valid");
      }
    }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints) {
        return Scaffold(
          appBar: AppBar(
                  backgroundColor: Color.fromARGB(249, 133, 133, 133),
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                    size: 30,
                  ),
                ),
          drawer: SettingWidget(),
          body:
          SafeArea(
         child: Material(
        child: Stack(
          children: [
            Positioned(
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image(
                       image: AssetImage('images/background.jpg'),
                       fit: BoxFit.cover,
                        ))),
            SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(right:20),
                    width:300,
                      height:100,
                      child: Image(
                        image: AssetImage('images/logo.png'),
                        fit: BoxFit.fitWidth,
                      )),
                ),
            
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                  ),
                ),
                Form(
                  key: FormF,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              top: 5, bottom: 15, left: 35, right: 35),
                          child: TextFormField(
                            onSaved: (text) {
                              IDnum = text;
                            },
                            validator: (text) {
                              if (text!.length < 9) {
                                return "* must be more than 9 numbers";
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 15),
                            textInputAction: TextInputAction.next,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.number,
                            minLines: 1,
                            maxLines: 2,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.picture_in_picture),
                              prefixIconColor: (Colors.black),
                              labelText: "ID Number",
                              labelStyle:TextStyle(
                                color: Colors.black,
                              ),
                              hintText: "Not less than 9 numbers",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 109, 109, 109),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 2,
                                  )),
                            ),
                          )),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 109, 109, 109),
                        ),
                        padding:
                            EdgeInsets.only(bottom: 8, left: 5, right: 35),
                        margin: EdgeInsets.only(
                            left: 32, right: 37, top: 20, bottom: 10),
                        child:
                         DropdownSearch<String>(
                              popupProps: PopupProps.menu(
                              menuProps: MenuProps(
                                backgroundColor:Color.fromARGB(255, 151, 151, 151), 
                              ),
                              showSearchBox: true,
                              showSelectedItems: true,
                              ),
                         items: const [
                            "Afghanistan",
                            "Albania",
                            "Algeria",
                            "Andorra",
                            "Angola",
                            "Antigua & Barbuda",
                            "Argentina",
                            "Armenia",
                            "Australia",
                            "Austria",
                            "Azerbaijan",
                            "The Bahamas",
                            "Bahrin",
                            "Bangladesh",
                            "Barbados",
                            "Belarus",
                            "Belgium",
                            "Belize",
                            "Benin",
                            "Bhutan",
                            "Bolivia",
                            "Bosnia & Herzegovina",
                            "Botswana",
                            "Brazil",
                            "Brunei",
                            "Bulgaria",
                            "Burkina Faso",
                            "Burundi",
                            "Cambodia",
                            "Cameroon",
                            "Canada",
                            "Cape Verde ",
                            "Cape Verde ",
                            "Central African Republic ",
                            "Chad ",
                            "Chile",
                            "China",
                            "Colombia",
                            "Comoros",
                            "Republic of the Congo",
                            "Democratic Republic of the Congo ",
                            "Costa Rica",
                            "Cote d’Ivoire",
                            "Croatia",
                            "Cuba",
                            "Cyprus",
                            "Czech Republic",
                            "Denmark",
                            "Djibouti",
                            "Dominica",
                            "Dominican Republic",
                            "East Timor",
                            "Ecuador",
                            "Egypt",
                            "El Salvador",
                            "Equatorial Guinea",
                            "Eritrea",
                            "Estonia",
                            "Ethiopia",
                            "Fiji",
                            "Finland",
                            "France",
                            "Gabon",
                            "The Gambia",
                            "Georgia",
                            "Germany",
                            "Ghana",
                            "Greece",
                            "Grenada",
                            "Guatemala",
                            "Guinea",
                            "Guinea Bissau",
                            "Guyana",
                            "Haiti",
                            "Honduras",
                            "Hungary",
                            "Iceland",
                            "India",
                            "Indonesia",
                            "Iran",
                            "Iraq",
                            "Ireland",
                            "Italy",
                            "Jamaica",
                            "Japan",
                            "Jordan",
                            "Kazakhstan",
                            "Kenya",
                            "Kiribati",
                            "Korea",
                            "Kuwait",
                            "Kyrgyzstan",
                            "Laos",
                            "Latvia",
                            "Lebanon",
                            "Lesotho",
                            "Liberia",
                            "Libya",
                            "Liechtenstein",
                            "Lithuania",
                            "Luxembourg",
                            "Macedonia",
                            "Madagascar",
                            "Malawi",
                            "Malaysia",
                            "Maldives",
                            "Mali",
                            "Malta",
                            "Marshall Islands",
                             "Mauritania",
                            "Mauritius",
                            "Mexico",
                            "Federated States of Micronesia",
                            "Moldova",
                            "Monaco",
                            "Mongolia",
                            "Montenegro",
                            "Morocco",
                            "Mozambique",
                            "Myanmar (Burma)",
                            "Namibia",
                            "Nauru",
                            "Nepal",
                            "Netherlands",
                            "New Zealand",
                            "Nicaragua",
                            "Niger",
                            "Nigeria",
                            "Norway",
                            "Oman",
                            "Pakistan",
                            "Palau",
                            "Palestine",
                            "Panama",
                            "Papua New Guinea",
                            "Paraguay",
                            "Peru",
                            "Philippines",
                            "Poland",
                            "Portugal",
                            "Qatar",
                            "Romania",
                            "Russia",
                            "Rwanda",
                            "Saint Kitts and Nevis",
                            "Saint Lucia",
                            "Saint Vincent and the Grenadines",
                            "Samoa",
                            "San Marino",
                            "Sao Tome and Principe",
                            "Saudi Arabia",
                            "Senegal",
                            "Serbia",
                            "Seychelles",
                            "Sierra Leone",
                            "Singapore",
                            "Slovakia",
                            "Slovenia",
                            "Solomon Islands",
                            "Somalia",
                            "South Africa",
                            "Spain",
                            "Sri Lanka",
                            "Sudan",
                            "Suriname",
                            "Swaziland",
                            "Sweden",
                            "Switzerland",
                            "Syria",
                            "Tajikistan",
                            "Tanzania",
                            "Thailand",
                            "Togo",
                            "Tonga",
                            "Trinidad and Tobago",
                            "Tunisia",
                            "Turkey",
                            "Turkmenistan",
                            "Tuvalu",
                            "Uganda",
                            "Ukraine",
                            "United Arab Emirates",
                            "United Kingdom",
                            "United States",
                            "Uruguay",
                            "Uzbekistan",
                            "Vanuatu",
                            "Vatican City (Holy Seed)",
                            "Venezuela",
                            "Vietnam",
                            "Yemen",
                            "Zambia",
                            "Zimbabwe",
                                ],
                              dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  focusColor:Colors.black ,
                                  enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                  fillColor: Color.fromARGB(255, 109, 109, 109),
                                  prefixIcon: Icon(Icons.flag),
                                  prefixIconColor: (Colors.black),
                                  labelText: "Nationalty",
                                  labelStyle:TextStyle(
                                    color: Colors.black,
                                  ),
                                  hintText: "HomeTown Country",
                              ),
                              
                            ),
                            
                              onChanged: (val) {
                              print(val);
                              setState(() {
                                Town = val;
                              });
                            },
                        ),
                              ),
                    ]
                                        
                        ),),
                  Form(
                        key: FormB,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: 35, left: 35, right: 35),
                              child: TextFormField(
                                onSaved: (text) {
                                  Email = text;
                                },
                                style: TextStyle(fontSize: 15),
                                textInputAction: TextInputAction.next,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.emailAddress,
                                minLines: 1,
                                maxLines: 2,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  prefixIconColor: (Colors.black),
                                  labelText: "Email Address",
                                  labelStyle:TextStyle(
                                  color: Colors.black,
                                  ), 
                                  hintText: "@gmail.com",
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                  filled: true,
                                  fillColor:
                                     Color.fromARGB(255, 109, 109, 109),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 2,
                                      )),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:Color.fromARGB(255, 109, 109, 109),
                              ),
                              padding: EdgeInsets.only(
                                  bottom: 8, left: 20, right: 10),
                              margin: EdgeInsets.only(
                                top: 35,
                                left: 35,
                                right: 35,
                              ),
                              child: DropdownButton(
                                
                                borderRadius: BorderRadius.circular(8),
                                underline:
                                    Divider(color: Colors.transparent),
                                dropdownColor:
                                    Color.fromARGB(255, 109, 109, 109),
                                iconSize: 40,
                                isExpanded: true,
                                hint: Text(
                                  "Document Type ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  textDirection: TextDirection.ltr,
                                ),
                                items: [
                                  "High School Diploma",
                                  "Middle School Diploma",
                                ]
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ))
                                    .toList(),
                                      onChanged: (val) {
                            print("changed");
                            setState(() {
                              Doc = val.toString();
                            });
                            },
                                value: Doc,
                              ),
                            ),
                          ],
                        ),
                      ),
                Container(
                  width: 130,
                  height: 80,
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                           border: Border.all(
                            color: Colors.black,
                            width:2,
                           ),
                           borderRadius: BorderRadius.circular(20),
                           boxShadow: const [
                            BoxShadow(
                            blurRadius: 1,
                            color: Color.fromARGB(255, 114, 114, 114),
                            )]
                       ),
                        alignment: Alignment.center,
                        // ignore: sort_child_properties_last
                        child: Text(
                          "Sign in ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        width: 100,
                        height: 50,
                      ),
                    ),
                    onTap: () {
                      // send();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PayWidget()));
                        print("object");
                    },
                  ),
                ),
              ],
            ),
        ),]))));
      }
    );
  }
}

class SettingWidget extends StatefulWidget {
  const SettingWidget ({Key? key}) : super(key: key);

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}
class _SettingWidgetState extends State<SettingWidget>{
  var Language;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 263,
          height: double.infinity,
          color: Color(0xBEC5C5C5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 24,
                    height: 19,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 22.40),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF4D4D4D),
                ),
                margin: EdgeInsets.only(
                  top: 35,
                  left: 25,
                  right: 15,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(8),
                    underline: Divider(color: Colors.transparent),
                    dropdownColor: Color(0xFF4D4D4D),
                    iconSize: 30,
                    isExpanded: true,
                    hint: Text("Choose Language "),
                    items: ["English", "العربية"]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                        onChanged: (val) {
                                print("changed");
                                setState(() {
                                Language = val.toString();
                                });
                              },
                    
                    value: Language,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PayWidget extends StatefulWidget {
  const PayWidget({super.key});


  @override
  State<PayWidget> createState() => _PayWidgetState();
}

class _PayWidgetState extends State<PayWidget> {
 var Credit;
 var Month;
 var year;

  GlobalKey<FormFieldState> FormA =  GlobalKey<FormFieldState>();

   send() {
      var formdata = FormA.currentState;
      if (formdata!.validate()) {
        formdata.save();
        print("IDnum=$Credit");
      
      } else {
        print("not valid");
      }
    }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Stack(
          children: [
            Positioned(
                          child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Image(
                              image: AssetImage('images/background.jpg'),
                              fit: BoxFit.cover,
                            )),
                      )),
            SingleChildScrollView(
              child: Column(
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.only(top:70,left: 10),
                    child: 
                     Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                      width: 300,
                      height: 60,
                      child: Text(
                        " Payment Method :",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                  ),
                  
                  Form(
                    key: FormA,
                    child: Column(
                      children: [
                       
                        Padding(
                          padding:const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 109, 109, 109),
                                ),
                                 padding: EdgeInsets.only(left: 20),
                                       margin: EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                      //   right: 180,
                                       ),
                                child: DropdownButton(
                                  
                                  borderRadius: BorderRadius.circular(8),
                                  underline: Divider(color: Colors.transparent),
                                  dropdownColor: Color.fromARGB(255, 109, 109, 109),
                                  iconSize: 40,
                                
                                  hint: Text(
                                    "Type ",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16,
                                    ),
                                    textDirection: TextDirection.ltr,
                                  ),
                                  items: [
                                    "VisaCard",
                                    "MasterCard",
                                    "American Express"
                                  ].map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          ))
                                      .toList(),
                                      onChanged: (val) {
                              print("changed");
                              setState(() {
                               Credit = val.toString();
                              });
                            },
                                 
                                  value: Credit,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                   padding: EdgeInsets.only(left: 20,top: 10,),
                                       margin: EdgeInsets.only(
                                      //   top: 35,
                                        left: 10,
                                        right: 10,
                                        top:5,
                                       ),
                                  child: TextFormField(
                                    onSaved: (text) {
                                      Credit = text!;
                                    },
                                    
                                    style: TextStyle(fontSize: 15),
                                    textInputAction: TextInputAction.next,
                                    textAlign: TextAlign.left,
                                    keyboardType: TextInputType.number,
                                    minLines: 1,
                                    maxLines: 2,
                                    decoration: InputDecoration(
                                      
                                      hintText: "CVC Code",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      filled: true,
                                      fillColor: Color.fromARGB(255, 109, 109, 109),
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 2,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        Container(
                          padding: EdgeInsets.only(top: 25, left: 35, right: 35),
                          child: TextFormField(
                            onSaved: (text) {
                              Credit = text!;
                            },
                            style: TextStyle(fontSize: 15),
                            textInputAction: TextInputAction.next,
                            textAlign: TextAlign.left,
                            minLines: 1,
                            maxLines: 2,
                            decoration: InputDecoration(
                              hintText: "Card Holder Name",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 109, 109, 109),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 2,
                                  )),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 35, left: 35, right: 35),
                            child: TextFormField(
                              onSaved: (text) {
                                Credit = text!;
                              },
                              style: TextStyle(fontSize: 15),
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.number,
                              minLines: 1,
                              maxLines: 2,
                              decoration: InputDecoration(
                                hintText: "Credit Card Code",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(255, 109, 109, 109),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 2,
                                    )),
                              ),
                            )),
                            Padding(
                              padding: const EdgeInsets.only(top:25,left: 15),
                              child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: 200,
                      height: 60,
                      child: Text(
                        " Expiration Date :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                            ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                          child: Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8,left: 8, right: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color.fromARGB(255, 109, 109, 109),
                                      ),
                                       padding: EdgeInsets.only(left: 20),
                                       margin: EdgeInsets.only(
                                      //   top: 35,
                                        left: 10,
                                      //   right: 180,
                                       ),
                                      child: DropdownButton(
                                        borderRadius: BorderRadius.circular(8),
                                        underline: Divider(color: Colors.transparent),
                                        dropdownColor: Color.fromARGB(255, 109, 109, 109),
                                        iconSize: 40,
                                        isExpanded: true,
                                        hint: Text(
                                          "Month ",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 14,
                                          ),
                                          textDirection: TextDirection.ltr,
                                        ),
                                        items: [
                                          "January",
                                          "February",
                                          "March",
                                          "April",
                                          "May",
                                          "June",
                                          "July",
                                          "August",
                                          "September",
                                          "October",
                                          "November",
                                          "December"
                                        ]
                                            .map((e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e),
                                                ))
                                            .toList(),
                                        
                                        onChanged: (val) {
                              print("changed");
                              setState(() {
                                Month = val.toString();
                              });
                            },
                                        value: Month,
                                      ),
                                    ),
                                  ),
                                ),
                                 Expanded(
                                   child: Padding(
                                     padding: const EdgeInsets.only(bottom: 8,left: 8, right: 8),
                                     child: Container(
                                       decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromARGB(255, 109, 109, 109),
                                       ),
                                       padding: EdgeInsets.only(
                                      left: 20,
                                       ),
                                       margin: EdgeInsets.only(
                                        left: 10),
                                       child: DropdownButton(
                                      borderRadius: BorderRadius.circular(8),
                                      underline: Divider(color: Colors.transparent),
                                      dropdownColor: Color.fromARGB(255, 109, 109, 109),
                                      iconSize: 40,
                                      isExpanded: true,
                                      hint: Text(
                                        "Year ",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 16,
                                        ),
                                        textDirection: TextDirection.ltr,
                                      ),
                                      items: [
                                        "2023",
                                        "2024",
                                        "2025",
                                        "2026",
                                        "2027",
                                        "2028",
                                      ]
                                          .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(e),
                                              ))
                                          .toList(),
                                          onChanged: (val) {
                              print("changed");
                              setState(() {
                                year = val.toString();
                              });
                            },
                                      value: year,
                                       ),
                                     ),
                                   ),
                                 ),
                              ],
                            ),
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                  Container(
                    margin:EdgeInsets.only(top:18),
                    width: 125,
                    height: 50,
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                           border: Border.all(
                            color: Colors.black,
                            width:2,
                           ),
                           borderRadius: BorderRadius.circular(20),
                           boxShadow: const [
                            BoxShadow(
                            blurRadius: 1,
                            color: Color.fromARGB(255, 114, 114, 114),
                            )]
                       ),
                        alignment: Alignment.center,
                        // ignore: sort_child_properties_last
                        child: Text(
                          "Next ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        width: 100,
                        height: 50,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotifiyCameraWidget()));
                        print("object");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotifiyCameraWidget extends StatelessWidget {
  const NotifiyCameraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
         body: 
        Stack(
          children:[
        Container(
          height: double.infinity,
          width:double.infinity,
          decoration:BoxDecoration( image:DecorationImage(
            image:AssetImage('images/background.jpg'),
            fit: BoxFit.fill,
            ),
        ),),   
               Container(
                height: 300,
                width:300,
                margin: EdgeInsets.only(top:200,left:25),
                child:Text( 
                  "\nPlease take a picture \nto verify your identity,\n                                            We appreciate your \npatience.",
                  style:TextStyle(
                    fontStyle:FontStyle.italic,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                )
               ),
               Container(
                     width:190,
                      height: 90,
                      margin: EdgeInsets.only(
                              left:150, right: 37, top: 380, bottom: 10),
                      child:Padding(
                        padding: const EdgeInsets.all(5),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10,20,0,0),
                          child: Container(
                            decoration: BoxDecoration(
                           border: Border.all(
                            color: Colors.black,
                            width:2,
                           ),
                           borderRadius: BorderRadius.circular(20),
                           boxShadow: const [
                            BoxShadow(
                            blurRadius: 1,
                            color: Color.fromARGB(255, 114, 114, 114),
                            )]
                       ),
                            alignment: Alignment.center,
                            // ignore: sort_child_properties_last
                            child: 
                            Text(
                              "Open Camera",
                              style: TextStyle(
                                fontWeight:FontWeight.w500,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ), 
                        ),
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CameraWidget()));
                        },
                      ),
                      ),
        ),
          ]),
        );
      }
    );
  }
}


class CameraWidget extends StatefulWidget {
  const CameraWidget ({Key? key}) : super(key: key);
  
  @override
  State<CameraWidget> createState() =>_CameraWidgetState();
}
class _CameraWidgetState extends State<CameraWidget>{
  late List<CameraDescription> cameras;
  CameraController? cameraController;
   int direction=0;

  @override
  void initState(){
    startCamera(0);
    super.initState();
  }
  void startCamera(int direction) async{
    cameras=await availableCameras();

    cameraController=CameraController(
      cameras[direction],
      ResolutionPreset.max,
      enableAudio: false,
      );
    cameraController?.initialize().then((_){
      if(!mounted){
        return;
      }
     setState((){}); 
    }
    ).catchError((Object e){
      if(e is CameraException){
        switch(e.code){
          case'CameraAccessDenied':
          print("Access was denied");
          break;
          default:
          print(e.description);
          break;
        }
      }
    });
  }

  @override
  
  void dispose(){
    cameraController?.dispose();
    super.dispose();
  }
  @override
  
  Widget build(BuildContext context) {
     return Scaffold(
      body:Stack(
        children: [
          Container(
            height:double.infinity,
            child:CameraPreview(cameraController!)
          ),
          Align(
            alignment:AlignmentDirectional.bottomCenter,
            child: RawMaterialButton(onPressed: () async{
              if(cameraController!.value.isInitialized){
                 return null ;
              }
              if(cameraController!.value.isTakingPicture){
                return null;
              }
              
              try {
                await cameraController?.setFlashMode(FlashMode.auto);
                XFile file = await cameraController!.takePicture();
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                   builder: (context)=>ImagePreview(file))
                   );
              } 
              on CameraException catch (e) {
                debugPrint("Error occured while taking picture:$e");
                return ;
              }
            },
            child:
              button( Icons.camera_alt_outlined, Alignment.bottomCenter)
            ),
          ),
           GestureDetector(
            onTap:(){
              setState(() {
                direction = direction == 0 ? 1: 0;
                startCamera(direction);
              });

            },
            child:
              button3( Icons.flip_camera_ios_outlined, Alignment.bottomLeft)
            ),
        ],
      )
     );
    }
   } 
    Widget button(IconData icon ,Alignment alignment){
      return  Align(
            alignment: alignment,
            child:Container(
              margin: const EdgeInsets.only(
                left:20,bottom: 20,
              ),
              width:75,
              height:75,
              decoration: const BoxDecoration(
                shape:BoxShape.circle,
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color:Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 10,
                  )
                ]
              ),
              child: Center(
                child: Icon(
                Icons.camera_alt_outlined,
                color:const Color.fromARGB(255, 0, 0, 0),
              ),)
            )
           );
    }
       Widget button3(IconData icon ,Alignment alignment){
      return  Align(
            alignment: alignment,
            child:Container(
              margin: const EdgeInsets.only(
                left:20,bottom: 20,
              ),
              width:75,
              height:75,
              decoration: const BoxDecoration(
                shape:BoxShape.circle,
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color:Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 10,
                  )
                ]
              ),
              child: Center(
                child: Icon(
                Icons.flip_camera_ios_outlined,
                color:const Color.fromARGB(255, 0, 0, 0),
              ),)
            )
           );
    }

class NotifiySignatureWidget extends StatelessWidget {
  const NotifiySignatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
         body: 
        Stack(
          children:[
           
        Container(
          height: double.infinity,
          width:double.infinity,
          decoration:BoxDecoration( image:DecorationImage(
            image:AssetImage('images/background.jpg'),
            fit: BoxFit.fill,
            ),
        ),),   
                // Container(
                //   height:400,
                //   width:400,
                //   child: Lottie.network("https://lottiefiles.com/99614-signature"),
                // ),
               Container(
                height: 300,
                width:300,
                margin: EdgeInsets.only(top:200,left:25),
                child:Text( 
                  "Write your Signature in the air.",
                  style:TextStyle(
                    fontStyle:FontStyle.italic,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                )
               ),
               Container(
                     width: 200,
                      height: 90,
                      margin: EdgeInsets.only(
                              left:190, right: 37, top: 370, bottom: 10),
                      child:Padding(
                        padding: const EdgeInsets.fromLTRB(10,20,0,0),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10,20,0,0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 109, 109, 109),
                            ),
                            alignment: Alignment.center,
                            // ignore: sort_child_properties_last
                            child: 
                            Text(
                              "Open Camera",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ), 
                        ),
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignatureWidget()));
                        },
                      ),
                      ),
        ),
          ]),
        );
      }
    );
  }
}

class SignatureWidget extends StatefulWidget {
  const SignatureWidget ({Key? key}) : super(key: key);
  
  @override
  // ignore: library_private_types_in_public_api
  _SignatureWidgetState createState() =>_SignatureWidgetState();
}
class _SignatureWidgetState extends State<SignatureWidget>{
  late List<CameraDescription> cameras;
  late CameraController cameraController;
   int direction=1;
   
  @override
  void initState(){
    startCamera(1);
    super.initState();
  }

  void startCamera(int direction) async{
    cameras=await availableCameras();
  

  void initState(){
    cameraController.initialize();
    super.initState();
  }

    cameraController=CameraController(
      cameras[direction],
      ResolutionPreset.max,
      enableAudio: false,
      );
    cameraController.initialize().then((value){
      if(!mounted){
        return;
      }
     setState((){}); 
    }
    ).catchError((Object e){
      if(e is CameraException){
        switch(e.code){
          case'CameraAccessDenied':
          print("Access was denied");
          break;
          default:
          print(e.description);
          break;
        }
      }
    });
  }

  @override

  void dispose(){
    cameraController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body:Stack(
        children: [
          Container(
            height:double.infinity,
            child:CameraPreview(cameraController)
          ),
          Align(
            alignment:AlignmentDirectional.bottomCenter,
            child: RawMaterialButton(onPressed: () async{
              if(!cameraController.value.isInitialized){
                 return null;
              }
              if(cameraController.value.isTakingPicture){
                return null;
              }
              
              try {
                await cameraController.setFlashMode(FlashMode.off);
                XFile file = await cameraController.takePicture();
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                   builder: (context)=>ImagePreview(file))
                   );
              } 
              on CameraException catch (e) {
                debugPrint("Error occured while taking picture:$e");
                return null;
              }
            },
            child:
              button2( Icons.check_circle_outline, Alignment.bottomCenter)
            ),
          ),
        ],
      )
     );
    }
   } 
    Widget button2(IconData icon ,Alignment alignment){
      return  Align(
            alignment: alignment,
            child:Container(
              margin: const EdgeInsets.only(
                left:20,bottom: 20,
              ),
              width:75,
              height:75,
              decoration: const BoxDecoration(
                shape:BoxShape.circle,
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color:Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 10,
                  )
                ]
              ),
              child: Center(
                child: Icon(
                Icons.check_circle_outline,
                color:const Color.fromARGB(255, 0, 0, 0),
              ),)
            )
           );
    }

class FinalWidget extends StatelessWidget {
  const FinalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
         body: 
        Stack(
          children:[
        Container(
          height: double.infinity,
          width:double.infinity,
          decoration:BoxDecoration( image:DecorationImage(
            image:AssetImage('images/background.jpg'),
            fit: BoxFit.fill,
            ),
        ),),   
               Container(
                height: 300,
                width:300,
                margin: EdgeInsets.only(top:210,left:25),
                child:Text(
                  "Thanks for reaching out.\n                                           You will get notified\nwhen your document is ready.",
                  style:TextStyle(
                    fontStyle:FontStyle.italic,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                )
               ),
          ]),
        );
      }
    );
  }
}


