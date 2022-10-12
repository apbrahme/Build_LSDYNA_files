$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$------------------------- BOUNDARY CONDITIONS ---------------------------------
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$
$ - - - - - - - - - - 
*BOUNDARY_SPC_SET
$ NID/NSID       CID      DOFX      DOFY      DOFZ     DOFRX     DOFRY     DOFRZ
         2         0         1         1         1         0         0         0
$ - - - - - - - - - -
*BOUNDARY_PRESCRIBED_MOTION_SET
$   TYPEID       DOF       VAD      LCID        SF       VID     DEATH     BIRTH
         5         1         0       100     &APPV         0 
$ - - - - - - - - - -
*BOUNDARY_SPC_SET
$ NID/NSID       CID      DOFX      DOFY      DOFZ     DOFRX     DOFRY     DOFRZ
         5         0         0         1         1         0         0         0
$ - - - - - - - - - -
