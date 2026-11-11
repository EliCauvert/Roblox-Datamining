local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local VideoUtilsModule = require(Parent.VideoUtils)
local VideoPlayer = VideoUtilsModule.VideoPlayer
local VideoPlaybackCoordinator = VideoUtilsModule.VideoPlaybackCoordinator
local _ = require(GameTile.GameTileTypes)
local FFlagLuaAppEdpMediaGalleryFullScreen = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppVideoTileDisableActivation = require(Parent.SharedFlags).FFlagLuaAppVideoTileDisableActivation
local FFlagLuaAppVideoTileHideCenterPlayButton = require(Parent.SharedFlags).FFlagLuaAppVideoTileHideCenterPlayButton

return function(p1)
	-- upvalues: ReactModule (copy), FFlagLuaAppHomeTouchAutoplay (copy), VideoPlaybackCoordinator (copy), VideoPlayer (copy), FFlagLuaAppVideoTileHideCenterPlayButton (copy), FFlagLuaAppVideoTileDisableActivation (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy)
	return ReactModule.createElement(VideoPlayer, {
		muted = true,
		video = p1.video,
		thumbnail = p1.image,
		shouldStartPlayback = p1.playing,
		looped = p1.looped,
		Size = p1.Size,
		ScaleType = if p1.isTileContained then Enum.ScaleType.Tile else nil,
		ZIndex = p1.ZIndex,
		cornerRadius = p1.cornerRadius,
		hideCenterPlayButton = if FFlagLuaAppVideoTileHideCenterPlayButton then true else nil,
		disableActivation = if FFlagLuaAppVideoTileDisableActivation then true else nil,
		onVideoLoaded = ReactModule.useCallback(function(p2, p3)
			-- upvalues: p1 (copy), FFlagLuaAppHomeTouchAutoplay (upval), VideoPlaybackCoordinator (upval)
			if p1.videoAnalytics then
				p1.videoAnalytics.reportVideoLoad(p1.itemIndex, if FFlagLuaAppHomeTouchAutoplay and p1.videoPlaybackCoordinator then p1.videoPlaybackCoordinator.currentPlaybackSessionId else VideoPlaybackCoordinator.default.currentPlaybackSessionId, p2, p3)
			end
		end, {
			p1.itemIndex,
			p1.videoAnalytics,
			if FFlagLuaAppHomeTouchAutoplay then p1.videoPlaybackCoordinator else nil
		}),
		onVideoLooped = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), FFlagLuaAppHomeTouchAutoplay (upval), VideoPlaybackCoordinator (upval)
			if p1.videoAnalytics then
				p1.videoAnalytics.reportVideoLoop(p1.itemIndex, if FFlagLuaAppHomeTouchAutoplay and p1.videoPlaybackCoordinator then p1.videoPlaybackCoordinator.currentPlaybackSessionId else VideoPlaybackCoordinator.default.currentPlaybackSessionId)
			end
		end, {
			p1.itemIndex,
			p1.videoAnalytics,
			if FFlagLuaAppHomeTouchAutoplay then p1.videoPlaybackCoordinator else nil
		}),
		onVideoPlayerActivated = if FFlagLuaAppVideoTileDisableActivation then nil elseif FFlagLuaAppEdpMediaGalleryFullScreen then p1.onActivated else nil,
		videoAnalyticsContext = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), FFlagLuaAppHomeTouchAutoplay (upval), VideoPlaybackCoordinator (upval)
			return {
				videoAnalyticsData = { source = "universe", sourceId = p1.universeId },
				getPlaybackSessionId = function()
					-- upvalues: FFlagLuaAppHomeTouchAutoplay (upval), p1 (upval), VideoPlaybackCoordinator (upval)
					return if FFlagLuaAppHomeTouchAutoplay and p1.videoPlaybackCoordinator then p1.videoPlaybackCoordinator.currentPlaybackSessionId else VideoPlaybackCoordinator.default.currentPlaybackSessionId
				end
			}
		end, {
			p1.universeId,
			if FFlagLuaAppHomeTouchAutoplay then p1.videoPlaybackCoordinator else nil
		})
	})
end