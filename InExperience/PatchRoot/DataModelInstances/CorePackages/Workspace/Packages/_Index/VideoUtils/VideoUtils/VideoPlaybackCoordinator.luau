local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local argCheckModule = require(parent.ArgCheck)
local signal = require(parent.AppCommonLib).Signal
local _ = require(videoUtils.Analytics.VideoAnalyticsTypes)
local getIsInstanceVisibleModule = require(videoUtils.getIsInstanceVisible)
local fFlagLuaAppEdpMediaGalleryFullScreen = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local fFlagLuaAppVideoPlaybackRefCount = require(parent.SharedFlags).FFlagLuaAppVideoPlaybackRefCount
local t = {}
t.__index = t
t.preferredFramerateThrottling = false
t.isSettingFramerateThrottleAllowedByPolicy = false
local var1 = 0

function t.new()
	-- upvalues: signal (ref), t (ref)
	local t_1 = {
		playingVideoKey = nil,
		currentPlaybackSessionId = nil,
		currentplaybackSessionStartTime = nil,
		videoAnalytics = nil,
		playingVideoItemIndex = nil,
		changed = signal.new(),
		videoDwellTaskHandles = {}
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t.__setRunServiceThrottleFramerateEnabled(_, p1)
	-- upvalues: t (ref), runService (ref)
	if t.isSettingFramerateThrottleAllowedByPolicy then
		runService:setThrottleFramerateEnabled(p1)
		
		return
	end
end

function t.isPlaybackAllowed(_, p1, p2)
	-- upvalues: fFlagLuaAppEdpMediaGalleryFullScreen (ref)
	return fFlagLuaAppEdpMediaGalleryFullScreen and p2 or not p1
end

function t:isPlaybackCandidate(p1, p2, p3, p4, p5)
	-- upvalues: getIsInstanceVisibleModule (ref)
	return if self:isPlaybackAllowed(p1, p2) then getIsInstanceVisibleModule(p3.current, p4, p5) else false
end

function t:forcePlayback(p1, p2, p3, p4)
	if self.playingVideoKey == p1 then
		return
	end
	self:__cancelCurrentPlayback(p2, p3, nil, self.videoAnalytics)
	self:requestPlayback(p1, false, 0, p3, p4)
end

function t:requestPlayback(p1, p2, p3, p4, p5)
	if self.playingVideoKey == p1 then return end
	if self.videoDwellTaskHandles[p1] ~= nil then return end
	if p2 then
		self.videoDwellTaskHandles[p1] = task.delay(p3, function()
			-- upvalues: self (ref), p1 (ref), p4 (ref), p5 (ref)
			self.videoDwellTaskHandles[p1] = nil
			self:__startPlayback(p1, p4, p5)
		end)
		
		return
	end
	self:__startPlayback(p1, p4, p5)
end

function t:__startPlayback(p1, p2, p3)
	-- upvalues: fFlagLuaAppVideoPlaybackRefCount (ref), var1 (write), httpService (ref)
	self:__setRunServiceThrottleFramerateEnabled(false)
	
	if fFlagLuaAppVideoPlaybackRefCount and self.playingVideoKey == nil then
		var1 += 1
	end
	self.playingVideoKey = p1
	self.currentPlaybackSessionId = httpService:GenerateGUID(false)
	self.currentPlaybackSessionStartTime = tick()
	self.videoAnalytics = p3
	self.playingVideoItemIndex = p2
	
	if p3 then
		p3.reportVideoPlay(p2, self.currentPlaybackSessionId)
	end
	self.changed:fire(p1)
end

function t:cancelPlayback(p1, p2, p3, p4)
	-- upvalues: fFlagLuaAppVideoPlaybackRefCount (ref), var1 (write), t (ref)
	local var2
	if self.playingVideoKey == p1 then
		self:__cancelCurrentPlayback(p2, p3, nil, p4)
	elseif self.videoDwellTaskHandles[p1] ~= nil then
		task.cancel(self.videoDwellTaskHandles[p1])
		self.videoDwellTaskHandles[p1] = nil
	end
	if fFlagLuaAppVideoPlaybackRefCount then
		var2 = var1 == 0
		var2 = nil
	else
		var2 = self.playingVideoKey == nil
	end
	if var2 then
		self:__setRunServiceThrottleFramerateEnabled(t.preferredFramerateThrottling)
	end
end

function t:reset(p1, _, p2, _)
	-- upvalues: fFlagLuaAppVideoPlaybackRefCount (ref), var1 (write), t (ref)
	if self.playingVideoKey ~= nil then
		self:__cancelCurrentPlayback(p1, self.playingVideoItemIndex, p2, self.videoAnalytics)
	end
	for i, v in self.videoDwellTaskHandles do
		if v ~= nil then
			task.cancel(v)
		end
	end
	self.videoDwellTaskHandles = {}
	
	if not fFlagLuaAppVideoPlaybackRefCount or var1 == 0 then
		self:__setRunServiceThrottleFramerateEnabled(t.preferredFramerateThrottling)
	end
end

function t:__cancelCurrentPlayback(p3, p4, p5, p6)
	-- upvalues: argCheckModule (ref), fFlagLuaAppVideoPlaybackRefCount (ref), var1 (write)
	local currentPlaybackSessionStartTime = self.currentPlaybackSessionStartTime
	
	if p6 then
		local currentTime = tick()
		argCheckModule.assert(currentPlaybackSessionStartTime and currentPlaybackSessionStartTime <= currentTime)
		p6.reportVideoEnd(p4, p3, self.currentPlaybackSessionId, if currentPlaybackSessionStartTime and currentPlaybackSessionStartTime <= currentTime then currentTime - currentPlaybackSessionStartTime else -1, p5)
	end
	if fFlagLuaAppVideoPlaybackRefCount and self.playingVideoKey ~= nil then
		var1 -= 1
	end
	self.playingVideoKey = nil
	self.currentPlaybackSessionId = nil
	self.currentPlaybackSessionStartTime = nil
	self.videoAnalytics = nil
	self.playingVideoItemIndex = nil
	self.changed:fire(nil)
end

function t.setIsSettingFramerateThrottleAllowedByPolicy(_, p3)
	-- upvalues: t (ref)
	t.isSettingFramerateThrottleAllowedByPolicy = p3
end

function t.setPreferredFramerateThrottling(_, p3)
	-- upvalues: t (ref)
	t.preferredFramerateThrottling = p3
end

if fFlagLuaAppVideoPlaybackRefCount then
	function t.isAnyPlaying()
		-- upvalues: var1 (write)
		return var1 > 0
	end
end
t.default = t.new()

return t