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

return function(p1)
	-- upvalues: reactModule (ref), videoPlaybackCoordinator (ref), videoPlayer (ref), fFlagLuaAppVideoTileHideCenterPlayButton (ref), fFlagLuaAppVideoTileDisableActivation (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref)
	return reactModule.createElement(videoPlayer, {
		muted = true,
		video = p1.video,
		thumbnail = p1.image,
		shouldStartPlayback = p1.playing,
		looped = p1.looped,
		Size = p1.Size,
		ScaleType = if p1.isTileContained then Enum.ScaleType.Tile else nil,
		ZIndex = p1.ZIndex,
		cornerRadius = p1.cornerRadius,
		hideCenterPlayButton = if fFlagLuaAppVideoTileHideCenterPlayButton then true else nil,
		disableActivation = if fFlagLuaAppVideoTileDisableActivation then true else nil,
		onVideoLoaded = reactModule.useCallback(function(p2, p3)
			-- upvalues: p1 (ref), videoPlaybackCoordinator (copy)
			if p1.videoAnalytics then
				p1.videoAnalytics.reportVideoLoad(p1.itemIndex, if p1.videoPlaybackCoordinator then p1.videoPlaybackCoordinator.currentPlaybackSessionId else videoPlaybackCoordinator.default.currentPlaybackSessionId, p2, p3)
			end
		end, {
			p1.itemIndex,
			p1.videoAnalytics,
			p1.videoPlaybackCoordinator
		}),
		onVideoLooped = reactModule.useCallback(function()
			-- upvalues: p1 (ref), videoPlaybackCoordinator (copy)
			if p1.videoAnalytics then
				p1.videoAnalytics.reportVideoLoop(p1.itemIndex, if p1.videoPlaybackCoordinator then p1.videoPlaybackCoordinator.currentPlaybackSessionId else videoPlaybackCoordinator.default.currentPlaybackSessionId)
			end
		end, {
			p1.itemIndex,
			p1.videoAnalytics,
			p1.videoPlaybackCoordinator
		}),
		onVideoPlayerActivated = if fFlagLuaAppVideoTileDisableActivation then nil elseif fFlagLuaAppEdpMediaGalleryFullScreen then p1.onActivated else nil,
		videoAnalyticsContext = reactModule.useMemo(function()
			-- upvalues: p1 (ref), videoPlaybackCoordinator (copy)
			return {
				videoAnalyticsData = { source = "universe", sourceId = p1.universeId },
				getPlaybackSessionId = function()
					-- upvalues: p1 (copy), videoPlaybackCoordinator (copy)
					return if p1.videoPlaybackCoordinator then p1.videoPlaybackCoordinator.currentPlaybackSessionId else videoPlaybackCoordinator.default.currentPlaybackSessionId
				end
			}
		end, { p1.universeId, p1.videoPlaybackCoordinator })
	})
end