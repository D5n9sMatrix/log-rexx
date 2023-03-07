/*
Displaying the z/OSMF server settings
Use the MODIFY command with the option ‘DISPLAY IZU’ to display the IZUPRMxx parmlib settings
from the most recent z/OSMF server initialization. The display output is displayed in message IZUG013I.
The display output includes:
• z/OSMF home page URI.
• AUTOSTART group name, if the command is entered for an autostarted z/OSMF server.
• One of the following enablement status values for each of the optional z/OSMF services:
STARTED
Service is enabled.
STOPPED
Service is disabled.
UNSPECIFIED
Service name is not specified in a currently active IZUPRMxx parmlib member and is therefore not
enabled.
The display output also includes the server start time and an indication of how long the server has been
running.
The display output does not reflect any configuration changes that you might have applied to the
IZUPRMxx member after server start-up, such as through the SET IZU or SETIZU command.
For descriptions of the IZUPRMxx parmlib member settings, see “IZUPRMxx reference information” on
page 35.
F <server-name>,DISPLAY IZU
The parameters are:
server-name
Job name of the currently active z/OSMF server started task. By default, the job name is IZUSVR1, but
your installation might use a different job name.
DISPLAY IZU
Displays the settings for the currently active IZUPRMxx parmlib members. This cumulative set of
values is derived from the currently active parmlib members.
The display output does not reflect any configuration changes that you might have applied to the
IZUPRMxx member after server start-up, such as through the SET IZU or SETIZU command.
If the command is entered incorrectly, an error message from the WebSphere Liberty run time is
displayed to describe the error. The WebSphere Liberty messages are prefixed by CW and are described
online at the following link: WebSphere Liberty message descriptions (www.ibm.com/docs/en/was-
liberty/zos?topic=liberty-messages).
*/
F = 2
DISPLAY = 4
IZU = 666
options F '<server-name>' DISPLAY IZU
options DISPLAY IZU arg parse