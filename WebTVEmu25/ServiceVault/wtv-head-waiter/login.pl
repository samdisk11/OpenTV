$tosendout=<<"ERIC"													  
<!--wtv-head-waiter SPLASH added by Mattman to help get that initial WebTV feel.>
<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<display hideoptions skipback clearback fontsize=medium>
		<title>WebTV service</title>
		<meta http-equiv=Refresh content="4; url=wtv-home:/home">
	</head>
		<body bgcolor="#000000" text="#449944">
		<bgsound src="file://ROM/Sounds/Splash.mid">
		<center>
		<spacer type=block height=98 width=21>
		<br>
		<img src="file://ROM/Images/SplashLogo1.gif" width=250 height=175>
		</table>
		</center>
	</body>
</html>
ERIC
    ;


$localtime = localtime();

$lenc=length($tosendout);

print <<ERIC;
200 OK
Connection: Keep-Alive
wtv-default-client-useragent: Mozilla/4.0 WebTV/2.6 (compatible; MSIE 4.0)
wtv-default-client-scriptprops: appVersion=4.0+(WebTV%3B2.8)&AliasAppName=Microsoft+Internet+Explorer
wtv-service: reset
wtv-service: name=http host=74.76.120.18 port=1650 flags=0x04
wtv-service: name=wtv-1800 host=$sockhost port=$sockport flags=0x00000004
wtv-service: name=wtv-head-waiter host=$sockhost port=1615 flags=0x00000001 connections=1
wtv-service: name=wtv-customscript host=$sockhost port=1615
wtv-service: name=wtv-register host=$sockhost port=1615
wtv-service: name=mailto host=$sockhost port=1615 connections=3
wtv-service: name=wtv-mail host=$sockhost port=1615 connections=3
wtv-service: name=wtv-check-url host=$sockhost port=1615
wtv-service: name=wtv-news host=$sockhost port=1615 flags=0x00000010 connections=3
wtv-service: name=wtv-forum host=$sockhost port=1615
wtv-service: name=news host=$sockhost port=1615 flags=0x00000010
wtv-service: name=wtv-favorite host=$sockhost port=1615 connections=3
wtv-service: name=wtv-music host=$sockhost port=1615 connections=3
wtv-service: name=wtv-home host=$sockhost port=1615 flags=0x00000004 connections=3
wtv-service: name=wtv-disk host=$sockhost port=1615 connections=3
wtv-service: name=wtv-content host=$sockhost port=1615 connections=3
wtv-service: name=wtv-epguide host=$sockhost port=1615 flags=0x00000040 connections=3
wtv-service: name=wtv-census-udp host=$sockhost port=1615
wtv-service: name=wtv-center host=$sockhost port=1615 flags=0x00000010 connections=3
wtv-service: name=wtv-video host=$sockhost port=16154 connections=3
wtv-service: name=wtv-flashrom host=$sockhost port=1615 flags=0x00000040
wtv-service: name=wtv-guide host=$sockhost port=1615 connections=3
wtv-service: name=wtv-intro host=$sockhost port=1615
wtv-service: name=wtv-tutorial host=$sockhost port=1615 connections=3
wtv-service: name=wtv-notices host=$sockhost port=1615 connections=1
wtv-service: name=wtv-tricks host=$sockhost port=1615 flags=0x00000004
wtv-service: name=wtv-passport host=$sockhost port=1615 connections=1
wtv-service: name=wtv-* host=$sockhost port=1615 flags=0x00000007
wtv-service: name=wtv-star host=$sockhost port=1615 flags=0x00000007
wtv-service: name=wtv-chat host=$sockhost port=1615 connections=3
wtv-service: name=wtvchat host=$sockhost port=1615
wtv-service: name=wtv-smartcard host=$sockhost port=1615 connections=1
wtv-service: name=wtv-vod host=$sockhost port=1615 connections=1
wtv-service: name=wtv-simple host=$sockhost port=1615
wtv-service: name=wtv-author host=$sockhost port=1615 connections=3
wtv-service: name=help host=$sockhost port=$sockport flags=0x00000004
wtv-service: name=bi-viewable host=$sockhost port=$sockport flags=0x00000004
wtv-service: name=bi-trih host=$sockhost port=$sockport flags=0x00000004
wtv-service: name=emu-donate host=$sockhost port=$sockport flags=0x00000004
wtv-service: name=emu-local host=$sockhost port=$sockport flags=0x00000004
wtv-service: name=vie-local host=$sockhost port=$sockport flags=0x00000004
wtv-service: name=vie-remote host=$sockhost port=$sockport flags=0x00000004
wtv-service: name=cgi-bin host=$sockhost port=$sockport flags=0x00000004
wtv-service: name=wtv-help2 host=$sockhost port=$sockport flags=0x00000004
wtv-service: name=wtv-we205 host=$sockhost port=$sockport flags=0x00000004
#wtv-name-server: 8.8.8.8
#wtv-bypass-proxy: true
wtv-relogin-url: wtv-head-waiter:/login?relogin=true
wtv-reconnect-url: wtv-head-waiter:/reconnect
wtv-input-timeout: 86400
wtv-notifications-port: 6666
wtv-inactive-timeout: 0
wtv-connection-timeout: 90
wtv-fader-timeout: 900
wtv-tourist-enabled: true
wtv-boot-url: wtv-head-waiter:/login
wtv-favorite-url: wtv-favorite:/favorite
wtv-favorite-index-url: wtv-favorite:/favorite-index?
wtv-home-url: wtv-home:/home
wtv-show-time-enabled: true
wtv-mail-url: wtv-mail:/listmail
wtv-notifications-url: wtv-notices:/notices
wtv-offline-mail-connect-url: wtv-head-waiter:/offline-mail-connect
wtv-messenger-login-url: wtv-passport:/messengerlogin
wtv-ssl-certs-download-url: wtv-head-waiter:/download-ssl-certs
wtv-ssl-certs-checksum: 82BF226053C84648B2EFB937CF05BF1E
wtv-tvconnection-timeout: 300
wtv-itvconnection-timeout: 300
wtv-smartcard-inserted-url: wtv-smartcard:/insert
wtv-smartcard-removed-url: wtv-smartcard:/remove
wtv-ssl-timeout: 240
wtv-login-timeout: 7200
wtv-notifications-port: 6666
wtv-open-isp-disabled: false
wtv-offline-mail-enable: true
wtv-datadownload-url: wtv-disk:/download-list
wtv-datadownload-login-url: wtv-head-waiter:/login?DataDownload=1
wtv-datadownload-checktimeoffset: 37031
wtv-tv-zipcode: 94064
wtv-client-time-zone: PST -0800
wtv-client-time-dst-rule: PST
wtv-client-date: $localtime
wtv-bypass-proxy: true
wtv-allow-dsc: true
wtv-messenger-authorized: 0
wtv-messenger-enable: 0
wtv-messenger-server: $sockhost
wtv-offline-user-list: PHVzZXItbGlzdD4KPHVzZXIgdXNlcmlkPSIxMjk1MTcwOTIiIHVzZXItbmFtZT0iQVJfMTI5NTE3MDg5IiBmaXJzdC1uYW1lPSJBUiIgbGFzdC1uYW1lPSIxMjk1MTcwODkiIHBhc3N3b3JkPSIiIG1haWwtZW5hYmxlZD0idHJ1ZSIvPgo8L3VzZXItbGlzdD4K
wtv-ticket: 38/|9/|wtv-user-id/|129517092/|12/|wtv-user-name/|AR_129517089/|2/|wtv-human-name-first/|AR/|9/|wtv-human-name-last/|129517089/|11/|ip/|192.168.1.3/|1/|wtv-chat-restriction/|0/|1/|user-is-the-subscriber/|1/|5/|wtv-messenger-authorized/|false/|14/|user-list/|1,129517092;1,/|3/|wtv-programs/|one/|6/|wtv-subscriber-category/|normal/|12/|ANI/|950000000000/|5/|subscriber-zip/|94064/|2/|subscriber-country/|US/|2/|tricks-access-level/|40/|1/|traxs-temp-access/|0/|8/|traxs-time-stamp/|5d8c5060/|8/|traxs-passwd-hash/|873241cb/|13/|subscriber-billing-address/|463 Bryant St/|12/|subscriber-billing-city/|Redwood City/|2/|subscriber-billing-state/|CA/|12/|subscriber-phone-day/|650-780-7000/|2/|subscriber-billing-status/|ok/|1/|subscriber-is-canceled/|0/|1/|service-tier/|1/|9/|wtv-subscriber-id/|129517089/|16/|wtv-client-serial-number/|n00b_for_life_04/|2/|wtv-printer-mfr-code/|-1/|2/|wtv-printer-model-code/|-1/|1/|wtv-printer-black-pen-code/|0/|1/|wtv-printer-color-pen-code/|0/|9/|wtv-client-time-zone/|PST -0800/|2/|session-country/|US/|24/|wtv-session-key1/|Q1VecbKp43JKN9Z57/6pQg==/|24/|wtv-session-key2/|13fF8748HiDyxzTd/I4rXw==/|21/|wtv-user-connection-id/|1; 5D8C5060:0007967E;/|21/|wtv-user-session-id/|1; 5D8C5055:000E4215;/|32/|wtv-MD5-digest/|9d4a78043e666b70709a391e20ecb559/|
wtv-service-cookie: 01CREATEDT/|1569458346/|/|initial/|initial/|/|
wtv-mail-count: 0
wtv-wink-deferrer-retries: 3
Content-length: $lenc 
Content-type: text/html

$tosendout
ERIC
    ;