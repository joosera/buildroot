WPEFRAMEWORK_DIALSERVER_VERSION = 0995c606497e2e156a9f03c8c1ac8c4b64e9a991
WPEFRAMEWORK_DIALSERVER_SITE_METHOD = git
WPEFRAMEWORK_DIALSERVER_SITE = git@github.com:Metrological/webbridge.git
WPEFRAMEWORK_DIALSERVER_INSTALL_STAGING = YES
WPEFRAMEWORK_DIALSERVER_DEPENDENCIES = WPEFramework

$(eval $(cmake-package))
