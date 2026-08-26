local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local videoUtilsModule = require(parent.VideoUtils)
local t = { PlayWhenReady = "PlayWhenReady" }

local function _(p1, p2)
	if p2 ~= nil then
		return p2, true
	elseif (p1 or "PlayWhenReady") == "PlayWhenReady" then
		return true, true
	end
	return false, false
end

local _ = function(value)
	return if value == nil or value == "" then nil elseif string.find(value, "://", 1, true) then value else `rbxassetid://{value}`
end

return function(p1)
	-- upvalues: t (ref), reactModule (ref), sduiCoreSystemModule (ref), videoUtilsModule (ref)
	local var1, var2
	local videoAssetId = p1.videoAssetId
	local var3 = if videoAssetId == nil or videoAssetId == "" then nil elseif string.find(videoAssetId, "://", 1, true) then videoAssetId else `rbxassetid://{videoAssetId}`
	videoAssetId = if p1.loop == nil then false else p1.loop
	local var4 = p1.muted == nil or p1.muted
	local var5 = p1.disableControls == nil or p1.disableControls
	local scaleType = p1.scaleType or Enum.ScaleType.Crop
	local playbackBehavior = p1.playbackBehavior
	local isPlaybackEnabledByClient = p1.isPlaybackEnabledByClient
	
	if isPlaybackEnabledByClient ~= nil then
		var1 = isPlaybackEnabledByClient
		var2 = true
	elseif (playbackBehavior or t.PlayWhenReady) == t.PlayWhenReady then
		var1 = true
		var2 = true
	else
		var1 = false
		var2 = false
	end
	local var6 = if p1.loadingImage == nil or p1.loadingImage == "" then p1.defaultLoadingImageComponent else nil
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), p1 (ref), sduiCoreSystemModule (copy), var2 (ref)
		if not var3 then
			p1.sduiContext.dependencies.logger.reportError(sduiCoreSystemModule.SduiErrors.SduiErrorType.InvalidProps, {
				propName = "videoAssetId",
				message = "Missing videoAssetId for video player",
				componentType = sduiCoreSystemModule.SduiComponentType.VideoPlayer,
				value = p1.videoAssetId or ""
			}, p1.sduiContext.appPage)
		end
		if not var2 then
			p1.sduiContext.dependencies.logger.reportError(sduiCoreSystemModule.SduiErrors.SduiErrorType.InvalidProps, {
				propName = "playbackBehavior",
				message = "Unsupported playbackBehavior for video player",
				componentType = sduiCoreSystemModule.SduiComponentType.VideoPlayer,
				value = p1.playbackBehavior
			}, p1.sduiContext.appPage)
		end
	end, {
		var2,
		p1.playbackBehavior,
		p1.sduiContext,
		p1.videoAssetId,
		var3
	})
	
	return if var3 then reactModule.createElement(videoUtilsModule.VideoPlayer, {
		video = var3,
		thumbnail = p1.loadingImage,
		thumbnailComponentOverride = var6,
		shouldStartPlayback = var1,
		muted = var4,
		looped = videoAssetId,
		disableActivation = var5,
		hideCenterPlayButton = var5,
		Size = UDim2.fromScale(1, 1),
		ScaleType = scaleType,
		cornerRadius = p1.cornerRadius,
		onVideoLoaded = p1.onVideoLoaded
	}) else nil
end