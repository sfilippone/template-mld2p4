include ./Make.inc
TOP=.
BASIC_MODS=
UTIL_MODS =


src:
	cd mld && $(MAKE) src
	cd examples && $(MAKE) src
	cd test && $(MAKE) src

cpy: src
	cd mld && $(MAKE) cpy
	cd examples && $(MAKE) cpy
	cd test && $(MAKE) cpy

clean:
	cd mld && $(MAKE) clean
	cd examples && $(MAKE) clean
	cd test && $(MAKE) clean

