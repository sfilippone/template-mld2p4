TOP=../..
include $(TOP)/Make.inc


BASIC_MODS=
UTIL_MODS =

MODULES=$(BASIC_MODS) $(UTIL_MODS)

SRC=Xmlprec_bld.p90 Xmlprec_aply.p90 \
    Xprecbld.p90 Xprecaply.p90 Xfile_prec_descr.p90 \
    Xprecinit.P90 Xprecset.P90 Xcprecset.P90 \
    X_extprol_bld.P90 X_hierarchy_bld.p90 X_smoothers_bld.p90 

FSRC1=$(patsubst %.p90, %.f90, $(subst X, mld_$(ARITH), $(filter %.p90, $(SRC))))
FSRC2=$(patsubst %.P90, %.F90, $(subst X, mld_$(ARITH), $(filter %.P90, $(SRC))))
FSRC=$(FSRC1) $(FSRC2)
FOBJS1=$(FSRC1:.f90=.o)
FOBJS2=$(FSRC2:.F90=.o)
FOBJS=$(FOBJS1) $(FOBJS2)

LIBMOD=
LIBDIR=..
CINCLUDES=-I.
FINCLUDES=$(FMFLAG)$(LIBDIR) $(FMFLAG). $(FIFLAG).


src: ssingle sdouble scomplex sdcompl aggrd leveld smootherd solverd

aggrd:
	cd aggregator && $(MAKE) src
solverd:
	cd solver && $(MAKE) src
smootherd:
	cd smoother && $(MAKE) src
leveld:
	cd level && $(MAKE) src
ssingle:
	$(MAKE) bsrc ARITH=s
sdouble:
	$(MAKE) bsrc ARITH=d
scomplex:
	$(MAKE) bsrc ARITH=c
sdcompl:
	$(MAKE) bsrc ARITH=z

all:  single double complex dcompl

single:
	$(MAKE) lib ARITH=s
double:
	$(MAKE) lib ARITH=d
complex:
	$(MAKE) lib ARITH=c
dcompl:
	$(MAKE) lib ARITH=z


bsrc: $(FSRC)

lib: $(FOBJS)

cpy: 
	($(TOP)/cpy.sh $(TOP) $(TARGET)/mlprec/impl *.f90 *.F90)
	cd aggregator && $(MAKE) cpy
	cd level && $(MAKE) cpy
	cd smoother && $(MAKE) cpy
	cd solver && $(MAKE) cpy


$(FSRC1): mld_$(ARITH)%.f90 : X%.p90
	sed -f ../../$(ARITH).sed $< >$@
$(FSRC2): mld_$(ARITH)%.F90 : X%.P90 
	sed -f ../../$(ARITH).sed $< >$@

aggrc:
	cd aggregator && $(MAKE) clean
levelc:
	cd level && $(MAKE) clean
smootherc:
	cd smoother && $(MAKE) clean
solverc:
	cd solver && $(MAKE) clean
clean:  levelc smootherc solverc aggrc
	/bin/rm -f *.f90 *.F90 *.o


