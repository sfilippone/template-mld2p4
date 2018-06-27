#include ../../Make.inc

BASIC_MODS=
UTIL_MODS =

MODULES=$(BASIC_MODS) $(UTIL_MODS)

SRC= Xaggrmat_biz_asb.p90 Xaggrmat_minnrg_asb.p90 Xaggrmat_nosmth_asb.p90 \
     Xaggrmat_smth_asb.p90 X_dec_aggregator_mat_asb.p90 X_dec_aggregator_tprol.p90 \
    X_soc1_map_bld.p90 X_soc2_map_bld.p90 X_map_to_tprol.p90\
    X_symdec_aggregator_tprol.p90


FSRC1=$(patsubst %.p90, %.f90, $(subst X, mld_$(ARITH), $(filter %.p90, $(SRC))))
FSRC2=$(patsubst %.P90, %.F90, $(subst X, mld_$(ARITH), $(filter %.P90, $(SRC))))
FSRC=$(FSRC1) $(FSRC2)
FOBJS1=$(FSRC1:.f90=.o)
FOBJS2=$(FSRC2:.F90=.o)
FOBJS=$(FOBJS1) $(FOBJS2)

LIBMOD=
# OBJS= $(SFOBJS) $(DFOBJS) $(CFOBJS) $(ZFOBJS)
# SRCS= $(SFSRC) $(DFSRC) $(CFSRC) $(ZFSRC)
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



$(FSRC1): mld_$(ARITH)%.f90 : X%.p90
	sed -f ../../../$(ARITH).sed $< >$@
$(FSRC2): mld_$(ARITH)%.F90 : X%.P90 
	sed -f ../../../$(ARITH).sed $< >$@

clean:
	/bin/rm -f *.f90 *.F90 *.o

