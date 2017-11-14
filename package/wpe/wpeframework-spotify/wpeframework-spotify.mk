################################################################################
#
# wpeframework-spotify
#
################################################################################
WPEFRAMEWORK_SPOTIFY_VERSION = cf5368e41273906b4297af483a5a244e441a4637
WPEFRAMEWORK_SPOTIFY_SITE_METHOD = git
WPEFRAMEWORK_SPOTIFY_SITE = git@github.com:WebPlatformForEmbedded/WPEPluginSpotify.git
WPEFRAMEWORK_SPOTIFY_INSTALL_STAGING = YES
WPEFRAMEWORK_SPOTIFY_DEPENDENCIES = wpeframework

WPEFRAMEWORK_SPOTIFY_CONF_OPTS += -DBUILD_REFERENCE=${WPEFRAMEWORK_SPOTIFY_VERSION}

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_DEBUG),y)
WPEFRAMEWORK_SPOTIFY_CONF_OPTS += -DCMAKE_BUILD_TYPE=Debug
endif

define WPEFRAMEWORK_SPOTIFY_POST_TARGET_REMOVE_HEADERS
    rm -rf $(TARGET_DIR)/usr/include/WPEFramework
endef

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_INSTALL_HEADERS),y)
WPEFRAMEWORK_SPOTIFY_POST_INSTALL_TARGET_HOOKS += WPEFRAMEWORK_SPOTIFY_POST_TARGET_REMOVE_HEADERS
endif

$(eval $(cmake-package))