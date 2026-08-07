local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local reactModule = require(parent.React)
local videoUtilsModule = require(parent.VideoUtils)
local videoPlayer = videoUtilsModule.VideoPlayer
local videoPlaybackCoordinator = videoUtilsModule.VideoPlaybackCoordinator
local _ = require(gameTile.GameTileTypes)
local fFlagLuaAppEdpMediaGalleryFullScreen = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local fFlagLuaAppVideoTileDisableActivation = require(parent.SharedFlags).FFlagLuaAppVideoTileDisableActivation
local fFlagLuaAppVideoTileHideCenterPlayButton = require(parent.SharedFlags).FFlagLuaAppVideoTileHideCenterPlayButton

return function(p0) --[[ line: 37 | named "GameTileVideoThumbnail" ]]
	-- upvalues: reactModule (ref), videoPlaybackCoordinator (ref), videoPlayer (ref), fFlagLuaAppVideoTileHideCenterPlayButton (ref), fFlagLuaAppVideoTileDisableActivation (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref)
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
		onVideoLoaded = reactModule.useCallback(function(p1, p2) --[[ line: 39 ]]
			-- upvalues: p0 (ref), videoPlaybackCoordinator (copy)
			if p0.videoAnalytics then
				p0.videoAnalytics.reportVideoLoad(p0.itemIndex, if p0.videoPlaybackCoordinator then p0.videoPlaybackCoordinator.currentPlaybackSessionId else videoPlaybackCoordinator.default.currentPlaybackSessionId, p1, p2)
			end
		end, {
			p0.itemIndex,
			p0.videoAnalytics,
			p0.videoPlaybackCoordinator
		}),
		onVideoLooped = reactModule.useCallback(function() --[[ line: 59 ]]
			-- upvalues: p0 (ref), videoPlaybackCoordinator (copy)
			if p0.videoAnalytics then
				p0.videoAnalytics.reportVideoLoop(p0.itemIndex, if p0.videoPlaybackCoordinator then p0.videoPlaybackCoordinator.currentPlaybackSessionId else videoPlaybackCoordinator.default.currentPlaybackSessionId)
			end
		end, {
			p0.itemIndex,
			p0.videoAnalytics,
			p0.videoPlaybackCoordinator
		}),
		onVideoPlayerActivated = if fFlagLuaAppVideoTileDisableActivation then nil elseif fFlagLuaAppEdpMediaGalleryFullScreen then p0.onActivated else nil,
		videoAnalyticsContext = reactModule.useMemo(function() --[[ line: 76 ]]
			-- upvalues: p0 (ref), videoPlaybackCoordinator (copy)
			return {
				videoAnalyticsData = { source = "universe", sourceId = p0.universeId },
				getPlaybackSessionId = function() --[[ line: 82 ]]
					-- upvalues: p0 (copy), videoPlaybackCoordinator (copy)
					return if p0.videoPlaybackCoordinator then p0.videoPlaybackCoordinator.currentPlaybackSessionId else videoPlaybackCoordinator.default.currentPlaybackSessionId
				end
			}
		end, { p0.universeId, p0.videoPlaybackCoordinator })
	})
end