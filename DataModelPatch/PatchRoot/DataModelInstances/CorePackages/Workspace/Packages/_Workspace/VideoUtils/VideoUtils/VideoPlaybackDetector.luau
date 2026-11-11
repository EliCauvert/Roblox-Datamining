local ExperienceService = game:GetService("ExperienceService")
local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local _ = require(Parent.AppCommonLib)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local UseLastInputFunction = ResponsiveModule.useLastInput
local _ = require(VideoUtils.Analytics.VideoAnalyticsTypes)
local VideoEndReason = require(VideoUtils.Analytics.Enums).VideoEndReason
local VideoPlaybackCoordinatorModule = require(VideoUtils.VideoPlaybackCoordinator)
local VideoHoverPlaybackDetectorModule = require(VideoUtils.VideoHoverPlaybackDetector)
local VideoPlaybackDetectionMethodModule = require(VideoUtils.VideoPlaybackDetectionMethod)
local VideoSelectionPlaybackDetectorModule = require(VideoUtils.VideoSelectionPlaybackDetector)
local VideoViewportPlaybackDetectorModule = require(VideoUtils.VideoViewportPlaybackDetector)
local _ = require(VideoUtils.ViewportVideoAutoplayController)
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppGameTileSelectionVideoPlayback = require(Parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback

return function(p1)
	-- upvalues: VideoPlaybackCoordinatorModule (copy), ReactModule (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), FFlagLuaAppGameTileSelectionVideoPlayback (copy), UseLastInputFunction (copy), FFlagLuaAppHomeTouchAutoplay (copy), AppLifecycleObserverService (copy), VideoEndReason (copy), ExperienceService (copy), VideoPlaybackDetectionMethodModule (copy), VideoHoverPlaybackDetectorModule (copy), VideoViewportPlaybackDetectorModule (copy), VideoSelectionPlaybackDetectorModule (copy), ResponsiveModule (copy)
	local VideoPlaybackCoordinator = p1.videoPlaybackCoordinator or VideoPlaybackCoordinatorModule.default
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseLastInputResult = if FFlagLuaAppEdpMediaGalleryVideoPreview or FFlagLuaAppGameTileSelectionVideoPlayback then nil else UseLastInputFunction()
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), VideoPlaybackCoordinator (copy)
		if p1.onPlaybackCandidate then
			p1.onPlaybackCandidate()
		end
		if p1.isVideoEligible then
			VideoPlaybackCoordinator:requestPlayback(p1.videoKey, p2, p1.videoDwellTimeInSec, p1.itemIndex, p1.videoAnalytics)
			
			return
		end
		if p1.onVideoIneligible then
			p1.onVideoIneligible(VideoPlaybackCoordinator.currentPlaybackSessionId)
		end
	end, {
		p1.videoKey, p1.itemIndex, p1.videoAnalytics, p1.isVideoEligible,
		p1.onVideoIneligible, p1.onPlaybackCandidate, p1.videoDwellTimeInSec,
		VideoPlaybackCoordinator
	})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: VideoPlaybackCoordinator (copy), p1 (copy)
		VideoPlaybackCoordinator:cancelPlayback(p1.videoKey, p2, p1.itemIndex, p1.videoAnalytics)
	end, {
		p1.videoKey,
		p1.itemIndex,
		p1.videoAnalytics,
		VideoPlaybackCoordinator
	})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult (copy), UseStateResult2 (copy), VideoPlaybackCoordinator (copy)
		local function _(VideoKey)
			-- upvalues: p1 (upval), UseStateResult (upval), UseStateResult2 (upval)
			local IsVideoKeyMatch = VideoKey == p1.videoKey
			
			if IsVideoKeyMatch ~= UseStateResult then
				p1.onPlaybackChange(IsVideoKeyMatch)
				UseStateResult2(IsVideoKeyMatch)
			end
		end
		
		local IsPlayingVideoKeyMatch = VideoPlaybackCoordinator.playingVideoKey == p1.videoKey
		
		if IsPlayingVideoKeyMatch ~= UseStateResult then
			p1.onPlaybackChange(IsPlayingVideoKeyMatch)
			UseStateResult2(IsPlayingVideoKeyMatch)
		end
		local ChangedConnection = VideoPlaybackCoordinator.changed:connect(function(VideoKey)
			-- upvalues: p1 (upval), UseStateResult (upval), UseStateResult2 (upval)
			local IsVideoKeyMatch = VideoKey == p1.videoKey
			
			if IsVideoKeyMatch ~= UseStateResult then
				p1.onPlaybackChange(IsVideoKeyMatch)
				UseStateResult2(IsVideoKeyMatch)
			end
		end)
		
		return function()
			-- upvalues: ChangedConnection (ref)
			if ChangedConnection ~= nil then
				ChangedConnection:disconnect()
				ChangedConnection = nil
			end
		end
	end, {
		p1.videoKey,
		p1.onPlaybackChange,
		VideoPlaybackCoordinator,
		UseStateResult
	})
	ReactModule.useEffect(function()
		-- upvalues: FFlagLuaAppHomeTouchAutoplay (upval), p1 (copy), AppLifecycleObserverService (upval), VideoEndReason (upval), UseResult1 (copy), ExperienceService (upval)
		local ViewportVideoAutoplayController = nil
		local Current = nil
		
		if FFlagLuaAppHomeTouchAutoplay then
			ViewportVideoAutoplayController = p1.viewportVideoAutoplayController
			Current = p1.itemFrameRef.current
		end
		local OnHideConnection = AppLifecycleObserverService.OnHide:Connect(function()
			-- upvalues: FFlagLuaAppHomeTouchAutoplay (upval), ViewportVideoAutoplayController (ref), VideoEndReason (upval), UseResult1 (upval)
			if FFlagLuaAppHomeTouchAutoplay and ViewportVideoAutoplayController then
				ViewportVideoAutoplayController:reset(VideoEndReason.AppBackgrounded)
				
				return
			else
				UseResult1(VideoEndReason.AppBackgrounded)
			end
		end)
		local RegisterForExperienceJoinResult = ExperienceService:RegisterForExperienceJoin(function()
			-- upvalues: FFlagLuaAppHomeTouchAutoplay (upval), ViewportVideoAutoplayController (ref), VideoEndReason (upval), UseResult1 (upval)
			if FFlagLuaAppHomeTouchAutoplay and ViewportVideoAutoplayController then
				ViewportVideoAutoplayController:reset(VideoEndReason.ExperienceLaunched)
				
				return
			else
				UseResult1(VideoEndReason.ExperienceLaunched)
			end
		end)
		
		return function()
			-- upvalues: FFlagLuaAppHomeTouchAutoplay (upval), ViewportVideoAutoplayController (ref), Current (ref), VideoEndReason (upval), UseResult1 (upval), RegisterForExperienceJoinResult (ref), OnHideConnection (ref)
			if FFlagLuaAppHomeTouchAutoplay and ViewportVideoAutoplayController and Current then
				ViewportVideoAutoplayController:resetIfActiveInstance(Current, VideoEndReason.Unmounted)
			else
				UseResult1(VideoEndReason.Unmounted)
			end
			if RegisterForExperienceJoinResult then
				RegisterForExperienceJoinResult:Disconnect()
				RegisterForExperienceJoinResult = nil
			end
			if OnHideConnection then
				OnHideConnection:Disconnect()
				OnHideConnection = nil
			end
		end
	end, {
		UseResult1,
		if FFlagLuaAppHomeTouchAutoplay then p1.viewportVideoAutoplayController else nil,
		if FFlagLuaAppHomeTouchAutoplay then p1.itemFrameRef else nil
	})
	
	if FFlagLuaAppGameTileSelectionVideoPlayback then
		if p1.playbackDetectionMethod == VideoPlaybackDetectionMethodModule.Hover then
			return ReactModule.createElement(VideoHoverPlaybackDetectorModule, {
				videoPlaybackCoordinator = VideoPlaybackCoordinator,
				requestVideoPlayback = UseResult,
				cancelVideoPlayback = UseResult1,
				isHovered = p1.isHovered
			})
		elseif p1.playbackDetectionMethod == VideoPlaybackDetectionMethodModule.Viewport then
			return ReactModule.createElement(VideoViewportPlaybackDetectorModule, {
				videoPlaybackCoordinator = VideoPlaybackCoordinator,
				requestVideoPlayback = UseResult,
				cancelVideoPlayback = UseResult1,
				itemFrameRef = p1.itemFrameRef,
				isItemOccluded = p1.isItemOccluded,
				videoVisiblePercent = p1.videoVisiblePercent,
				viewportVideoAutoplayController = if FFlagLuaAppHomeTouchAutoplay then p1.viewportVideoAutoplayController else nil
			})
		elseif p1.playbackDetectionMethod == VideoPlaybackDetectionMethodModule.Selection then
			return ReactModule.createElement(VideoSelectionPlaybackDetectorModule, {
				requestVideoPlayback = UseResult,
				cancelVideoPlayback = UseResult1,
				isSelected = p1.isSelected
			})
		end
	elseif p1.isHoverSupported then
		return ReactModule.createElement(VideoHoverPlaybackDetectorModule, {
			videoPlaybackCoordinator = VideoPlaybackCoordinator,
			requestVideoPlayback = UseResult,
			cancelVideoPlayback = UseResult1,
			isHovered = p1.isHovered
		})
	elseif FFlagLuaAppEdpMediaGalleryVideoPreview and p1.autoplay or UseLastInputResult == ResponsiveModule.Input.Touch then
		return ReactModule.createElement(VideoViewportPlaybackDetectorModule, {
			videoPlaybackCoordinator = VideoPlaybackCoordinator,
			requestVideoPlayback = UseResult,
			cancelVideoPlayback = UseResult1,
			itemFrameRef = p1.itemFrameRef,
			isItemOccluded = p1.isItemOccluded,
			videoVisiblePercent = p1.videoVisiblePercent,
			viewportVideoAutoplayController = if FFlagLuaAppHomeTouchAutoplay then p1.viewportVideoAutoplayController else nil
		})
	end
	return nil
end