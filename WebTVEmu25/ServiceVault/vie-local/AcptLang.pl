splitq("$ENV{QUERY_STRING}&$ENV{CONTENT}");

if($qrs{'lang'}){

print "500 Accept Language is set.  Check sends debug to see if it worked.\n";
if($qrs{'country'}){
print "wtv-country: $qrs{'country'}\n";
}
print "wtv-expire-all: wtv-debug\n";
print "wtv-language-header: $qrs{'lang'}\n";
print "Content-type: text/html\n";
print "Content-length: 0\n\n";




}else{

$tosendout=<<"ERIC"

<html>
<head>
<title> Accept Language Header </title>
<script>
function Buffet(){
A=document.forms[0].elements[3].options[document.forms[0].elements[3].selectedIndex].value
B=document.forms[0].elements[4].options[document.forms[0].elements[4].selectedIndex].value


document.forms[0].elements[0].value=B;
document.forms[0].elements[1].value=A+"-"+B+","+A;

}
</script>
</head>
<body bgcolor="#000033" text="#999999">
<center>
<h1>Accept Language Header</h1>
</center>
<p>
At times servers look for a language header to access the server, especialy Japan.  This tool enables you to change the language the viewer uses.<p>
Setup Header:<p>
<form>
<table>
<tr><td>wtv-country:&nbsp;</td><td><input bgcolor="#000033" border=0 name="country" text="#999999" value="US"></td></tr>
<tr><td>wtv-language-header:&nbsp;</td><td><input border=0 bgcolor="#000033" name="lang" text="#999999" value="en-US,en"></td></tr>
<tr><td></td><td><input value="Setup" type="submit"></td></tr>
</table>
<p>
<h3>Examples</h3><p>
Accept-Language: Language-Country,Language<p>
<h4>Language</h4>
<select onChange="Buffet()">
<option value="af">af: Afrikaans</option>
<option value="sq">sq: Albanian  </option>
<option value="ar">ar: Arabic</option>
<option value="eu">eu: Basqu</option>
<option value="bg">bg: Bulgarian  </option>
<option value="be">be: Belarusian</option>
<option value="ca">ca: Catalan  </option>
<option value="zh">zh: Chinese</option>
<option value="hr">hr: Croatian</option>
<option value="cs">cs: Czech  </option>
<option value="da">da: Danish</option>
<option value="nl">nl: Dutch  </option>
<option value="en" selected>en: English  </option>
<option value="et">et: Estonian  </option>
<option value="fo">fo: Faeroese</option>
<option value="fa">fa: Farsi  </option>
<option value="fi">fi: Finnish</option>
<option value="fr">fr: French </option>
<option value="gd">gd: Gaelic</option>
<option value="de">de: German</option>
<option value="el">el: Greek  </option>
<option value="he">he: Hebrew</option>
<option value="hi">hi: Hindi  </option>
<option value="hu">hu: Hungarian</option>
<option value="is">is: Icelandic  </option>
<option value="in">in: Indonesian</option>
<option value="it">it: Italian  </option>
<option value="ja">ja: Japanese  </option>
<option value="ko">ko: Korean</option>
<option value="ko">ko: Korean  </option>
<option value="lv">lv: Latvian</option>
<option value="lt">lt: Lithuanian  </option>
<option value="mk">mk: Macedonian</option>
<option value="ms">ms: Malaysian  </option>
<option value="mt">mt: Maltese</option>
<option value="no">no: Norwegian  </option>
<option value="pl">pl: Polish  </option>
<option value="pt">pt: Portuguese  </option>
<option value="rm">rm: Rhaeto-Romanic</option>
<option value="ro">ro: Romanian  </option>
<option value="ru">ru: Russian  </option>
<option value="sz">sz: Sami </option>
<option value="sr">sr: Serbian</option>
<option value="sk">sk: Slovak</option>
<option value="sl">sl: Slovenian  </option>
<option value="sb">sb: Sorbian</option>
<option value="es">es: Spanish  </option>
<option value="sx">sx: Sutu  </option>
<option value="sv">sv: Swedish </option>
<option value="th">th: Thai</option>
<option value="ts">ts: Tsonga  </option>
<option value="tn">tn: Tswana</option>
<option value="tr">tr: Turkish  </option>
<option value="uk">uk: Ukrainian</option>
<option value="ur">ur: Urdu  </option>
<option value="ve">ve: Venda</option>
<option value="vi">vi: Vietnamese  </option>
<option value="xh">xh: Xhosa</option>
<option value="ji">ji: Yiddish  </option>
<option value="zu">zu: Zulu  </option>
</select>





<h4>Country</h4>
<select onChange="Buffet()">
<option value="AD">AD: Andorra</option>
<option value="AE">AE: United Arab Emirates</option>
<option value="AF">AF: Afghanistan</option>
<option value="AG">AG: Antigua and Barbuda</option>
<option value="AI">AI: Anguilla</option>
<option value="AL">AL: Albania</option>
<option value="AM">AM: Armenia</option>
<option value="AN">AN: Netherlands Antilles</option>
<option value="AO">AO: Angola</option>
<option value="AQ">AQ: Antarctica</option>
<option value="AR">AR: Argentina</option>
<option value="AS">AS: American Samoa</option>
<option value="AT">AT: Austria</option>
<option value="AU">AU: Australia</option>
<option value="AW">AW: Aruba</option>
<option value="AZ">AZ: Azerbaijan</option>
<option value="BA">BA: Bosnia and Herzegovina</option>
<option value="BB">BB: Barbados</option>
<option value="BD">BD: Bangladesh</option>
<option value="BE">BE: Belgium</option>
<option value="BF">BF: Burkina Faso</option>
<option value="BG">BG: Bulgaria</option>
<option value="BH">BH: Bahrain</option>
<option value="BI">BI: Burundi</option>
<option value="BJ">BJ: Benin</option>
<option value="BM">BM: Bermuda</option>
<option value="BN">BN: Brunei Darussalam</option>
<option value="BO">BO: Bolivia</option>
<option value="BR">BR: Brazil</option>
<option value="BS">BS: Bahamas</option>
<option value="BT">BT: Bhutan</option>
<option value="BV">BV: Bouvet Island</option>
<option value="BW">BW: Botswana</option>
<option value="BY">BY: Belarus</option>
<option value="BZ">BZ: Belize</option>
<option value="CA">CA: Canada</option>
<option value="CC">CC: Cocos (Keeling) Islands</option>
<option value="CF">CF: Central African Republic</option>
<option value="CG">CG: Congo</option>
<option value="CH">CH: Switzerland</option>
<option value="CI">CI: Cote D'Ivoire (Ivory Coast)</option>
<option value="CK">CK: Cook Islands</option>
<option value="CL">CL: Chile</option>
<option value="CM">CM: Cameroon</option>
<option value="CN">CN: China</option>
<option value="CO">CO: Colombia</option>
<option value="CR">CR: Costa Rica</option>
<option value="CS">CS: Czechoslovakia (former)</option>
<option value="CU">CU: Cuba</option>
<option value="CV">CV: Cape Verde</option>
<option value="CX">CX: Christmas Island</option>
<option value="CY">CY: Cyprus</option>
<option value="CZ">CZ: Czech Republic</option>
<option value="DE">DE: Germany</option>
<option value="DJ">DJ: Djibouti</option>
<option value="DK">DK: Denmark</option>
<option value="DM">DM: Dominica</option>
<option value="DO">DO: Dominican Republic</option>
<option value="DZ">DZ: Algeria</option>
<option value="EC">EC: Ecuador</option>
<option value="EE">EE: Estonia</option>
<option value="EG">EG: Egypt</option>
<option value="EH">EH: Western Sahara</option>
<option value="ER">ER: Eritrea</option>
<option value="ES">ES: Spain</option>
<option value="ET">ET: Ethiopia</option>
<option value="FI">FI: Finland</option>
<option value="FJ">FJ: Fiji</option>
<option value="FK">FK: Falkland Islands (Malvinas)</option>
<option value="FM">FM: Micronesia</option>
<option value="FO">FO: Faroe Islands</option>
<option value="FR">FR: France</option>
<option value="FX">FX: France, Metropolitan</option>
<option value="GA">GA: Gabon</option>
<option value="GB">GB: Great Britain (UK)</option>
<option value="GD">GD: Grenada</option>
<option value="GE">GE: Georgia</option>
<option value="GF">GF: French Guiana</option>
<option value="GH">GH: Ghana</option>
<option value="GI">GI: Gibraltar</option>
<option value="GL">GL: Greenland</option>
<option value="GM">GM: Gambia</option>
<option value="GN">GN: Guinea</option>
<option value="GP">GP: Guadeloupe</option>
<option value="GQ">GQ: Equatorial Guinea</option>
<option value="GR">GR: Greece</option>
<option value="GS">GS: S. Georgia and S. Sandwich Isls.</option>
<option value="GT">GT: Guatemala</option>
<option value="GU">GU: Guam</option>
<option value="GW">GW: Guinea-Bissau</option>
<option value="GY">GY: Guyana</option>
<option value="HK">HK: Hong Kong</option>
<option value="HM">HM: Heard and McDonald Islands</option>
<option value="HN">HN: Honduras</option>
<option value="HR">HR: Croatia (Hrvatska)</option>
<option value="HT">HT: Haiti</option>
<option value="HU">HU: Hungary</option>
<option value="ID">ID: Indonesia</option>
<option value="IE">IE: Ireland</option>
<option value="IL">IL: Israel</option>
<option value="IN">IN: India</option>
<option value="IO">IO: British Indian Ocean Territory</option>
<option value="IQ">IQ: Iraq</option>
<option value="IR">IR: Iran</option>
<option value="IS">IS: Iceland</option>
<option value="IT">IT: Italy</option>
<option value="JM">JM: Jamaica</option>
<option value="JO">JO: Jordan</option>
<option value="JP">JP: Japan</option>
<option value="KE">KE: Kenya</option>
<option value="KG">KG: Kyrgyzstan</option>
<option value="KH">KH: Cambodia</option>
<option value="KI">KI: Kiribati</option>
<option value="KM">KM: Comoros</option>
<option value="KN">KN: Saint Kitts and Nevis</option>
<option value="KP">KP: Korea (North)</option>
<option value="KR">KR: Korea (South)</option>
<option value="KW">KW: Kuwait</option>
<option value="KY">KY: Cayman Islands</option>
<option value="KZ">KZ: Kazakhstan</option>
<option value="LA">LA: Laos</option>
<option value="LB">LB: Lebanon</option>
<option value="LC">LC: Saint Lucia</option>
<option value="LI">LI: Liechtenstein</option>
<option value="LK">LK: Sri Lanka</option>
<option value="LR">LR: Liberia</option>
<option value="LS">LS: Lesotho</option>
<option value="LT">LT: Lithuania</option>
<option value="LU">LU: Luxembourg</option>
<option value="LV">LV: Latvia</option>
<option value="LY">LY: Libya</option>
<option value="MA">MA: Morocco</option>
<option value="MC">MC: Monaco</option>
<option value="MD">MD: Moldova</option>
<option value="MG">MG: Madagascar</option>
<option value="MH">MH: Marshall Islands</option>
<option value="MK">MK: Macedonia</option>
<option value="ML">ML: Mali</option>
<option value="MM">MM: Myanmar</option>
<option value="MN">MN: Mongolia</option>
<option value="MO">MO: Macau</option>
<option value="MP">MP: Northern Mariana Islands</option>
<option value="MQ">MQ: Martinique</option>
<option value="MR">MR: Mauritania</option>
<option value="MS">MS: Montserrat</option>
<option value="MT">MT: Malta</option>
<option value="MU">MU: Mauritius</option>
<option value="MV">MV: Maldives</option>
<option value="MW">MW: Malawi</option>
<option value="MX">MX: Mexico</option>
<option value="MY">MY: Malaysia</option>
<option value="MZ">MZ: Mozambique</option>
<option value="NA">NA: Namibia</option>
<option value="NC">NC: New Caledonia</option>
<option value="NE">NE: Niger</option>
<option value="NF">NF: Norfolk Island</option>
<option value="NG">NG: Nigeria</option>
<option value="NI">NI: Nicaragua</option>
<option value="NL">NL: Netherlands</option>
<option value="NO">NO: Norway</option>
<option value="NP">NP: Nepal</option>
<option value="NR">NR: Nauru</option>
<option value="NT">NT: Neutral Zone</option>
<option value="NU">NU: Niue</option>
<option value="NZ">NZ: New Zealand (Aotearoa)</option>
<option value="OM">OM: Oman</option>
<option value="PA">PA: Panama</option>
<option value="PE">PE: Peru</option>
<option value="PF">PF: French Polynesia</option>
<option value="PG">PG: Papua New Guinea</option>
<option value="PH">PH: Philippines</option>
<option value="PK">PK: Pakistan</option>
<option value="PL">PL: Poland</option>
<option value="PM">PM: St. Pierre and Miquelon</option>
<option value="PN">PN: Pitcairn</option>
<option value="PR">PR: Puerto Rico</option>
<option value="PT">PT: Portugal</option>
<option value="PW">PW: Palau</option>
<option value="PY">PY: Paraguay</option>
<option value="QA">QA: Qatar</option>
<option value="RE">RE: Reunion</option>
<option value="RO">RO: Romania</option>
<option value="RU">RU: Russian Federation</option>
<option value="RW">RW: Rwanda</option>
<option value="SA">SA: Saudi Arabia</option>
<option value="Sb">Sb: Solomon Islands</option>
<option value="SC">SC: Seychelles</option>
<option value="SD">SD: Sudan</option>
<option value="SE">SE: Sweden</option>
<option value="SG">SG: Singapore</option>
<option value="SH">SH: St. Helena</option>
<option value="SI">SI: Slovenia</option>
<option value="SJ">SJ: Svalbard and Jan Mayen Islands</option>
<option value="SK">SK: Slovak Republic</option>
<option value="SL">SL: Sierra Leone</option>
<option value="SM">SM: San Marino</option>
<option value="SN">SN: Senegal</option>
<option value="SO">SO: Somalia</option>
<option value="SR">SR: Suriname</option>
<option value="ST">ST: Sao Tome and Principe</option>
<option value="SU">SU: USSR (former)</option>
<option value="SV">SV: El Salvador</option>
<option value="SY">SY: Syria</option>
<option value="SZ">SZ: Swaziland</option>
<option value="TC">TC: Turks and Caicos Islands</option>
<option value="TD">TD: Chad</option>
<option value="TF">TF: French Southern Territories</option>
<option value="TG">TG: Togo</option>
<option value="TH">TH: Thailand</option>
<option value="TJ">TJ: Tajikistan</option>
<option value="TK">TK: Tokelau</option>
<option value="TM">TM: Turkmenistan</option>
<option value="TN">TN: Tunisia</option>
<option value="TO">TO: Tonga</option>
<option value="TP">TP: East Timor</option>
<option value="TR">TR: Turkey</option>
<option value="TT">TT: Trinidad and Tobago</option>
<option value="TV">TV: Tuvalu</option>
<option value="TW">TW: Taiwan</option>
<option value="TZ">TZ: Tanzania</option>
<option value="UA">UA: Ukraine</option>
<option value="UG">UG: Uganda</option>
<option value="UK">UK: United Kingdom</option>
<option value="UM">UM: US Minor Outlying Islands</option>
<option value="US" selected>US: United States</option>
<option value="UY">UY: Uruguay</option>
<option value="UZ">UZ: Uzbekistan</option>
<option value="VA">VA: Vatican City State (Holy See)</option>
<option value="VC">VC: Saint Vincent and the Grenadines</option>
<option value="VE">VE: Venezuela</option>
<option value="VG">VG: Virgin Islands (British)</option>
<option value="VI">VI: Virgin Islands (U.S.)</option>
<option value="VN">VN: Viet Nam</option>
<option value="VU">VU: Vanuatu</option>
<option value="WF">WF: Wallis and Futuna Islands</option>
<option value="WS">WS: Samoa</option>
<option value="YE">YE: Yemen</option>
<option value="YT">YT: Mayotte</option>
<option value="YU">YU: Yugoslavia</option>
<option value="ZA">ZA: South Africa</option>
<option value="ZM">ZM: Zambia</option>
<option value="ZR">ZR: Zaire</option>
<option value="ZW">ZW: Zimbabwe</option>
</select>
</body>
</html>
ERIC
    ;
print "200 OK\n";
print "Content-length: ".length($tosendout)."\n";
print "Content-type: text/html\n\n";
print $tosendout;


}
