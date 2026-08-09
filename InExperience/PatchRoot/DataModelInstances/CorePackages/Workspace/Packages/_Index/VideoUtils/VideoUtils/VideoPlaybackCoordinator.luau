local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local argCheckModule = require(parent.ArgCheck)
local signal = require(parent.AppCommonLib).Signal
local _ = require(videoUtils.Analytics.VideoAnalyticsTypes)
local getIsInstanceVisibleModule = require(videoUtils.getIsInstanceVisible)
local fFlagLuaAppEdpMediaGalleryFullScreen = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local fFlagLuaAppHomeTouchAutoplay = require(parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local fFlagLuaAppVideoPlaybackRefCount = require(parent.SharedFlags).FFlagLuaAppVideoPlaybackRefCount
local t = {}
t.__index = t
t.preferredFramerateThrottling = false
t.isSettingFramerateThrottleAllowedByPolicy = false
local var6 = 0

function t.new() --[[ line: 63 ]]
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

function t.__setRunServiceThrottleFramerateEnabled(_, p0) --[[ line: 80 ]]
	-- upvalues: t (ref), runService (ref)
	if t.isSettingFramerateThrottleAllowedByPolicy then
		runService:setThrottleFramerateEnabled(p0)
		
		return
	end
end

if fFlagLuaAppHomeTouchAutoplay then
	function t.isPlaybackAllowed(_, p1, p2) --[[ line: 92 ]]
		-- upvalues: fFlagLuaAppEdpMediaGalleryFullScreen (ref)
		return fFlagLuaAppEdpMediaGalleryFullScreen and p2 or not p1
	end
end
function t:isPlaybackCandidate(p3, p4, p5, p6, p7) --[[ line: 105 ]]
	-- upvalues: fFlagLuaAppHomeTouchAutoplay (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref), getIsInstanceVisibleModule (ref)
	if fFlagLuaAppHomeTouchAutoplay then
		if self:isPlaybackAllowed(p3, p4) then
		else
			return false
		end
	else
		return if fFlagLuaAppEdpMediaGalleryFullScreen and p4 or not p3 then false else getIsInstanceVisibleModule(p5.current, p6, p7)
	end
end

function t:forcePlayback(p8, p9, p10, p11) --[[ line: 127 ]]
	if self.playingVideoKey == p8 then
		return
	end
	self:__cancelCurrentPlayback(p9, p10, nil, self.videoAnalytics)
	self:requestPlayback(p8, false, 0, p10, p11)
end

function t:requestPlayback(p12, p13, p14, p15, p16) --[[ line: 144 ]]
	if self.playingVideoKey == p12 then return end
	if self.videoDwellTaskHandles[p12] ~= nil then return end
	if p13 then
		self.videoDwellTaskHandles[p12] = task.delay(p14, function() --[[ line: 163 ]]
			-- upvalues: self (ref), p12 (ref), p15 (ref), p16 (ref)
			self.videoDwellTaskHandles[p12] = nil
			self:__startPlayback(p12, p15, p16)
		end)
		
		return
	end
	self:__startPlayback(p12, p15, p16)
end

function t:__startPlayback(p17, p18, p19) --[[ line: 174 ]]
	-- upvalues: fFlagLuaAppVideoPlaybackRefCount (ref), var6 (write), httpService (ref)
	self:__setRunServiceThrottleFramerateEnabled(false)
	
	if fFlagLuaAppVideoPlaybackRefCount and self.playingVideoKey == nil then
		var6 += 1
	end
	self.playingVideoKey = p17
	self.currentPlaybackSessionId = httpService:GenerateGUID(false)
	self.currentPlaybackSessionStartTime = tick()
	self.videoAnalytics = p19
	self.playingVideoItemIndex = p18
	
	if p19 then
		p19.reportVideoPlay(p18, self.currentPlaybackSessionId)
	end
	self.changed:fire(p17)
end

function t:cancelPlayback(p20, p21, p22, p23) --[[ line: 200 ]]
	-- upvalues: fFlagLuaAppVideoPlaybackRefCount (ref), var6 (write), t (ref)
	local var8
	if self.playingVideoKey == p20 then
		self:__cancelCurrentPlayback(p21, p22, nil, p23)
	elseif self.videoDwellTaskHandles[p20] ~= nil then
		task.cancel(self.videoDwellTaskHandles[p20])
		self.videoDwellTaskHandles[p20] = nil
	end
	if fFlagLuaAppVideoPlaybackRefCount then
		var8 = var6 == 0
		var8 = nil
	else
		var8 = self.playingVideoKey == nil
	end
	if var8 then
		self:__setRunServiceThrottleFramerateEnabled(t.preferredFramerateThrottling)
	end
end

function t:reset(p24, _, p25, _) --[[ line: 222 ]]
	-- upvalues: fFlagLuaAppVideoPlaybackRefCount (ref), var6 (write), t (ref)
	if self.playingVideoKey ~= nil then
		self:__cancelCurrentPlayback(p24, self.playingVideoItemIndex, p25, self.videoAnalytics)
	end
	for i, v in self.videoDwellTaskHandles do
		if v ~= nil then
			task.cancel(v)
		end
	end
	self.videoDwellTaskHandles = {}
	
	if not fFlagLuaAppVideoPlaybackRefCount or var6 == 0 then
		self:__setRunServiceThrottleFramerateEnabled(t.preferredFramerateThrottling)
	end
end

function t:__cancelCurrentPlayback(p26, p27, p28, p29) --[[ line: 247 ]]
	-- upvalues: argCheckModule (ref), fFlagLuaAppVideoPlaybackRefCount (ref), var6 (write)
	local currentPlaybackSessionStartTime = self.currentPlaybackSessionStartTime
	
	if p29 then
		local currentTime = tick()
		argCheckModule.assert(currentPlaybackSessionStartTime and currentPlaybackSessionStartTime <= currentTime)
		p29.reportVideoEnd(p27, p26, self.currentPlaybackSessionId, if currentPlaybackSessionStartTime and currentPlaybackSessionStartTime <= currentTime then currentTime - currentPlaybackSessionStartTime else -1, p28)
	end
	if fFlagLuaAppVideoPlaybackRefCount and self.playingVideoKey ~= nil then
		var6 -= 1
	end
	self.playingVideoKey = nil
	self.currentPlaybackSessionId = nil
	self.currentPlaybackSessionStartTime = nil
	self.videoAnalytics = nil
	self.playingVideoItemIndex = nil
	self.changed:fire(nil)
end

function t.setIsSettingFramerateThrottleAllowedByPolicy(_, p30) --[[ line: 279 ]]
	-- upvalues: t (ref)
	t.isSettingFramerateThrottleAllowedByPolicy = p30
end

function t.setPreferredFramerateThrottling(_, p31) --[[ line: 286 ]]
	-- upvalues: t (ref)
	t.preferredFramerateThrottling = p31
end

if fFlagLuaAppVideoPlaybackRefCount then
	function t.isAnyPlaying() --[[ line: 294 ]]
		-- upvalues: var6 (write)
		return var6 > 0
	end
end
t.default = t.new()

return t