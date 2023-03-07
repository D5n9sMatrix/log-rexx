/*
Stopping and starting z/OSMF manually
Although z/OSMF starts automatically when you start z/OS, you can also stop and start z/OSMF manually.
To stop the z/OSMF server, you can use the STOP command from the operator console. Enter STOP for
each started task in the following sequence:
STOP IZUSVR1
STOP IZUANG1
Figure 6 on page 31 shows an example of the expected results on a system that is running JES2:
stop izusvr1
+CWWKB0001I: Stop command received for server zosmfServer.
$HASP395 IZUSVR1 ENDED
stop izuang1
CWWKB0073I: THE IZUANG1 ANGEL PROCESS ENDED NORMALLY.
$HASP395 IZUANG1 ENDED
Figure 6. Example result from a STOP command
To start the z/OSMF server, you can use the START command from the operator console. Enter START for
the two started tasks in the following sequence:
START IZUANG1
START IZUSVR1,IZUPRM=PREV
Specifying IZUPRM=PREV, which is the default, ensures that you use the same set of IZUPRMxx parmlib
values that were in effect in the previous instance of z/OSMF.
• The z/OSMF server is available when the following message is displayed: CWWKF0011I: The server
zosmfServer is ready to run a smarter planet.
• Generally, you should not cancel the z/OSMF angel process because the z/OSMF applications in your
system might depend on it. However, in some rare cases, you might find it necessary to cancel the angel
process to avoid a system shutdown, such as a re-IPL. If you ever need to cancel the angel process or if
the angel process abends, your z/OSMF administrator should cancel the z/OSMF servers with
applications dependent on the successful running of the angel process. Otherwise, leaving the servers
and applications running can result in a server hang condition.
*/
STOP = 0
IZUSVR1 = 10
START = 2
IZUANG1 = 10
PREV = 10
queue STOP IZUSVR1
queue STOP IZUANG1
options START by IZUANG1
options START by IZUSVR1
