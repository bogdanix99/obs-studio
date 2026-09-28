if(NOT YOUTUBE_CLIENTID OR YOUTUBE_CLIENTID STREQUAL "")
  set(YOUTUBE_CLIENTID
      "502758197176-v10ff4h26m1p8s7d8p5q6p0e6l2a7s0r.apps.googleusercontent.com"
      CACHE STRING "YouTube OAuth Client ID" FORCE)
endif()

if(NOT DEFINED YOUTUBE_SECRET)
  set(YOUTUBE_SECRET "" CACHE STRING "YouTube OAuth Secret" FORCE)
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
