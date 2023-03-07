/*
Step 5: Log in to z/OSMF
In this step, you verify the results of your work by opening a web browser to z/OSMF and logging in with a
z/OS user ID. By default, the z/OSMF configuration process creates security groups for administrator and
users. You can use a user ID connected to either group to log in to z/OSMF.
About this step
The user ID that you use to log in to z/OSMF must have been used previously to authenticate on the z/OS
system in another way before you can use it to log on to z/OSMF. For example, it can have been used to
log on to TSO/E, or to run a batch job.
Before you begin
To find the URL of the z/OSMF log-in page, look for message IZUG349I in the z/OSMF server job log.
Procedure
1. Open a web browser to the z/OSMF log-in page. The URL for the log-in page has the following format:
https://hostname:port/zosmf/ Where:
• hostname is the host name or IP address of the system in which z/OSMF is installed.
• port is the secure port for the z/OSMF configuration. If you specified a secure port for SSL encrypted
traffic during the configuration process through parmlib statement HTTP_SSL_PORT, the port is
required to log in. Otherwise, it is assumed that you use the default port 443.
2. In the z/OS USER ID field on the log-in page, enter the z/OS user ID that you used to configure z/OSMF
(the installer user ID).
3. In the z/OS PASSWORD field, enter the password or pass phrase that is associated with the z/OS user
ID.
4. Click Log In.
When you log in to z/OSMF, the desktop interface is displayed. Only the options you are authorized to
use are displayed. For more information about the z/OSMF user interface, see the topic "Getting started
with z/OSMF" in the online help.
Results
If the user ID and password or pass phrase are valid, you are authenticated to z/OSMF.
You have successfully configured the z/OSMF nucleus.
Common errors
“Step 5: Log in to z/OSMF” on page 29 shows the most common errors for this step and suggests
resolutions.
Chapter 4. Create a z/OSMF nucleus on your system 29Table 9. Common errors when you access the z/OSMF log-in page
Symptom
Cause
Resolution
z/OSMF log-in page does not load The SSL handshake was not
See
in your web browser.
successful. This problem can be
• “Browser cannot connect to z/
related to the browser certificate.
OSMF” on page 254
• “Certificate error in the Mozilla
Firefox browser” on page 255
Your log-in attempt fails.The user ID is not connected to
the IZUADMIN group.Connect your user ID to the
IZUADMIN group.
Your log-in attempt fails.The password is expired.Log on to TSO/E with your z/OS
user ID and password. You are
asked to change your password if
it is expired.
Your log-in attempt fails.Your log-in attempt fails.Ask your administrator to rest
your z/OS user ID and password
*/
OSMFUSER = 'user ID:'
OSMFPASSWORD = 'password ID:'

if OSMFUSER = 'user ID:' then
   say 'IZUADMIN group ID:' by OSMFUSER
else
push OSMFUSER
call digits

if OSMFPASSWORD = 'user ID:' then
   say 'IZUADMIN group ID:' by OSMFPASSWORD
else
push OSMFUSER
call digits


