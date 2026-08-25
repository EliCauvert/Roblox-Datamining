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

return function(p0)
	-- upvalues: videoPlaybackCoordinatorModule (ref), reactModule (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), useLastInput (ref), appLifecycleObserverService (ref), videoEndReason (ref), experienceService (ref), videoPlaybackDetectionMethodModule (ref), videoHoverPlaybackDetectorModule (ref), videoViewportPlaybackDetectorModule (ref), videoSelectionPlaybackDetectorModule (ref), responsiveModule (ref)
	local videoPlaybackCoordinator = p0.videoPlaybackCoordinator or videoPlaybackCoordinatorModule.default
	local var11, var12 = reactModule.useState(false)
	local var13 = if fFlagLuaAppEdpMediaGalleryVideoPreview or fFlagLuaAppGameTileSelectionVideoPlayback then nil else useLastInput()
	local var14 = reactModule.useCallback(function(p1)
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
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: videoPlaybackCoordinator (ref), p0 (ref)
		videoPlaybackCoordinator:cancelPlayback(p0.videoKey, p2, p0.itemIndex, p0.videoAnalytics)
	end, {
		p0.videoKey,
		p0.itemIndex,
		p0.videoAnalytics,
		videoPlaybackCoordinator
	})
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var11 (ref), var12 (ref), videoPlaybackCoordinator (ref)
		local function _(p3)
			-- upvalues: p0 (copy), var11 (copy), var12 (copy)
			local var18 = p3 == p0.videoKey
			
			if var18 ~= var11 then
				p0.onPlaybackChange(var18)
				var12(var18)
			end
		end
		
		local var16 = videoPlaybackCoordinator.playingVideoKey == p0.videoKey
		
		if var16 ~= var11 then
			p0.onPlaybackChange(var16)
			var12(var16)
		end
		local changedConnection = videoPlaybackCoordinator.changed:connect(function(p4)
			-- upvalues: p0 (copy), var11 (copy), var12 (copy)
			local var19 = p4 == p0.videoKey
			
			if var19 ~= var11 then
				p0.onPlaybackChange(var19)
				var12(var19)
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
		p0.videoKey,
		p0.onPlaybackChange,
		videoPlaybackCoordinator,
		var11
	})
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), appLifecycleObserverService (copy), videoEndReason (copy), var15 (ref), experienceService (copy)
		local viewportVideoAutoplayController = p0.viewportVideoAutoplayController
		local current = p0.itemFrameRef.current
		local onHideConnection = appLifecycleObserverService.OnHide:Connect(function()
			-- upvalues: viewportVideoAutoplayController (ref), videoEndReason (copy), var15 (copy)
			if viewportVideoAutoplayController then
				viewportVideoAutoplayController:reset(videoEndReason.AppBackgrounded)
				
				return
			end
			var15(videoEndReason.AppBackgrounded)
		end)
		local var21 = experienceService:RegisterForExperienceJoin(function()
			-- upvalues: viewportVideoAutoplayController (ref), videoEndReason (copy), var15 (copy)
			if viewportVideoAutoplayController then
				viewportVideoAutoplayController:reset(videoEndReason.ExperienceLaunched)
				
				return
			end
			var15(videoEndReason.ExperienceLaunched)
		end)
		
		return function()
			-- upvalues: viewportVideoAutoplayController (ref), current (ref), videoEndReason (copy), var15 (copy), var21 (write), onHideConnection (write)
			if viewportVideoAutoplayController and current then
				viewportVideoAutoplayController:resetIfActiveInstance(current, videoEndReason.Unmounted)
			else
				var15(videoEndReason.Unmounted)
			end
			if var21 then
				var21:Disconnect()
				var21 = nil
			end
			if onHideConnection then
				onHideConnection:Disconnect()
				onHideConnection = nil
			end
		end
	end, {
		var15,
		p0.viewportVideoAutoplayController,
		p0.itemFrameRef
	})
	
	if fFlagLuaAppGameTileSelectionVideoPlayback then
		if p0.playbackDetectionMethod == videoPlaybackDetectionMethodModule.Hover then
			return reactModule.createElement(videoHoverPlaybackDetectorModule, {
				videoPlaybackCoordinator = videoPlaybackCoordinator,
				requestVideoPlayback = var14,
				cancelVideoPlayback = var15,
				isHovered = p0.isHovered
			})
		elseif p0.playbackDetectionMethod == videoPlaybackDetectionMethodModule.Viewport then
			return reactModule.createElement(videoViewportPlaybackDetectorModule, {
				videoPlaybackCoordinator = videoPlaybackCoordinator,
				requestVideoPlayback = var14,
				cancelVideoPlayback = var15,
				itemFrameRef = p0.itemFrameRef,
				isItemOccluded = p0.isItemOccluded,
				videoVisiblePercent = p0.videoVisiblePercent,
				viewportVideoAutoplayController = p0.viewportVideoAutoplayController
			})
		elseif p0.playbackDetectionMethod == videoPlaybackDetectionMethodModule.Selection then
			return reactModule.createElement(videoSelectionPlaybackDetectorModule, {
				requestVideoPlayback = var14,
				cancelVideoPlayback = var15,
				isSelected = p0.isSelected
			})
		end
	else
		return if p0.isHoverSupported then reactModule.createElement(videoHoverPlaybackDetectorModule, {
			videoPlaybackCoordinator = videoPlaybackCoordinator,
			requestVideoPlayback = var14,
			cancelVideoPlayback = var15,
			isHovered = p0.isHovered
		}) elseif fFlagLuaAppEdpMediaGalleryVideoPreview and p0.autoplay or var13 == responsiveModule.Input.Touch then reactModule.createElement(videoViewportPlaybackDetectorModule, {
			videoPlaybackCoordinator = videoPlaybackCoordinator,
			requestVideoPlayback = var14,
			cancelVideoPlayback = var15,
			itemFrameRef = p0.itemFrameRef,
			isItemOccluded = p0.isItemOccluded,
			videoVisiblePercent = p0.videoVisiblePercent,
			viewportVideoAutoplayController = p0.viewportVideoAutoplayController
		}) else nil
	end
end