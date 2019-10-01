Do full install of perl otherwise the EMU will not work.

----------

If MSWINSCK.OCX missing and other errors try:

Install the Visual Basic 6.0 SP6 run-time files. https://www.microsoft.com/en-us/download/details.aspx?id=24417

If above doesn't fix your problem try below.

If you're on a Win7 64-bit PC then download and copy the DLLs, OCXs etc. to %windir%\SysWoW64 and not %windir%\System32 https://www.ocxdump.com/

Open an elevated/admin command prompt (search for cmd in the Start Menu search box, right-click, Run as administrator) and try to register the OCX using regsvr32. EXAMPLE  regsvr32 c:\windows\syswow64\MSWINSCK.OCX

----------

Dont delete anything in the WebTV-EMU folder!

The EMU Launcher is not needed to run the server emu or the viewers it just makes it easier to open stuff when your messing around a lot.

Home page for EMU http://turdinc.kicks-ass.net/Msntv/WebTV-EMU/index.html

MattMan

----------

WebTV EMU By: eMac 2001
WebTV Test O Server By: eMac

WebTV EMU Launcher By: MattMan

Thanks to:
OutaTyme, aka Tommy, aka (A mysterious figure lurking in the deepest corners of the interwebs. You can not see him, but he sees you!)

For his work on getting this to work better with DreamPi For WebTV.