################################################################################
#
# webbridge
#
################################################################################

WEBBRIDGE_VERSION = 8ca8a08dc1404ded7d98ae522e64060de1b8faa8
WEBBRIDGE_SITE_METHOD = git
WEBBRIDGE_SITE = git@github.com:Metrological/webbridge.git
WEBBRIDGE_INSTALL_STAGING = YES
WEBBRIDGE_DEPENDENCIES += cppsdk

WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_BUILD_HASH=$(shell $(GIT) rev-parse --short HEAD)
WEBBRIDGE_CONF_OPTS += -DBUILDREF_WEBBRIDGE=$(shell $(GIT) rev-parse HEAD)

ifeq ($(BR2_ENABLE_DEBUG),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_DEBUG=ON
else ifeq ($(BR2_PACKAGE_CPPSDK_DEBUG),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_DEBUG=ON
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_TRACECONTROL),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_TRACECONTROL=ON
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_MONITOR),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_MONITOR=ON
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_COMMANDER),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_COMMANDER=ON
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_DICTIONARY),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_DICTIONARY=ON
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_BACKOFFICE),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_BACKOFFICE=ON
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_PROVISIONING),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_PROVISIONING=ON
WEBBRIDGE_DEPENDENCIES += libprovision
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_NETFLIX),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_NETFLIX=ON -DWEBBRIDGE_PLUGIN_NETFLIX_VERSION=1.0-$(NETFLIX_VERSION)
WEBBRIDGE_DEPENDENCIES += netflix
ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_NETFLIX_AUTOSTART),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_NETFLIX_AUTOSTART=true
else
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_NETFLIX_AUTOSTART=false
endif
ifneq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_NETFLIX_MODEL),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_NETFLIX_MODEL="$(call qstrip,$(BR2_PACKAGE_WEBBRIDGE_PLUGIN_NETFLIX_MODEL))"
endif
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBPROXY),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBPROXY=ON
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_REMOTECONTROL),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_REMOTECONTROL=ON
ifeq ($(BR2_PACKAGE_GREENPEAK_GP501)$(BR2_PACKAGE_GREENPEAK_GP711),y)
WEBBRIDGE_DEPENDENCIES += greenpeak
WEBBRIDGE_CONF_OPTS += -DGREENPEAK_REMOTE=ON
endif
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_QUEUECOMMUNICATOR),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_QUEUECOMMUNICATOR=ON
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_DEVICEINFO),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_DEVICEINFO=ON
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_BROWSER),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_BROWSER=ON
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBKITBROWSER),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBKITBROWSER=ON
WEBBRIDGE_DEPENDENCIES += wpe 
ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBKITBROWSER_AUTOSTART),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBKITBROWSER_AUTOSTART=true
else
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBKITBROWSER_AUTOSTART=false
endif
ifneq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBKITBROWSER_STARTURL),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBKITBROWSER_STARTURL=$(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBKITBROWSER_STARTURL)
endif
ifneq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBKITBROWSER_USERAGENT),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBKITBROWSER_USERAGENT=$(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBKITBROWSER_USERAGENT)
endif
ifneq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBKITBROWSER_MEMORYPROFILE),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBKITBROWSER_MEMORYPROFILE=$(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBKITBROWSER_MEMORYPROFILE)
endif
ifneq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBKITBROWSER_MEMORYPRESSURE),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBKITBROWSER_MEMORYPRESSURE=$(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBKITBROWSER_MEMORYPRESSURE)
endif
ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBKITBROWSER_MEDIADISKCACHE),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBKITBROWSER_MEDIADISKCACHE=true
endif
ifneq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBKITBROWSER_DISKCACHE),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBKITBROWSER_DISKCACHE=$(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBKITBROWSER_DISKCACHE)
endif
ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBKITBROWSER_XHRCACHE),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBKITBROWSER_XHRCACHE=false
endif
ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_YOUTUBE),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBKITBROWSER_YOUTUBE=ON
endif
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_DIALSERVER),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_DIALSERVER=ON
ifneq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_DIALSERVER_NAME),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_DIALSERVER_NAME="$(call qstrip,$(BR2_PACKAGE_WEBBRIDGE_PLUGIN_DIALSERVER_NAME))"
endif
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBSERVER),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBSERVER=ON
ifneq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBSERVER_PORT),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBSERVER_PORT=$(call qstrip,$(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBSERVER_PORT))
endif
ifneq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBSERVER_BIND),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBSERVER_BINDING=$(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBSERVER_BIND)
endif
ifneq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBSERVER_INTERFACE),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBSERVER_INTERFACE=$(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBSERVER_INTERFACE)
endif
ifneq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBSERVER_PATH),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_WEBSERVER_PATH=$(BR2_PACKAGE_WEBBRIDGE_PLUGIN_WEBSERVER_PATH)
endif
endif

ifneq ($(BR2_PACKAGE_WEBBRIDGE_IDLE_TIME),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_IDLE_TIME=$(call qstrip,$(BR2_PACKAGE_WEBBRIDGE_IDLE_TIME))
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_NXRESOURCECENTER),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_NXRESOURCECENTER=ON
WEBBRIDGE_DEPENDENCIES += bcm-refsw
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_PLUGIN_SNAPSHOT),y)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PLUGIN_SNAPSHOT=ON
WEBBRIDGE_DEPENDENCIES += rpi-userland
endif

ifeq ($(BR2_PACKAGE_WEBBRIDGE_NO_WEBUI),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_WEB_UI=ON
endif

ifneq ($(BR2_PACKAGE_WEBBRIDGE_PORT),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PORT=$(call qstrip,$(BR2_PACKAGE_WEBBRIDGE_PORT))
endif

ifneq ($(BR2_PACKAGE_WEBBRIDGE_BIND),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_BINDING=$(BR2_PACKAGE_WEBBRIDGE_BIND)
endif

ifneq ($(BR2_PACKAGE_WEBBRIDGE_IDLE_TIME),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_IDLE_TIME=$(call qstrip,$(BR2_PACKAGE_WEBBRIDGE_IDLE_TIME))
endif

ifneq ($(BR2_PACKAGE_WEBBRIDGE_PERSISTENT_PATH),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PERSISTENT_PATH=$(BR2_PACKAGE_WEBBRIDGE_PERSISTENT_PATH)
endif

ifneq ($(BR2_PACKAGE_WEBBRIDGE_DATA_PATH),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_DATA_PATH=$(BR2_PACKAGE_WEBBRIDGE_DATA_PATH)
endif

ifneq ($(BR2_PACKAGE_WEBBRIDGE_SYSTEM_PATH),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_SYSTEM_PATH=$(BR2_PACKAGE_WEBBRIDGE_SYSTEM_PATH)
endif

ifneq ($(BR2_PACKAGE_WEBBRIDGE_PROXYSTUB_PATH),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_PROXYSTUB_PATH=$(BR2_PACKAGE_WEBBRIDGE_PROXYSTUB_PATH)
endif

ifneq ($(BR2_PACKAGE_WEBBRIDGE_WEBSERVER_PATH),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_WEBSERVER_PATH=$(BR2_PACKAGE_WEBBRIDGE_WEBSERVER_PATH)
endif

ifneq ($(BR2_PACKAGE_WEBBRIDGE_WEBSERVER_PORT),)
WEBBRIDGE_CONF_OPTS += -DWEBBRIDGE_WEBSERVER_PORT=$(call qstrip,$(BR2_PACKAGE_WEBBRIDGE_WEBSERVER_PORT))
endif

define WEBBRIDGE_POST_TARGET_INITD
    $(INSTALL) -D -m 0755 package/webbridge/S80webbridge $(TARGET_DIR)/etc/init.d
endef

WEBBRIDGE_POST_INSTALL_TARGET_HOOKS += WEBBRIDGE_POST_TARGET_INITD

$(eval $(cmake-package))
