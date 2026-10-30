local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local Signal = require(Parent.AppCommonLib).Signal
local _ = require(VideoUtils.Analytics.VideoAnalyticsTypes)
local GetIsInstanceVisibleModule = require(VideoUtils.getIsInstanceVisible)
local FFlagLuaAppEdpMediaGalleryFullScreen = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppOneByTwoHoverIdleAutoplay = require(Parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback = require(Parent.SharedFlags).FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback
local VideoPlaybackCoordinatorModule = {}
VideoPlaybackCoordinatorModule.__index = VideoPlaybackCoordinatorModule
VideoPlaybackCoordinatorModule.preferredFramerateThrottling = false
VideoPlaybackCoordinatorModule.isSettingFramerateThrottleAllowedByPolicy = false
local Count = 0

function VideoPlaybackCoordinatorModule.new()
	-- upvalues: Signal (copy), VideoPlaybackCoordinatorModule (copy)
	local config = {
		playingVideoKey = nil,
		currentPlaybackSessionId = nil,
		currentplaybackSessionStartTime = nil,
		videoAnalytics = nil,
		playingVideoItemIndex = nil,
		changed = Signal.new(),
		videoDwellTaskHandles = {}
	}
	setmetatable(config, VideoPlaybackCoordinatorModule)
	
	return config
end

function VideoPlaybackCoordinatorModule:__setRunServiceThrottleFramerateEnabled(PreferredFramerateThrottling)
	-- upvalues: VideoPlaybackCoordinatorModule (copy), RunService (copy)
	if VideoPlaybackCoordinatorModule.isSettingFramerateThrottleAllowedByPolicy then
		RunService:setThrottleFramerateEnabled(PreferredFramerateThrottling)
		
		return
	end
end

function VideoPlaybackCoordinatorModule:isPlaybackAllowed(p1, p2)
	-- upvalues: FFlagLuaAppEdpMediaGalleryFullScreen (copy)
	return (not FFlagLuaAppEdpMediaGalleryFullScreen or not p2) and p1
end

function VideoPlaybackCoordinatorModule.isPlaybackCandidate(p1, p2, p3, p4, p5, p6)
	-- upvalues: GetIsInstanceVisibleModule (copy)
	return if p1:isPlaybackAllowed(p2, p3) then GetIsInstanceVisibleModule(p4.current, p5, p6) else false
end

function VideoPlaybackCoordinatorModule:forcePlayback(PlayingVideoKey, p1, p2, p3)
	if self.playingVideoKey ~= PlayingVideoKey then
		self:__cancelCurrentPlayback(p1, p2, nil, self.videoAnalytics)
		self:requestPlayback(PlayingVideoKey, false, 0, p2, p3)
		
		return
	end
end

function VideoPlaybackCoordinatorModule:requestPlayback(PlayingVideoKey, p1, Delay, PlayingVideoItemIndex, VideoAnalytics)
	if self.playingVideoKey == PlayingVideoKey then return end
	if self.videoDwellTaskHandles[PlayingVideoKey] ~= nil then return end
	if p1 then
		self.videoDwellTaskHandles[PlayingVideoKey] = task.delay(Delay, function()
			-- upvalues: self (copy), PlayingVideoKey (copy), PlayingVideoItemIndex (copy), VideoAnalytics (copy)
			self.videoDwellTaskHandles[PlayingVideoKey] = nil
			self:__startPlayback(PlayingVideoKey, PlayingVideoItemIndex, VideoAnalytics)
		end)
		
		return
	else
		self:__startPlayback(PlayingVideoKey, PlayingVideoItemIndex, VideoAnalytics)
	end
end

function VideoPlaybackCoordinatorModule:__startPlayback(PlayingVideoKey, PlayingVideoItemIndex, VideoAnalytics)
	-- upvalues: Count (ref), HttpService (copy)
	self:__setRunServiceThrottleFramerateEnabled(false)
	
	if self.playingVideoKey == nil then
		Count += 1
	end
	self.playingVideoKey = PlayingVideoKey
	self.currentPlaybackSessionId = HttpService:GenerateGUID(false)
	self.currentPlaybackSessionStartTime = tick()
	self.videoAnalytics = VideoAnalytics
	self.playingVideoItemIndex = PlayingVideoItemIndex
	
	if VideoAnalytics then
		VideoAnalytics.reportVideoPlay(PlayingVideoItemIndex, self.currentPlaybackSessionId)
	end
	self.changed:fire(PlayingVideoKey)
end

function VideoPlaybackCoordinatorModule:cancelPlayback(PlayingVideoKey, p1, p2, p3)
	-- upvalues: Count (ref), VideoPlaybackCoordinatorModule (copy)
	if self.playingVideoKey == PlayingVideoKey then
		self:__cancelCurrentPlayback(p1, p2, nil, p3)
	elseif self.videoDwellTaskHandles[PlayingVideoKey] ~= nil then
		task.cancel(self.videoDwellTaskHandles[PlayingVideoKey])
		self.videoDwellTaskHandles[PlayingVideoKey] = nil
	end
	if Count == 0 then
		self:__setRunServiceThrottleFramerateEnabled(VideoPlaybackCoordinatorModule.preferredFramerateThrottling)
	end
end

function VideoPlaybackCoordinatorModule:reset(p1, _, p2, _)
	-- upvalues: Count (ref), VideoPlaybackCoordinatorModule (copy), FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (copy)
	if self.playingVideoKey ~= nil then
		self:__cancelCurrentPlayback(p1, self.playingVideoItemIndex, p2, self.videoAnalytics)
	end
	for _, videoDwellTaskHandle in self.videoDwellTaskHandles do
		if videoDwellTaskHandle ~= nil then
			task.cancel(videoDwellTaskHandle)
		end
	end
	self.videoDwellTaskHandles = {}
	
	if Count == 0 then
		self:__setRunServiceThrottleFramerateEnabled(VideoPlaybackCoordinatorModule.preferredFramerateThrottling)
	end
	if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback and self.onPlaybackReset then
		self.onPlaybackReset(p1, p2)
	end
end

function VideoPlaybackCoordinatorModule:cancelPendingDwells()
	for _, videoDwellTaskHandle in self.videoDwellTaskHandles do
		if videoDwellTaskHandle ~= nil then
			task.cancel(videoDwellTaskHandle)
		end
	end
	self.videoDwellTaskHandles = {}
end

function VideoPlaybackCoordinatorModule:__cancelCurrentPlayback(p3, PlayingVideoItemIndex, p4, VideoAnalytics)
	-- upvalues: ArgCheckModule (copy), Count (ref), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy)
	local CurrentPlaybackSessionStartTime: number = self.currentPlaybackSessionStartTime
	
	if VideoAnalytics then
		local CurrentTime = tick()
		ArgCheckModule.assert(CurrentPlaybackSessionStartTime and CurrentPlaybackSessionStartTime <= CurrentTime)
		VideoAnalytics.reportVideoEnd(PlayingVideoItemIndex, p3, self.currentPlaybackSessionId, if CurrentPlaybackSessionStartTime and CurrentPlaybackSessionStartTime <= CurrentTime then CurrentTime - CurrentPlaybackSessionStartTime else -1, p4)
	end
	if self.playingVideoKey ~= nil then
		Count -= 1
	end
	self.playingVideoKey = nil
	self.currentPlaybackSessionId = nil
	self.currentPlaybackSessionStartTime = nil
	self.videoAnalytics = nil
	self.playingVideoItemIndex = nil
	
	if FFlagLuaAppOneByTwoHoverIdleAutoplay then
		self.changed:fire(nil, p3)
		
		return
	else
		self.changed:fire(nil)
	end
end

function VideoPlaybackCoordinatorModule:setIsSettingFramerateThrottleAllowedByPolicy(IsSettingFramerateThrottleAllowedByPolicy)
	-- upvalues: VideoPlaybackCoordinatorModule (copy)
	VideoPlaybackCoordinatorModule.isSettingFramerateThrottleAllowedByPolicy = IsSettingFramerateThrottleAllowedByPolicy
end

function VideoPlaybackCoordinatorModule:setPreferredFramerateThrottling(PreferredFramerateThrottling)
	-- upvalues: VideoPlaybackCoordinatorModule (copy)
	VideoPlaybackCoordinatorModule.preferredFramerateThrottling = PreferredFramerateThrottling
end

function VideoPlaybackCoordinatorModule.isAnyPlaying(): boolean
	-- upvalues: Count (ref)
	return Count > 0
end

VideoPlaybackCoordinatorModule.default = VideoPlaybackCoordinatorModule.new()

return VideoPlaybackCoordinatorModule