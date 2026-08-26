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
local videoPlaybackDetectionMethodModule = require(videoUtils.VideoPlaybackDetectionMethod)
local videoSelectionPlaybackDetectorModule = require(videoUtils.VideoSelectionPlaybackDetector)
local videoViewportPlaybackDetectorModule = require(videoUtils.VideoViewportPlaybackDetector)
local _ = require(videoUtils.ViewportVideoAutoplayController)
local fFlagLuaAppEdpMediaGalleryVideoPreview = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local fFlagLuaAppGameTileSelectionVideoPlayback = require(parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback

return function(p1)
	-- upvalues: videoPlaybackCoordinatorModule (ref), reactModule (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), useLastInput (ref), appLifecycleObserverService (ref), videoEndReason (ref), experienceService (ref), videoPlaybackDetectionMethodModule (ref), videoHoverPlaybackDetectorModule (ref), videoViewportPlaybackDetectorModule (ref), videoSelectionPlaybackDetectorModule (ref), responsiveModule (ref)
	local videoPlaybackCoordinator = p1.videoPlaybackCoordinator or videoPlaybackCoordinatorModule.default
	local var1, var2 = reactModule.useState(false)
	local var3 = if fFlagLuaAppEdpMediaGalleryVideoPreview or fFlagLuaAppGameTileSelectionVideoPlayback then nil else useLastInput()
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), videoPlaybackCoordinator (ref)
		if p1.onPlaybackCandidate then
			p1.onPlaybackCandidate()
		end
		if p1.isVideoEligible then
			videoPlaybackCoordinator:requestPlayback(p1.videoKey, p2, p1.videoDwellTimeInSec, p1.itemIndex, p1.videoAnalytics)
			
			return
		elseif p1.onVideoIneligible then
			p1.onVideoIneligible(videoPlaybackCoordinator.currentPlaybackSessionId)
		end
	end, {
		p1.videoKey, p1.itemIndex, p1.videoAnalytics, p1.isVideoEligible,
		p1.onVideoIneligible, p1.onPlaybackCandidate, p1.videoDwellTimeInSec,
		videoPlaybackCoordinator
	})
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: videoPlaybackCoordinator (ref), p1 (ref)
		videoPlaybackCoordinator:cancelPlayback(p1.videoKey, p2, p1.itemIndex, p1.videoAnalytics)
	end, {
		p1.videoKey,
		p1.itemIndex,
		p1.videoAnalytics,
		videoPlaybackCoordinator
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref), var2 (ref), videoPlaybackCoordinator (ref)
		local function _(p2)
			-- upvalues: p1 (copy), var1 (copy), var2 (copy)
			local var6 = p2 == p1.videoKey
			
			if var6 ~= var1 then
				p1.onPlaybackChange(var6)
				var2(var6)
			end
		end
		
		local var6 = videoPlaybackCoordinator.playingVideoKey == p1.videoKey
		
		if var6 ~= var1 then
			p1.onPlaybackChange(var6)
			var2(var6)
		end
		local changedConnection = videoPlaybackCoordinator.changed:connect(function(p2)
			-- upvalues: p1 (copy), var1 (copy), var2 (copy)
			local var7 = p2 == p1.videoKey
			
			if var7 ~= var1 then
				p1.onPlaybackChange(var7)
				var2(var7)
			end
		end)
		
		return function()
			-- upvalues: changedConnection (write)
			if changedConnection ~= nil then
				changedConnection:disconnect()
				changedConnection = nil
			end
		end
	end, {
		p1.videoKey,
		p1.onPlaybackChange,
		videoPlaybackCoordinator,
		var1
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), appLifecycleObserverService (copy), videoEndReason (copy), var5 (ref), experienceService (copy)
		local viewportVideoAutoplayController = p1.viewportVideoAutoplayController
		local current = p1.itemFrameRef.current
		local onHideConnection = appLifecycleObserverService.OnHide:Connect(function()
			-- upvalues: viewportVideoAutoplayController (ref), videoEndReason (copy), var5 (copy)
			if viewportVideoAutoplayController then
				viewportVideoAutoplayController:reset(videoEndReason.AppBackgrounded)
				
				return
			end
			var5(videoEndReason.AppBackgrounded)
		end)
		local var6 = experienceService:RegisterForExperienceJoin(function()
			-- upvalues: viewportVideoAutoplayController (ref), videoEndReason (copy), var5 (copy)
			if viewportVideoAutoplayController then
				viewportVideoAutoplayController:reset(videoEndReason.ExperienceLaunched)
				
				return
			end
			var5(videoEndReason.ExperienceLaunched)
		end)
		
		return function()
			-- upvalues: viewportVideoAutoplayController (ref), current (ref), videoEndReason (copy), var5 (copy), var6 (write), onHideConnection (write)
			if viewportVideoAutoplayController and current then
				viewportVideoAutoplayController:resetIfActiveInstance(current, videoEndReason.Unmounted)
			else
				var5(videoEndReason.Unmounted)
			end
			if var6 then
				var6:Disconnect()
				var6 = nil
			end
			if onHideConnection then
				onHideConnection:Disconnect()
				onHideConnection = nil
			end
		end
	end, {
		var5,
		p1.viewportVideoAutoplayController,
		p1.itemFrameRef
	})
	
	if fFlagLuaAppGameTileSelectionVideoPlayback then
		if p1.playbackDetectionMethod == videoPlaybackDetectionMethodModule.Hover then
			return reactModule.createElement(videoHoverPlaybackDetectorModule, {
				videoPlaybackCoordinator = videoPlaybackCoordinator,
				requestVideoPlayback = var4,
				cancelVideoPlayback = var5,
				isHovered = p1.isHovered
			})
		elseif p1.playbackDetectionMethod == videoPlaybackDetectionMethodModule.Viewport then
			return reactModule.createElement(videoViewportPlaybackDetectorModule, {
				videoPlaybackCoordinator = videoPlaybackCoordinator,
				requestVideoPlayback = var4,
				cancelVideoPlayback = var5,
				itemFrameRef = p1.itemFrameRef,
				isItemOccluded = p1.isItemOccluded,
				videoVisiblePercent = p1.videoVisiblePercent,
				viewportVideoAutoplayController = p1.viewportVideoAutoplayController
			})
		elseif p1.playbackDetectionMethod == videoPlaybackDetectionMethodModule.Selection then
			return reactModule.createElement(videoSelectionPlaybackDetectorModule, {
				requestVideoPlayback = var4,
				cancelVideoPlayback = var5,
				isSelected = p1.isSelected
			})
		end
	else
		return if p1.isHoverSupported then reactModule.createElement(videoHoverPlaybackDetectorModule, {
			videoPlaybackCoordinator = videoPlaybackCoordinator,
			requestVideoPlayback = var4,
			cancelVideoPlayback = var5,
			isHovered = p1.isHovered
		}) elseif fFlagLuaAppEdpMediaGalleryVideoPreview and p1.autoplay or var3 == responsiveModule.Input.Touch then reactModule.createElement(videoViewportPlaybackDetectorModule, {
			videoPlaybackCoordinator = videoPlaybackCoordinator,
			requestVideoPlayback = var4,
			cancelVideoPlayback = var5,
			itemFrameRef = p1.itemFrameRef,
			isItemOccluded = p1.isItemOccluded,
			videoVisiblePercent = p1.videoVisiblePercent,
			viewportVideoAutoplayController = p1.viewportVideoAutoplayController
		}) else nil
	end
end