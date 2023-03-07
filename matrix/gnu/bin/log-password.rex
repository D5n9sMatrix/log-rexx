/*
Step 6: Mount the z/OSMF user file system at IPL time
In this step, you ensure that the user file system is mounted at IPL time.
About this step
Previously, in “Step 2: Run job IZUMKFS to create the z/OSMF user file system” on page 26 you created
and mounted the z/OSMF user file system. Now, you can ensure that the z/OSMF user file system is
mounted automatically for subsequent IPLs. Doing this work will involve updating the active BPXPRMxx
parmlib member on your z/OS system.
Before you begin
By default, the z/OSMF file system uses the name IZU.SIZUUSRD, and is mounted in read/write mode. It
is recommended that this file system is mounted automatically at IPL time.
If you do not know which BPXPRMxx member is active, follow these steps to find out:
1. In the operations console, enter the following command to see which parmlib members are included in
the parmlib concatenation on your system:
D PARMLIB
2. Make a note of the BPXPRMxx member suffixes that you see.
3. To determine which BPXPRMxx member takes precedence, enter the following command:
D OMVS
The output of this command should be similar to the following messages:
BPXO042I 04.01.03 DISPLAY OMVS 391
OMVS 000F ACTIVE OMVS=(ST,3T)
In this example, the member BPXPRMST takes precedence. If BPXPRMST is not present in the
concatenation, member BPXPRM3T is used.
30 z/OS: IBM z/OSMF Configuration GuideProcedure
Add a MOUNT command for the z/OSMF user file system to your currently active BPXPRMxx parmlib
member. For example:
MOUNT FILESYSTEM(’IZU.SIZUUSRD’) TYPE(ZFS) MODE(RDWR)
MOUNTPOINT('/global/zosmf') PARM(’AGGRGROW’) UNMOUNT
Results
The BPXPRMxx member is updated. At the next system IPL, the following message is issued to indicate
that the z/OSMF file system is mounted automatically.
BPXF013I FILE SYSTEM IZU.SIZUUSRD WAS SUCCESSFULLY MOUNTED.
*/
IPL = 'OMVS 000F ACTIVE OMVS=(ST, 3T)'
MOUNT = 'MOUNT FILESYSTEM(IZU.SIZUUSRD) TYPE(ZFS) MODE(RDWR)'
MOUNTPOINT = 'MOUNTPOINT(global/zosmf)'
queue IPL by MOUNT options MOUNTPOINT
call digits
