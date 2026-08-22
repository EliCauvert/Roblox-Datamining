local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local videoUtilsModule = require(parent.VideoUtils)
local t = { PlayWhenReady = "PlayWhenReady" }

local function _(p0, p1) --[[ line: 16 | named "resolvePlaybackState" ]]
	if p1 ~= nil then
		return p1, true
	elseif (p0 or "PlayWhenReady") == "PlayWhenReady" then
		return true, true
	end
	return false, false
end

local _ = function(value) --[[ line: 55 | named "normalizeAssetId" ]]
	return if value == nil or value == "" then nil elseif string.find(value, "://", 1, true) then value else `rbxassetid://{value}`
end

return function(p2) --[[ line: 65 | named "SduiVideoPlayer" ]]
	-- upvalues: t (ref), reactModule (ref), sduiCoreSystemModule (ref), videoUtilsModule (ref)
	local var8, var9
	local videoAssetId = p2.videoAssetId
	local var4 = if videoAssetId == nil or videoAssetId == "" then nil elseif string.find(videoAssetId, "://", 1, true) then videoAssetId else `rbxassetid://{videoAssetId}`
	videoAssetId = if p2.loop == nil then false else p2.loop
	local var5 = p2.muted == nil or p2.muted
	local var6 = p2.disableControls == nil or p2.disableControls
	local scaleType = p2.scaleType or Enum.ScaleType.Crop
	local playbackBehavior = p2.playbackBehavior
	local isPlaybackEnabledByClient = p2.isPlaybackEnabledByClient
	
	if isPlaybackEnabledByClient ~= nil then
		var8 = isPlaybackEnabledByClient
		var9 = true
	elseif (playbackBehavior or t.PlayWhenReady) == t.PlayWhenReady then
		var8 = true
		var9 = true
	else
		var8 = false
		var9 = false
	end
	local var10 = if p2.loadingImage == nil or p2.loadingImage == "" then p2.defaultLoadingImageComponent else nil
	reactModule.useEffect(function() --[[ line: 82 ]]
		-- upvalues: var4 (ref), p2 (ref), sduiCoreSystemModule (copy), var9 (ref)
		if not var4 then
			p2.sduiContext.dependencies.logger.reportError(sduiCoreSystemModule.SduiErrors.SduiErrorType.InvalidProps, {
				propName = "videoAssetId",
				message = "Missing videoAssetId for video player",
				componentType = sduiCoreSystemModule.SduiComponentType.VideoPlayer,
				value = p2.videoAssetId or ""
			}, p2.sduiContext.appPage)
		end
		if not var9 then
			p2.sduiContext.dependencies.logger.reportError(sduiCoreSystemModule.SduiErrors.SduiErrorType.InvalidProps, {
				propName = "playbackBehavior",
				message = "Unsupported playbackBehavior for video player",
				componentType = sduiCoreSystemModule.SduiComponentType.VideoPlayer,
				value = p2.playbackBehavior
			}, p2.sduiContext.appPage)
		end
	end, {
		var9,
		p2.playbackBehavior,
		p2.sduiContext,
		p2.videoAssetId,
		var4
	})
	
	return if var4 then reactModule.createElement(videoUtilsModule.VideoPlayer, {
		video = var4,
		thumbnail = p2.loadingImage,
		thumbnailComponentOverride = var10,
		shouldStartPlayback = var8,
		muted = var5,
		looped = videoAssetId,
		disableActivation = var6,
		hideCenterPlayButton = var6,
		Size = UDim2.fromScale(1, 1),
		ScaleType = scaleType,
		cornerRadius = p2.cornerRadius,
		onVideoLoaded = p2.onVideoLoaded
	}) else nil
end