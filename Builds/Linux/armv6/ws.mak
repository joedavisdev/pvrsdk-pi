ifeq "$(X11BUILD)" "1"

WS_LIBS = -L$(X11ROOT)/lib -Wl,--rpath-link,$(X11ROOT)/lib -lX11 -lXau
WS_INC  = $(X11ROOT)/include
WS       = X11
else

ifeq "$(EWSBUILD)" "1"

PLAT_CFLAGS += -DEWS
WS_LIBS = -lews
WS_INC =
WS=EWS

else
ifeq "$(PIBUILD)" "1"
WS_LIBS = -L/opt/vc/lib -lbcm_host
WS_INC = /opt/vc/include/interface/vcos/pthreads
WS = Pi
PLAT_CFLAGS = -DRASPBERRY_PI -DHAVE_LIBBCM_HOST -DUSE_EXTERNAL_LIBBCM_HOST \
-I/opt/vc/include -I/opt/vc/include/interface/vmcs_host/linux 
else
WS_LIBS =
WS_INC  =
WS = NullWS
endif # PIBUILD

endif # EWSBUILD

endif # X11BUILD

PLAT_LINK += $(WS_LIBS)
PLAT_INC  += $(WS_INC)
