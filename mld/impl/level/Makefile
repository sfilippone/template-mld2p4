TOP=../../..
include $(TOP)/Make.inc

BASIC_MODS=
UTIL_MODS =

MODULES=$(BASIC_MODS) $(UTIL_MODS)

SRC=X_base_onelev_check.p90 X_base_onelev_descr.p90 X_base_onelev_dump.p90 \
    X_base_onelev_free.p90  X_base_onelev_csetc.P90 X_base_onelev_cseti.P90 \
    X_base_onelev_csetr.p90 X_base_onelev_cnv.p90 X_base_onelev_build.p90 \
    X_base_onelev_setsv.P90 X_base_onelev_setsm.P90 X_base_onelev_setag.p90 \
    X_base_onelev_mat_asb.p90


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


src: ssingle sdouble scomplex sdcompl
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
	($(TOP)/cpy.sh $(TOP) $(TARGET)/mlprec/impl/level *.f90 *.F90)



$(FSRC1): mld_$(ARITH)%.f90 : X%.p90
	sed -f ../../../$(ARITH).sed $< >$@
$(FSRC2): mld_$(ARITH)%.F90 : X%.P90 
	sed -f ../../../$(ARITH).sed $< >$@

clean:
	/bin/rm -f *.f90 *.F90 *.o

