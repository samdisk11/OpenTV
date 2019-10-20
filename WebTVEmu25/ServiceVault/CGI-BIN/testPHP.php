<?php

//  This is a test PHP script for the WebTV Emulator 2.0.5

$test="TEST STRING";


print "<h1>TEST</h1><p>This is a test PHP program for the WebTV emulator 2.0.5.  PHP is not included with the emulator but the in the documentation it explaines how to add it.<p>";

test($test);

phpinfo();

function test($testf){

print $testf;

}



?>
