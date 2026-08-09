local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local reactModule = require(parent.React)
local videoUtilsModule = require(parent.VideoUtils)
local videoPlayer = videoUtilsModule.VideoPlayer
local videoPlaybackCoordinator = videoUtilsModule.VideoPlaybackCoordinator
local _ = require(gameTile.GameTileTypes)
local fFlagLuaAppEdpMediaGalleryFullScreen = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local fFlagLuaAppHomeUnifiedVideoEngagementEvents = require(parent.SharedFlags).FFlagLuaAppHomeUnifiedVideoEngagementEvents
local fFlagLuaAppHomeTouchAutoplay = require(parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local fFlagLuaAppVideoTileDisableActivation = require(parent.SharedFlags).FFlagLuaAppVideoTileDisableActivation
local fFlagLuaAppVideoTileHideCenterPlayButton = require(parent.SharedFlags).FFlagLuaAppVideoTileHideCenterPlayButton

return function(p0) --[[ line: 40 | named "GameTileVideoThumbnail" ]]
	-- upvalues: reactModule (ref), fFlagLuaAppHomeTouchAutoplay (ref), videoPlaybackCoordinator (ref), fFlagLuaAppHomeUnifiedVideoEngagementEvents (ref), videoPlayer (ref), fFlagLuaAppVideoTileHideCenterPlayButton (ref), fFlagLuaAppVideoTileDisableActivation (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref)
	return reactModule.createElement(videoPlayer, {
		muted = true,
		video = p0.video,
		thumbnail = p0.image,
		shouldStartPlayback = p0.playing,
		looped = p0.looped,
		Size = p0.Size,
		ScaleType = if p0.isTileContained then Enum.ScaleType.Tile else nil,
		ZIndex = p0.ZIndex,
		cornerRadius = p0.cornerRadius,
		hideCenterPlayButton = if fFlagLuaAppVideoTileHideCenterPlayButton then true else nil,
		disableActivation = if fFlagLuaAppVideoTileDisableActivation then true else nil,
		onVideoLoaded = reactModule.useCallback(function(p1, p2) --[[ line: 42 ]]
			-- upvalues: p0 (ref), fFlagLuaAppHomeTouchAutoplay (copy), videoPlaybackCoordinator (copy)
			if p0.videoAnalytics then
				p0.videoAnalytics.reportVideoLoad(p0.itemIndex, if fFlagLuaAppHomeTouchAutoplay and p0.videoPlaybackCoordinator then p0.videoPlaybackCoordinator.currentPlaybackSessionId else videoPlaybackCoordinator.default.currentPlaybackSessionId, p1, p2)
			end
		end, {
			p0.itemIndex,
			p0.videoAnalytics,
			if fFlagLuaAppHomeTouchAutoplay then p0.videoPlaybackCoordinator else nil
		}),
		onVideoLooped = reactModule.useCallback(function() --[[ line: 62 ]]
			-- upvalues: p0 (ref), fFlagLuaAppHomeTouchAutoplay (copy), videoPlaybackCoordinator (copy)
			if p0.videoAnalytics then
				p0.videoAnalytics.reportVideoLoop(p0.itemIndex, if fFlagLuaAppHomeTouchAutoplay and p0.videoPlaybackCoordinator then p0.videoPlaybackCoordinator.currentPlaybackSessionId else videoPlaybackCoordinator.default.currentPlaybackSessionId)
			end
		end, {
			p0.itemIndex,
			p0.videoAnalytics,
			if fFlagLuaAppHomeTouchAutoplay then p0.videoPlaybackCoordinator else nil
		}),
		onVideoPlayerActivated = if fFlagLuaAppVideoTileDisableActivation then nil elseif fFlagLuaAppEdpMediaGalleryFullScreen then p0.onActivated else nil,
		videoAnalyticsContext = if fFlagLuaAppHomeUnifiedVideoEngagementEvents then if fFlagLuaAppHomeUnifiedVideoEngagementEvents then reactModule.useMemo(function() --[[ line: 82 ]]
			-- upvalues: p0 (ref), fFlagLuaAppHomeTouchAutoplay (copy), videoPlaybackCoordinator (copy)
			return {
				videoAnalyticsData = { source = "universe", sourceId = p0.universeId },
				getPlaybackSessionId = function() --[[ line: 88 ]]
					-- upvalues: fFlagLuaAppHomeTouchAutoplay (copy), p0 (copy), videoPlaybackCoordinator (copy)
					return if fFlagLuaAppHomeTouchAutoplay and p0.videoPlaybackCoordinator then p0.videoPlaybackCoordinator.currentPlaybackSessionId else videoPlaybackCoordinator.default.currentPlaybackSessionId
				end
			}
		end, {
			p0.universeId,
			if fFlagLuaAppHomeTouchAutoplay then p0.videoPlaybackCoordinator else nil
		}) else nil else nil
	})
end