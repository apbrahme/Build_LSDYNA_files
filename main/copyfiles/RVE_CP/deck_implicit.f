*KEYWORD 375m
*TITLE
"RVE Crystal Plasticity"
$ Units in TON, MM, S, N, MPA, TON/MM^3
$
$ - - - - - - - - - - 
*PARAMETER
  i IMPLCT         1
  r   TEND   150.000
  r  DTMAX       0.1
  r   APPV    0.0005
  r   D3PL    1.0000
  r   BINO    1.0000
$ - - - - - - - - - - 
  i    NHV       180
  i    LMC        24
$ - - - - - - - - - -
  r     RO   2.70e-9
  r     G0     26250
  r     K0     70000
  r    C11  124329.6
  r    C12     71202
  r    C44  28896.97
$ - - - - - - - - - - 
  r   GDOT     0.001
  r    XMX      0.02
  r    QAB       1.0
  r   TAU0    119.93
$ - - - - - - - - - -
$ H(1-4) for IHMODL 1 (Asaro-Lowe):  H0, HS, TAUS, NEXP
$ - - - - - - - - - -
  i IHMODL         1
  r     H1     0.300
  r     H2    0.0010
  r     H3    1.1500
  r     H4      0.00
$ - - - - - - - - - -
$
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$---------------------------------- CONTROL ------------------------------------
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$
$ - - - - - - - - - -
*CONTROL_MPP_IO_BINOUTONLY
$ - - - - - - - - - - 
*CONTROL_TERMINATION
$   ENDTIM
     &TEND
$ - - - - - - - - - - 
*CONTROL_ACCURACY                                                            
$      OSU       INN    PIDOSU
         1         4
$ - - - - - - - - - - 
*CONTROL_HOURGLASS
$      IHQ        QH
         6       0.1
$ - - - - - - - - - -
*CONTROL_ENERGY
$     HGEN      RWEN    SLNTEN     RYLEN
         2         1         1         1
$ - - - - - - - - - - 
*CONTROL_TIMESTEP      
$      IDT     DTSCF                                    LCTM
                0.80                                    1000
$ - - - - - - - - - - 
*DEFINE_CURVE
$ Timestep curve for explicit simulations
$     LCID      SIDR       SFA       SFO      OFFA      OFFO
      1000         0       1.0       1.0      0.00      0.00
$
$ XAXIS-A1, YAXIS-O1
    0.0000,   &DTMAX
    100000,   &DTMAX
$ - - - - - - - - - - 
$
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$---------------------------------- OUTPUT -------------------------------------
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$
$ - - - - - - - - - - 
*DATABASE_EXTENT_BINARY
$    NEIPH     NEIPS    MAXINT    STRFLG    SIGFLG    EPSFLG    RLTFLG    ENGFLG
        24         0         3         1         2         2         2         2
$   CMPFLG    IEVERP    BEAMIP     DCOMP      SHGE     STSSZ    N3THDT
         1         0         0         1         2         1         1
$  NINTSLD  
         1
$ - - - - - - - - - - 
*DATABASE_BINARY_D3PLOT
$       DT
     &D3PL
$ - - - - - - - - - - 
*DATABASE_NODAL_FORCE_GROUP
$     NSID
         4 
$ - - - - - - - - - - 
*DATABASE_NODAL_FORCE_GROUP
$     NSID
         5 
$ - - - - - - - - - -
*DATABASE_NODAL_FORCE_GROUP
$     NSID
         6 
$ - - - - - - - - - -
*DATABASE_ELOUT
$       DT    BINARY
     &BINO         2
$ - - - - - - - - - -
*DATABASE_NODFOR
$       DT    BINARY
     &BINO         2
$ - - - - - - - - - -
*DATABASE_NODOUT
$       DT    BINARY
     &BINO         2
$ - - - - - - - - - -
*DATABASE_MATSUM
$       DT    BINARY
     &BINO         2
$ - - - - - - - - - -
*DATABASE_GLSTAT
$       DT    BINARY
     &BINO         2
$ - - - - - - - - - -
$
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$-------------------------- IMPLICIT PROPERTIES --------------------------------
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$
$ - - - - - - - - - - 
*CONTROL_IMPLICIT_GENERAL
$   IMFLAG       DT0      IEFS   NTSEPSB       IGS
   &IMPLCT    &DTMAX         0         0         0
$ - - - - - - - - - - 
*CONTROL_IMPLICIT_SOLUTION
$  NLSOLVR    ILIMIT    MAXREF     DCTOL     ECTOL     RCTOL     LSTOL
        12      1000        50    0.0001    0.0001         0         0
$    DNORM   DIVFLAG   INISTIF   NLPRINT
         0         0         0         1
$   ARCCTL    ARCDIR    ARCLEN    ARCMTH    ARCDMP    ARTCPSI   ARCALF    ARCTIM
         0         0         0         1         2         0         0         0
$ - - - - - - - - - - 
*CONTROL_IMPLICIT_DYNAMICS
$    IMASS      GAMA      BETA
         1       0.5      0.25
$ - - - - - - - - - - 
*CONTROL_IMPLICIT_SOLVER
$   LSOLVR   PRNTFLG    NEGEIG
         5         0         0
$ - - - - - - - - - - 
*CONTROL_IMPLICIT_AUTO
$    IAUTO    ITEOPT    ITEWIN     DTMIN     DTMAX     DTEXP     KFAIL    KCYCLE
         1        11         5   0.00001    &DTMAX   
$ - - - - - - - - - - 
$
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$-------------------------- SECTION PROPERTIES ---------------------------------
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$
$ - - - - - - - - - - 
*SECTION_SOLID
$    SECID    ELFORM
         1         1
$ - - - - - - - - - - 
$
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$-------------------------- INCLUDE FILES --------------------------------------
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$
$ - - - - - - - - - - 
*INCLUDE
./matcp.k
./erosion.k
*INCLUDE
./nodes.k
./elements.k
./database.k
./parts.k
./faces.k
*INCLUDE
./path_ramped.k
./bcs_tension.k
$./bcs_shear.k
*END
