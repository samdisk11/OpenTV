
open(FILE,"< $RealDir/ServiceVault/wtv-1800/tellyscripts/telly.tok");
binmode(FILE);
$size=-s FILE;
sysread(FILE,$data_XZ,($size),0);
close(FILE);
$content_len = length($data_XZ);
$current_date = localtime();

print <<ERIC;
200 OK
Connection: Keep-Alive
wtv-initial-key: BEDi7M7Qy9I=
Content-type: text/tellyscript
wtv-service: reset
wtv-service: name=wtv-* host=$sockhost port=$sockport flags=0x7
wtv-service: name=wtv-1800 host=$sockhost port=$sockport flags=0x4
wtv-service: name=wtv-star host=$sockhost port=$sockport flags=0x4
wtv-service: name=wtv-head-waiter host=$sockhost port=$sockport flags=0x4
wtv-service: name=wtv-tricks host=$sockhost port=$sockport flags=0x4
wtv-service: name=wtv-home host=$sockhost port=$sockport flags=0x4
wtv-name-server: 4.2.2.2
wtv-home-url: wtv-home:/home
wtv-expire-all: wtv-1800:/preregister
wtv-boot-url: wtv-head-waiter:/login
wtv-visit: wtv-head-waiter:/login
wtv-client-time-zone: EST -0500
wtv-client-time-dst-rule: EST
wtv-client-date: $current_date
Content-length: $content_len

$data_XZ
ERIC
    ;