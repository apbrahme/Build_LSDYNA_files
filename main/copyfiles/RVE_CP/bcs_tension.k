$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$------------------------- BOUNDARY CONDITIONS ---------------------------------
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$
*SET_NODE_LIST
        50
         1
$ - - - - - - - - - -
*BOUNDARY_SPC_SET
$ NID/NSID       CID      DOFX      DOFY      DOFZ     DOFRX     DOFRY     DOFRZ
        50         0         0         0         1         0         0         0
$ - - - - - - - - - -
*BOUNDARY_PRESCRIBED_MOTION_SET
$   TYPEID       DOF       VAD      LCID        SF       VID     DEATH     BIRTH
         4         1         0       100     &APPV         0
$ - - - - - - - - - -
*BOUNDARY_PRESCRIBED_MOTION_SET
$   TYPEID       DOF       VAD      LCID        SF       VID     DEATH     BIRTH
         1         1         0       100    -&APPV         0
$ - - - - - - - - - -
*BOUNDARY_SPC_SET
$ NID/NSID       CID      DOFX      DOFY      DOFZ     DOFRX     DOFRY     DOFRZ
         2         0         0         1         0         0         0         0
$ - - - - - - - - - -
*INCLUDE
$./bounds/csf_1.k
$./bounds/csf_2.k
$./bounds/csf_3.k
$./bounds/csf_4.k
./bounds/csf_5.k
$./bounds/csf_6.k
