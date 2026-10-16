local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local FindAnalyticsFieldInAncestorsFunction = SduiCoreSystemModule.findAnalyticsFieldInAncestors
local VideoUtilsModule = require(Parent.VideoUtils)
local FFlagLuaAppHomeMomentVideoFallback = require(Parent.SharedFlags).FFlagLuaAppHomeMomentVideoFallback
local config = { PlayWhenReady = "PlayWhenReady" }

local function _(p1, p2) --[[ Line: 22 | Named "resolvePlaybackState" ]]
	if p2 ~= nil then
		return p2, true
	elseif (p1 or "PlayWhenReady") == "PlayWhenReady" then
		return true, true
	else
		return false, false
	end
end

local _ = function(p1): string --[[ Line: 66 | Named "asString" ]]
	return if p1 == nil then "" else tostring(p1)
end

local _ = function(Text: string) --[[ Line: 70 | Named "normalizeAssetId" ]]
	return if Text == nil or Text == "" then nil elseif string.find(Text, "://", 1, true) then Text else `rbxassetid://{Text}`
end

return function(p1) --[[ Line: 80 | Named "SduiVideoPlayer" ]]
	-- upvalues: config (copy), FindAnalyticsFieldInAncestorsFunction (copy), ReactModule (copy), SduiCoreSystemModule (copy), VideoUtilsModule (copy), FFlagLuaAppHomeMomentVideoFallback (copy)
	local VideoAssetId: string = p1.videoAssetId
	local VideoAssetId1 = if VideoAssetId == nil or VideoAssetId == "" then nil elseif string.find(VideoAssetId, "://", 1, true) then VideoAssetId else `rbxassetid://{VideoAssetId}`
	local Loop = p1.loop ~= nil and p1.loop
	local NoMuted = p1.muted == nil or p1.muted
	local NoDisableControls = p1.disableControls == nil or p1.disableControls
	local ScaleType = p1.scaleType or Enum.ScaleType.Crop
	local PlaybackBehavior = p1.playbackBehavior
	local IsPlaybackEnabledByClient = p1.isPlaybackEnabledByClient
	local Flag = nil
	local Flag1 = nil
	
	if IsPlaybackEnabledByClient == nil then
		if (PlaybackBehavior or config.PlayWhenReady) == config.PlayWhenReady then
			Flag = true
			Flag1 = true
		else
			Flag = false
			Flag1 = false
		end
	else
		Flag = IsPlaybackEnabledByClient
		Flag1 = true
	end
	local Source = FindAnalyticsFieldInAncestorsFunction("source", p1.analyticsContext)
	local Text: string = if Source == nil then "" else tostring(Source)
	local SourceId = FindAnalyticsFieldInAncestorsFunction("sourceId", p1.analyticsContext)
	local Text1: string = if SourceId == nil then "" else tostring(SourceId)
	local VideoPlaybackContext = p1.sduiContext.videoPlaybackContext
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 95 ]]
		-- upvalues: Text (copy), Text1 (copy), VideoPlaybackContext (copy)
		return {
			videoAnalyticsData = { source = Text, sourceId = Text1 },
			getPlaybackSessionId = function() --[[ Line: 101 ]]
				-- upvalues: VideoPlaybackContext (upval)
				return if VideoPlaybackContext then VideoPlaybackContext.videoPlaybackCoordinator.currentPlaybackSessionId else nil
			end
		}
	end, { Text, Text1, VideoPlaybackContext })
	local DefaultLoadingImageComponent = if p1.loadingImage == nil or p1.loadingImage == "" then p1.defaultLoadingImageComponent else nil
	ReactModule.useEffect(function() --[[ Line: 115 ]]
		-- upvalues: VideoAssetId1 (copy), p1 (copy), SduiCoreSystemModule (upval), Flag1 (copy), Text (copy), Text1 (copy)
		if not VideoAssetId1 then
			p1.sduiContext.dependencies.logger.reportError(SduiCoreSystemModule.SduiErrors.SduiErrorType.InvalidProps, {
				propName = "videoAssetId",
				message = "Missing videoAssetId for video player",
				componentType = SduiCoreSystemModule.SduiComponentType.VideoPlayer,
				value = p1.videoAssetId or ""
			}, p1.sduiContext.appPage)
		end
		if not Flag1 then
			p1.sduiContext.dependencies.logger.reportError(SduiCoreSystemModule.SduiErrors.SduiErrorType.InvalidProps, {
				propName = "playbackBehavior",
				message = "Unsupported playbackBehavior for video player",
				componentType = SduiCoreSystemModule.SduiComponentType.VideoPlayer,
				value = p1.playbackBehavior
			}, p1.sduiContext.appPage)
		end
		if Text == "" or Text1 == "" then
			p1.sduiContext.dependencies.logger.reportError(SduiCoreSystemModule.SduiErrors.SduiErrorType.InvalidProps, {
				propName = "analyticsData",
				value = "",
				message = "Missing source or sourceId for video player analytics",
				componentType = SduiCoreSystemModule.SduiComponentType.VideoPlayer
			}, p1.sduiContext.appPage)
		end
	end, {
		Flag1, p1.playbackBehavior, p1.sduiContext, p1.videoAssetId, Text, Text1,
		VideoAssetId1
	})
	
	return if VideoAssetId1 then ReactModule.createElement(VideoUtilsModule.VideoPlayer, {
		video = VideoAssetId1,
		accessContext = if FFlagLuaAppHomeMomentVideoFallback then p1.accessContext else nil,
		thumbnail = p1.loadingImage,
		thumbnailComponentOverride = DefaultLoadingImageComponent,
		shouldStartPlayback = Flag,
		muted = NoMuted,
		looped = Loop,
		disableActivation = NoDisableControls,
		hideCenterPlayButton = NoDisableControls,
		Size = UDim2.fromScale(1, 1),
		ScaleType = ScaleType,
		cornerRadius = p1.cornerRadius,
		onVideoLoaded = p1.onVideoLoaded,
		onVideoLooped = p1.onVideoLooped,
		videoAnalyticsContext = UseMemoResult
	}) else nil
end