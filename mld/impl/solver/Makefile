TOP=../../..
include $(TOP)/Make.inc

BASIC_MODS=
UTIL_MODS =

MODULES=$(BASIC_MODS) $(UTIL_MODS)

SRC=X_base_solver_apply.p90 X_base_solver_apply_vect.p90 \
    X_base_solver_bld.p90 X_base_solver_check.p90 X_base_solver_cnv.p90 \
    X_base_solver_descr.p90 X_base_solver_dmp.p90 X_base_solver_clone.p90 \
    X_base_solver_free.p90 X_base_solver_clone_settings.p90 X_base_solver_clear_data.p90 \
    X_base_solver_csetc.p90 X_base_solver_cseti.p90 X_base_solver_csetr.p90 \
    X_diag_solver_apply.p90 X_diag_solver_apply_vect.p90 X_diag_solver_clear_data.p90 \
    X_diag_solver_bld.p90  X_diag_solver_clone.p90 X_diag_solver_dmp.p90  X_diag_solver_cnv.p90 \
    X_id_solver_apply.p90 X_id_solver_clone.p90 \
    X_id_solver_apply_vect.p90 X_ilu_solver_apply.p90 \
    X_ilu_solver_apply_vect.p90 X_ilu_solver_bld.p90 \
    X_ilu_solver_dmp.p90 X_ilu_solver_clone.p90 X_ilu_solver_cnv.p90 \
    Xilu0_fact.p90 Xiluk_fact.p90 Xilut_fact.p90 \
    X_ilu_solver_clear_data.p90 X_ilu_solver_clone_settings.p90 \
    X_gs_solver_apply.p90 X_gs_solver_apply_vect.p90 X_gs_solver_bld.p90 \
    X_gs_solver_dmp.p90 X_gs_solver_clone.p90 X_gs_solver_cnv.p90 \
    X_gs_solver_clear_data.p90 X_gs_solver_clone_settings.p90 \
    X_bwgs_solver_bld.p90 X_bwgs_solver_apply.p90 X_bwgs_solver_apply_vect.p90 \
    X_mumps_solver_bld.P90 X_mumps_solver_apply.P90 X_mumps_solver_apply_vect.P90 




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

cpy: 
	($(TOP)/cpy.sh $(TOP) $(TARGET)/mlprec/impl/solver *.f90 *.F90)


$(FSRC1): mld_$(ARITH)%.f90 : X%.p90
	sed -f ../../../$(ARITH).sed $< >$@
$(FSRC2): mld_$(ARITH)%.F90 : X%.P90 
	sed -f ../../../$(ARITH).sed $< >$@

clean:
	/bin/rm -f *.f90 *.F90 *.o

