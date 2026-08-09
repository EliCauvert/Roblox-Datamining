local experienceService = game:GetService("ExperienceService")
local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local _ = require(parent.AppCommonLib)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local useLastInput = responsiveModule.useLastInput
local _ = require(videoUtils.Analytics.VideoAnalyticsTypes)
local videoEndReason = require(videoUtils.Analytics.Enums).VideoEndReason
local videoPlaybackCoordinatorModule = require(videoUtils.VideoPlaybackCoordinator)
local videoHoverPlaybackDetectorModule = require(videoUtils.VideoHoverPlaybackDetector)
local videoViewportPlaybackDetectorModule = require(videoUtils.VideoViewportPlaybackDetector)
local _ = require(videoUtils.ViewportVideoAutoplayController)
local fFlagLuaAppEdpMediaGalleryVideoPreview = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local fFlagLuaAppHomeTouchAutoplay = require(parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay

return function(p0) --[[ line: 46 | named "VideoPlaybackDetector" ]]
	-- upvalues: videoPlaybackCoordinatorModule (ref), reactModule (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref), useLastInput (ref), fFlagLuaAppHomeTouchAutoplay (ref), appLifecycleObserverService (ref), videoEndReason (ref), experienceService (ref), videoHoverPlaybackDetectorModule (ref), responsiveModule (ref), videoViewportPlaybackDetectorModule (ref)
	local videoPlaybackCoordinator = p0.videoPlaybackCoordinator or videoPlaybackCoordinatorModule.default
	local var9, var10 = reactModule.useState(false)
	local var11 = if fFlagLuaAppEdpMediaGalleryVideoPreview then nil else useLastInput()
	local var12 = reactModule.useCallback(function(p1) --[[ line: 55 ]]
		-- upvalues: p0 (ref), videoPlaybackCoordinator (ref)
		if p0.onPlaybackCandidate then
			p0.onPlaybackCandidate()
		end
		if p0.isVideoEligible then
			videoPlaybackCoordinator:requestPlayback(p0.videoKey, p1, p0.videoDwellTimeInSec, p0.itemIndex, p0.videoAnalytics)
			
			return
		elseif p0.onVideoIneligible then
			p0.onVideoIneligible(videoPlaybackCoordinator.currentPlaybackSessionId)
		end
	end, {
		p0.videoKey, p0.itemIndex, p0.videoAnalytics, p0.isVideoEligible,
		p0.onVideoIneligible, p0.onPlaybackCandidate, p0.videoDwellTimeInSec,
		videoPlaybackCoordinator
	})
	local var13 = reactModule.useCallback(function(p2) --[[ line: 85 ]]
		-- upvalues: videoPlaybackCoordinator (ref), p0 (ref)
		videoPlaybackCoordinator:cancelPlayback(p0.videoKey, p2, p0.itemIndex, p0.videoAnalytics)
	end, {
		p0.videoKey,
		p0.itemIndex,
		p0.videoAnalytics,
		videoPlaybackCoordinator
	})
	reactModule.useEffect(function() --[[ line: 97 ]]
		-- upvalues: p0 (ref), var9 (ref), var10 (ref), videoPlaybackCoordinator (ref)
		local function _(p3) --[[ line: 98 | named "checkAndUpdateState" ]]
			-- upvalues: p0 (copy), var9 (copy), var10 (copy)
			local var16 = p3 == p0.videoKey
			
			if var16 ~= var9 then
				p0.onPlaybackChange(var16)
				var10(var16)
			end
		end
		
		local var14 = videoPlaybackCoordinator.playingVideoKey == p0.videoKey
		
		if var14 ~= var9 then
			p0.onPlaybackChange(var14)
			var10(var14)
		end
		local changedConnection = videoPlaybackCoordinator.changed:connect(function(p4) --[[ line: 109 ]]
			-- upvalues: p0 (copy), var9 (copy), var10 (copy)
			local var17 = p4 == p0.videoKey
			
			if var17 ~= var9 then
				p0.onPlaybackChange(var17)
				var10(var17)
			end
		end)
		
		return function() --[[ line: 113 ]]
			-- upvalues: changedConnection (write)
			if changedConnection ~= nil then
				changedConnection:disconnect()
				changedConnection = nil
			end
		end
	end, {
		p0.videoKey,
		p0.onPlaybackChange,
		videoPlaybackCoordinator,
		var9
	})
	reactModule.useEffect(function() --[[ line: 123 ]]
		-- upvalues: fFlagLuaAppHomeTouchAutoplay (copy), p0 (ref), appLifecycleObserverService (copy), videoEndReason (copy), var13 (ref), experienceService (copy)
		local viewportVideoAutoplayController = nil
		local current = nil
		
		if fFlagLuaAppHomeTouchAutoplay then
			viewportVideoAutoplayController = p0.viewportVideoAutoplayController
			current = p0.itemFrameRef.current
		end
		local onHideConnection = appLifecycleObserverService.OnHide:Connect(function() --[[ line: 132 ]]
			-- upvalues: fFlagLuaAppHomeTouchAutoplay (copy), viewportVideoAutoplayController (write), videoEndReason (copy), var13 (copy)
			if fFlagLuaAppHomeTouchAutoplay and viewportVideoAutoplayController then
				viewportVideoAutoplayController:reset(videoEndReason.AppBackgrounded)
				
				return
			end
			var13(videoEndReason.AppBackgrounded)
		end)
		local var19 = experienceService:RegisterForExperienceJoin(function() --[[ line: 142 ]]
			-- upvalues: fFlagLuaAppHomeTouchAutoplay (copy), viewportVideoAutoplayController (write), videoEndReason (copy), var13 (copy)
			if fFlagLuaAppHomeTouchAutoplay and viewportVideoAutoplayController then
				viewportVideoAutoplayController:reset(videoEndReason.ExperienceLaunched)
				
				return
			end
			var13(videoEndReason.ExperienceLaunched)
		end)
		
		return function() --[[ line: 151 ]]
			-- upvalues: fFlagLuaAppHomeTouchAutoplay (copy), viewportVideoAutoplayController (write), current (write), videoEndReason (copy), var13 (copy), var19 (write), onHideConnection (write)
			if fFlagLuaAppHomeTouchAutoplay and viewportVideoAutoplayController and current then
				viewportVideoAutoplayController:resetIfActiveInstance(current, videoEndReason.Unmounted)
			else
				var13(videoEndReason.Unmounted)
			end
			if var19 then
				var19:Disconnect()
				var19 = nil
			end
			if onHideConnection then
				onHideConnection:Disconnect()
				onHideConnection = nil
			end
		end
	end, {
		var13,
		if fFlagLuaAppHomeTouchAutoplay then p0.viewportVideoAutoplayController else nil,
		if fFlagLuaAppHomeTouchAutoplay then p0.itemFrameRef else nil
	})
	
	return if p0.isHoverSupported then reactModule.createElement(videoHoverPlaybackDetectorModule, {
		videoPlaybackCoordinator = videoPlaybackCoordinator,
		requestVideoPlayback = var12,
		cancelVideoPlayback = var13,
		isHovered = p0.isHovered
	}) elseif fFlagLuaAppEdpMediaGalleryVideoPreview and p0.autoplay or var11 == responsiveModule.Input.Touch then reactModule.createElement(videoViewportPlaybackDetectorModule, {
		videoPlaybackCoordinator = videoPlaybackCoordinator,
		requestVideoPlayback = var12,
		cancelVideoPlayback = var13,
		itemFrameRef = p0.itemFrameRef,
		isItemOccluded = p0.isItemOccluded,
		videoVisiblePercent = p0.videoVisiblePercent,
		viewportVideoAutoplayController = if fFlagLuaAppHomeTouchAutoplay then p0.viewportVideoAutoplayController else nil
	}) else nil
end