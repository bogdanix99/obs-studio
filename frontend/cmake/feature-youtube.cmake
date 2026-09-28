if(NOT YOUTUBE_CLIENTID OR YOUTUBE_CLIENTID STREQUAL "")
  set(
    YOUTUBE_CLIENTID
    "111793709140-1l5ms0nh204r8rd5lvb3pp4sl1eq6206.apps.googleusercontent.com"
    CACHE STRING
    "YouTube OAuth Client ID"
    FORCE
  )
endif()

if(NOT YOUTUBE_SECRET OR YOUTUBE_SECRET STREQUAL "")
  set(YOUTUBE_SECRET "4mQ8FST_7u0Aa5dkCIY2oS4Z" CACHE STRING "YouTube OAuth Secret" FORCE)
endif()

if(NOT YOUTUBE_CLIENTID_HASH MATCHES "^[a-fA-F0-9]+$")
  set(YOUTUBE_CLIENTID_HASH 0)
endif()

if(NOT YOUTUBE_SECRET_HASH MATCHES "^[a-fA-F0-9]+$")
  set(YOUTUBE_SECRET_HASH 0)
endif()

target_sources(
  obs-studio
  PRIVATE
    dialogs/OBSYoutubeActions.cpp
    dialogs/OBSYoutubeActions.hpp
    docks/YouTubeAppDock.cpp
    docks/YouTubeAppDock.hpp
    docks/YouTubeChatDock.cpp
    docks/YouTubeChatDock.hpp
    forms/OBSYoutubeActions.ui
    oauth/YoutubeAuth.cpp
    oauth/YoutubeAuth.hpp
    utility/YoutubeApiWrappers.cpp
    utility/YoutubeApiWrappers.hpp
)

target_enable_feature(obs-studio "YouTube API connection" YOUTUBE_ENABLED)
