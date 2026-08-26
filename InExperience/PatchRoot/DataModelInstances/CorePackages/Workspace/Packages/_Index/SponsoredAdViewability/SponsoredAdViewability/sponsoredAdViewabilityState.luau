local sharedFlagsModule = require(script:FindFirstAncestor("SponsoredAdViewability").Parent.SharedFlags)
local _ = require(script.Parent.calculateIntersectionRatio)
local _ = require(script.Parent.sponsoredAdViewabilityTypes)
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled
local var1 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then 2000 else nil
local var2 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then {
	0,
	25,
	50,
	75,
	100
} else nil
local t = {
	IabDisplayStandard = "IabDisplayStandard",
	IabDisplayLarge = "IabDisplayLarge",
	FullView = "FullView",
	IabVideoStandard = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then "IabVideoStandard" else nil,
	FullViewVideo = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then "FullViewVideo" else nil
}

local function newBand(p1, p2)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	return if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p2 ~= nil then {
		enteredAtMs = nil,
		pendingContinuity = false,
		cumulativeMs = 0,
		maxContinuousMs = 0,
		threshold = p1,
		currentContinuousMs = p2
	} else {
		enteredAtMs = nil,
		cumulativeMs = 0,
		maxContinuousMs = 0,
		threshold = p1
	}
end

local function _(p1, p2)
	p1.cumulativeMs += p2
	
	if p1.maxContinuousMs < p2 then
		p1.maxContinuousMs = p2
	end
	p1.enteredAtMs = nil
end

local _ = function(p1, p2)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local enteredAtMs = p1.enteredAtMs
	local var3 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then p1.currentContinuousMs else nil
	
	if var3 == nil then
		if enteredAtMs == nil then return end
		local var4 = assert(p2, "image band requires an end timestamp") - enteredAtMs
		p1.cumulativeMs += var4
		
		if p1.maxContinuousMs < var4 then
			p1.maxContinuousMs = var4
		end
		p1.enteredAtMs = nil
		
		return
	elseif enteredAtMs == nil and not p1.pendingContinuity then return end
	p1.cumulativeMs += var3
	
	if p1.maxContinuousMs < var3 then
		p1.maxContinuousMs = var3
	end
	p1.enteredAtMs = nil
	p1.currentContinuousMs = 0
	p1.pendingContinuity = false
end

local _ = function(p1, p2, p3)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	if p1.threshold <= p2 then
		if p1.enteredAtMs == nil then
			p1.enteredAtMs = p3
			
			return
		end
	else
		local enteredAtMs = p1.enteredAtMs
		local var3 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then p1.currentContinuousMs else nil
		
		if var3 == nil then
			if enteredAtMs == nil then return end
			local var4 = assert(p3, "image band requires an end timestamp") - enteredAtMs
			p1.cumulativeMs += var4
			
			if p1.maxContinuousMs < var4 then
				p1.maxContinuousMs = var4
			end
			p1.enteredAtMs = nil
		elseif enteredAtMs == nil and not p1.pendingContinuity then return end
		p1.cumulativeMs += var3
		
		if p1.maxContinuousMs < var3 then
			p1.maxContinuousMs = var3
		end
		p1.enteredAtMs = nil
		p1.currentContinuousMs = 0
		p1.pendingContinuity = false
		
		return
	end
end

local _ = function(p1, p2)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local cumulativeMs = p1.cumulativeMs
	local maxContinuousMs = p1.maxContinuousMs
	local enteredAtMs = p1.enteredAtMs
	local var3 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then p1.currentContinuousMs else nil
	local var4 = nil
	
	if var3 == nil then
		if enteredAtMs ~= nil then
			var4 = assert(p2, "image band requires the current timestamp") - enteredAtMs
		end
	elseif enteredAtMs ~= nil or p1.pendingContinuity then
		var4 = var3
	end
	if var4 ~= nil then
		cumulativeMs += var4
		
		if maxContinuousMs < var4 then
			maxContinuousMs = var4
		end
	end
	return cumulativeMs, maxContinuousMs
end

local _ = function(p1)
	return if p1.enteredAtMs == nil then 0 else p1.currentContinuousMs or 0
end

local _ = function(vectorA)
	if vectorA.enteredAtMs ~= nil then
		vectorA.enteredAtMs = nil
		vectorA.pendingContinuity = true
	end
end

local function copyGeometry(p1)
	return {
		adSize = p1.adSize,
		viewportBounds = {
			min = p1.viewportBounds.min,
			max = p1.viewportBounds.max
		}
	}
end

local _ = function(p1)
	return p1 ~= nil and (p1.isPlaying and p1.audioLevel > 0)
end

local _ = function(p1)
	return typeof(p1) == "number" and (p1 >= 0 and p1 % 1 == 0)
end

local function isValidVideoPlaybackSnapshot(p1)
	local playbackPositionMs = p1.playbackPositionMs
	local loopCount = p1.loopCount
	local endedCount = p1.endedCount
	local audioLevel = p1.audioLevel
	local videoLengthMs = p1.videoLengthMs
	local var3 = false
	
	if typeof(p1.isPlaying) == "boolean" then
		var3 = false
		
		if typeof(playbackPositionMs) == "number" then
			var3 = false
			
			if playbackPositionMs >= 0 then
				var3 = typeof(loopCount) == "number" and (loopCount >= 0 and loopCount % 1 == 0)
				
				if var3 then
					if endedCount ~= nil then
						var3 = typeof(endedCount) == "number" and (endedCount >= 0 and endedCount % 1 == 0)
						
						if var3 then
							var3 = typeof(audioLevel) == "number" and (audioLevel >= 0 and (audioLevel <= 1 and (if videoLengthMs ~= nil then typeof(videoLengthMs) == "number" and videoLengthMs > 0 else true)))
						end
					end
				end
			end
		end
	end
	return var3
end

local _ = function(p1, p2)
	if p2 == nil then
		return 0
	end
	local viewportBounds = p2.viewportBounds
	local var3 = (viewportBounds.max.X - viewportBounds.min.X) * (viewportBounds.max.Y - viewportBounds.min.Y)
	
	return if var3 <= 0 then 0 else p1 * p2.adSize.X * p2.adSize.Y / var3
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p1, p2)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), newBand (ref), t_1 (ref)
	local var3 = fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p2 == true
	
	return setmetatable({
		_displayLabel = nil,
		_lastSampleMs = nil,
		_lastRatio = 0,
		_lastRealEstate = 0,
		_percentWeightedSum = 0,
		_realEstateWeightedSum = 0,
		_visibleWeightedMs = 0,
		_minPercentSeen = nil,
		_maxPercentSeen = nil,
		_latchedGeometry = nil,
		_pausedAtMs = nil,
		_pausedDurationMs = 0,
		_finalized = false,
		_terminalSnapshot = nil,
		startTimestampMs = p1,
		_achieved = {},
		_band30 = newBand(0.3, if var3 then 0 else nil),
		_band50 = newBand(0.5, if var3 then 0 else nil),
		_band100 = newBand(1, if var3 then 0 else nil),
		_inGridBand50 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var3 then newBand(0.5, 0) else nil,
		_fullscreenBand50 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var3 then newBand(0.5, 0) else nil,
		_video = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var3 then {
			highestProgress = nil,
			lengthMs = nil,
			cumulativePlaytimeMs = 0,
			lastSampleMs = nil,
			lastSnapshot = nil,
			isFullscreen = false,
			cumulativeAudioPlaybackMs = 0,
			cumulative100PercentAudibleMs = 0,
			maxAudioLevel = 0,
			audioOnAtEvent = false
		} else nil
	}, t_1)
end

function t_1:_classifyDisplayOnce(p1)
	-- upvalues: t (ref)
	if self._displayLabel ~= nil then return end
	local var3 = p1.X * p1.Y
	
	if var3 <= 0 then
		return
	end
	self._displayLabel = if var3 > 242500 then t.IabDisplayLarge else t.IabDisplayStandard
end

function t_1:_tryFire(p1, p2, p3, p4, p5, p6)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), copyGeometry (ref)
	if self._achieved[p2] then return end
	local var3
	local var4 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then self._video else nil
	local _ = false
	
	if var4 == nil then
		local enteredAtMs = p1.enteredAtMs
		var3 = enteredAtMs ~= nil and p3 - enteredAtMs >= 1000
	else
		var3 = (p6 or 1000) <= (if p1.enteredAtMs == nil then 0 else p1.currentContinuousMs or 0)
	end
	if not var3 then return end
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		self._achieved[p2] = true
	end
	local band30 = self._band30
	local cumulativeMs = band30.cumulativeMs
	local maxContinuousMs = band30.maxContinuousMs
	local enteredAtMs = band30.enteredAtMs
	local var5 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
	local var6 = nil
	
	if var5 == nil then
		if enteredAtMs ~= nil then
			var6 = assert(p3, "image band requires the current timestamp") - enteredAtMs
		end
	elseif enteredAtMs ~= nil or band30.pendingContinuity then
		var6 = var5
	end
	if var6 ~= nil then
		cumulativeMs += var6
		
		if maxContinuousMs < var6 then
			maxContinuousMs = var6
		end
	end
	local band50 = self._band50
	enteredAtMs = band50.cumulativeMs
	local maxContinuousMs_1 = band50.maxContinuousMs
	local enteredAtMs_1 = band50.enteredAtMs
	local var7 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
	local var8 = nil
	
	if var7 == nil then
		if enteredAtMs_1 ~= nil then
			var8 = assert(p3, "image band requires the current timestamp") - enteredAtMs_1
		end
	elseif enteredAtMs_1 ~= nil or band50.pendingContinuity then
		var8 = var7
	end
	if var8 ~= nil then
		enteredAtMs += var8
		
		if maxContinuousMs_1 < var8 then
			maxContinuousMs_1 = var8
		end
	end
	local band100 = self._band100
	enteredAtMs_1 = band100.cumulativeMs
	local maxContinuousMs_2 = band100.maxContinuousMs
	local enteredAtMs_2 = band100.enteredAtMs
	local var9 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
	local var10 = nil
	
	if var9 == nil then
		if enteredAtMs_2 ~= nil then
			var10 = assert(p3, "image band requires the current timestamp") - enteredAtMs_2
		end
	elseif enteredAtMs_2 ~= nil or band100.pendingContinuity then
		var10 = var9
	end
	if var10 ~= nil then
		enteredAtMs_1 += var10
		
		if maxContinuousMs_2 < var10 then
			maxContinuousMs_2 = var10
		end
	end
	maxContinuousMs_1 = {
		milestoneLabel = p2,
		geometry = copyGeometry(p4),
		viewabilitySessionStartTimestampMs = self.startTimestampMs,
		cumulative30PercentInViewDurationMs = cumulativeMs,
		cumulative50PercentInViewDurationMs = enteredAtMs,
		cumulative100PercentInViewDurationMs = enteredAtMs_1,
		maxContinuous30PercentInViewDurationMs = maxContinuousMs,
		maxContinuous50PercentInViewDurationMs = maxContinuousMs_1,
		maxContinuous100PercentInViewDurationMs = maxContinuousMs_2
	}
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var4 ~= nil then
		enteredAtMs_1 = self._inGridBand50
		local fullscreenBand50 = self._fullscreenBand50
		
		if enteredAtMs_1 == nil or fullscreenBand50 == nil then return end
		maxContinuousMs_1.isFullScreen = var4.isFullscreen
		maxContinuousMs_1.videoLengthMs = var4.lengthMs
		maxContinuousMs_1.maxAudioLevel = var4.maxAudioLevel
		local cumulativeMs_1 = enteredAtMs_1.cumulativeMs
		local maxContinuousMs_3 = enteredAtMs_1.maxContinuousMs
		local enteredAtMs_3 = enteredAtMs_1.enteredAtMs
		local var11 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then enteredAtMs_1.currentContinuousMs else nil
		local var12 = nil
		
		if var11 == nil then
			if enteredAtMs_3 ~= nil then
				var12 = assert(nil, "image band requires the current timestamp") - enteredAtMs_3
			end
		elseif enteredAtMs_3 ~= nil or enteredAtMs_1.pendingContinuity then
			var12 = var11
		end
		if var12 ~= nil then
			cumulativeMs_1 += var12
			
			if maxContinuousMs_3 < var12 then
				maxContinuousMs_3 = var12
			end
		end
		maxContinuousMs_1.cumulativeInGridViewDurationMs = cumulativeMs_1
		local cumulativeMs_2 = fullscreenBand50.cumulativeMs
		local maxContinuousMs_4 = fullscreenBand50.maxContinuousMs
		enteredAtMs_3 = fullscreenBand50.enteredAtMs
		local var13 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then fullscreenBand50.currentContinuousMs else nil
		local var14 = nil
		
		if var13 == nil then
			if enteredAtMs_3 ~= nil then
				var14 = assert(nil, "image band requires the current timestamp") - enteredAtMs_3
			end
		elseif enteredAtMs_3 ~= nil or fullscreenBand50.pendingContinuity then
			var14 = var13
		end
		if var14 ~= nil then
			cumulativeMs_2 += var14
			
			if maxContinuousMs_4 < var14 then
				maxContinuousMs_4 = var14
			end
		end
		maxContinuousMs_1.cumulativeFullScreenViewDurationMs = cumulativeMs_2
	end
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		self._achieved[p2] = true
	end
	table.insert(p5, maxContinuousMs_1)
end

function t_1:_accumulate(p1, p2, p3)
	local lastSampleMs = self._lastSampleMs
	
	if lastSampleMs ~= nil and self._lastRatio > 0 then
		local var3 = p1 - lastSampleMs
		
		if var3 > 0 then
			self._percentWeightedSum += self._lastRatio * var3
			self._realEstateWeightedSum += self._lastRealEstate * var3
			self._visibleWeightedMs += var3
		end
	end
	local var4
	self._lastSampleMs = p1
	self._lastRatio = p2
	
	if p3 == nil then
		var4 = 0
	else
		local viewportBounds = p3.viewportBounds
		local var5 = (viewportBounds.max.X - viewportBounds.min.X) * (viewportBounds.max.Y - viewportBounds.min.Y)
		var4 = if var5 <= 0 then 0 else p2 * p3.adSize.X * p3.adSize.Y / var5
	end
	self._lastRealEstate = var4
	
	if p2 > 0 then
		if self._minPercentSeen == nil or p2 < self._minPercentSeen then
			self._minPercentSeen = p2
		end
		if self._maxPercentSeen == nil or self._maxPercentSeen < p2 then
			self._maxPercentSeen = p2
		end
	end
end

local function updateVideoBand(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local enteredAtMs
	if p1.pendingContinuity then
		if p3 and p1.threshold <= p5 then
			p1.pendingContinuity = false
			p1.enteredAtMs = p7
			local currentContinuousMs = p1.currentContinuousMs
			
			if p2 and currentContinuousMs ~= nil then
				p1.currentContinuousMs = currentContinuousMs + p6
				
				return
			end
		else
			local enteredAtMs = p1.enteredAtMs
			local var3 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then p1.currentContinuousMs else nil
			
			if var3 == nil then
				if enteredAtMs == nil then return end
				local var4 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				p1.cumulativeMs += var4
				
				if p1.maxContinuousMs < var4 then
					p1.maxContinuousMs = var4
				end
				p1.enteredAtMs = nil
			elseif enteredAtMs == nil and not p1.pendingContinuity then return end
			p1.cumulativeMs += var3
			
			if p1.maxContinuousMs < var3 then
				p1.maxContinuousMs = var3
			end
			p1.enteredAtMs = nil
			p1.currentContinuousMs = 0
			p1.pendingContinuity = false
			
			return
		end
		return
	elseif p2 and p1.threshold <= p5 then
		if p4 < p1.threshold then
			enteredAtMs = p1.enteredAtMs
			local var5 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then p1.currentContinuousMs else nil
			
			if var5 == nil then
				if enteredAtMs ~= nil then
					local var6 = assert(nil, "image band requires an end timestamp") - enteredAtMs
					p1.cumulativeMs += var6
					
					if p1.maxContinuousMs < var6 then
						p1.maxContinuousMs = var6
					end
					p1.enteredAtMs = nil
				end
			elseif enteredAtMs ~= nil or p1.pendingContinuity then
				p1.cumulativeMs += var5
				
				if p1.maxContinuousMs < var5 then
					p1.maxContinuousMs = var5
				end
				p1.enteredAtMs = nil
				p1.currentContinuousMs = 0
				p1.pendingContinuity = false
			end
			if p3 then
				p1.enteredAtMs = p7
			end
			return
		elseif p1.enteredAtMs == nil then
			p1.enteredAtMs = p7
		end
		enteredAtMs = p1.currentContinuousMs
		
		if enteredAtMs == nil then
			p1.enteredAtMs = nil
			p1.pendingContinuity = false
			
			return
		end
		p1.currentContinuousMs = enteredAtMs + p6
		
		if not p3 then
			local enteredAtMs_1 = p1.enteredAtMs
			local var7 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then p1.currentContinuousMs else nil
			
			if var7 == nil then
				if enteredAtMs_1 == nil then return end
				local var8 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
				p1.cumulativeMs += var8
				
				if p1.maxContinuousMs < var8 then
					p1.maxContinuousMs = var8
				end
				p1.enteredAtMs = nil
			elseif enteredAtMs_1 == nil and not p1.pendingContinuity then return end
			p1.cumulativeMs += var7
			
			if p1.maxContinuousMs < var7 then
				p1.maxContinuousMs = var7
			end
			p1.enteredAtMs = nil
			p1.currentContinuousMs = 0
			p1.pendingContinuity = false
			
			return
		end
		return
	else
		enteredAtMs = p1.enteredAtMs
		local var9 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then p1.currentContinuousMs else nil
		
		if var9 == nil then
			if enteredAtMs == nil then return end
			local var10 = assert(nil, "image band requires an end timestamp") - enteredAtMs
			p1.cumulativeMs += var10
			
			if p1.maxContinuousMs < var10 then
				p1.maxContinuousMs = var10
			end
			p1.enteredAtMs = nil
			
			return
		elseif enteredAtMs == nil and not p1.pendingContinuity then return end
		p1.cumulativeMs += var9
		
		if p1.maxContinuousMs < var9 then
			p1.maxContinuousMs = var9
		end
		p1.enteredAtMs = nil
		p1.currentContinuousMs = 0
		p1.pendingContinuity = false
	end
end

local _ = function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: updateVideoBand (ref)
	p2 = p2 or p1.pendingContinuity == true
	updateVideoBand(p1, p3 and p2, p4 and p2, p5, p6, p7, p8)
end

local _ = function(p1, p2, p3, p4, p5)
	if p1 == nil or p2 == nil or (p3 == nil or p4 == nil) then
		return 0
	elseif p4 < p3 then
		return 0
	end
	local var3 = p4 - p3
	
	return if var3 == 0 then math.max(0, p2 - p1) elseif p5 == nil or p5 <= 0 then 0 else math.max(0, var3 * p5 + p2 - p1)
end

local _ = function(p1, p2, p3)
	return if p1 then 100 elseif p2 == nil or p2 <= 0 then 0 else math.clamp(p3 / p2 * 100, 0, 100)
end

function t_1:_buildVideoProgressMilestone(p1, p2)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), copyGeometry (ref)
	local video = self._video
	local inGridBand50 = self._inGridBand50
	local fullscreenBand50 = self._fullscreenBand50
	
	if video == nil or inGridBand50 == nil or fullscreenBand50 == nil then
		return nil
	end
	local band30 = self._band30
	local cumulativeMs = band30.cumulativeMs
	local maxContinuousMs = band30.maxContinuousMs
	local enteredAtMs = band30.enteredAtMs
	local var3 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
	local var4 = nil
	
	if var3 == nil then
		if enteredAtMs ~= nil then
			var4 = assert(nil, "image band requires the current timestamp") - enteredAtMs
		end
	elseif enteredAtMs ~= nil or band30.pendingContinuity then
		var4 = var3
	end
	if var4 ~= nil then
		cumulativeMs += var4
		
		if maxContinuousMs < var4 then
			maxContinuousMs = var4
		end
	end
	local band50 = self._band50
	enteredAtMs = band50.cumulativeMs
	local maxContinuousMs_1 = band50.maxContinuousMs
	local enteredAtMs_1 = band50.enteredAtMs
	local var5 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
	local var6 = nil
	
	if var5 == nil then
		if enteredAtMs_1 ~= nil then
			var6 = assert(nil, "image band requires the current timestamp") - enteredAtMs_1
		end
	elseif enteredAtMs_1 ~= nil or band50.pendingContinuity then
		var6 = var5
	end
	if var6 ~= nil then
		enteredAtMs += var6
		
		if maxContinuousMs_1 < var6 then
			maxContinuousMs_1 = var6
		end
	end
	local band100 = self._band100
	enteredAtMs_1 = band100.cumulativeMs
	local maxContinuousMs_2 = band100.maxContinuousMs
	local enteredAtMs_2 = band100.enteredAtMs
	local var7 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
	local var8 = nil
	
	if var7 == nil then
		if enteredAtMs_2 ~= nil then
			var8 = assert(nil, "image band requires the current timestamp") - enteredAtMs_2
		end
	elseif enteredAtMs_2 ~= nil or band100.pendingContinuity then
		var8 = var7
	end
	if var8 ~= nil then
		enteredAtMs_1 += var8
		
		if maxContinuousMs_2 < var8 then
			maxContinuousMs_2 = var8
		end
	end
	enteredAtMs_1 = inGridBand50.cumulativeMs
	local maxContinuousMs_3 = inGridBand50.maxContinuousMs
	enteredAtMs_2 = inGridBand50.enteredAtMs
	local var9 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then inGridBand50.currentContinuousMs else nil
	local var10 = nil
	
	if var9 == nil then
		if enteredAtMs_2 ~= nil then
			var10 = assert(nil, "image band requires the current timestamp") - enteredAtMs_2
		end
	elseif enteredAtMs_2 ~= nil or inGridBand50.pendingContinuity then
		var10 = var9
	end
	if var10 ~= nil then
		enteredAtMs_1 += var10
		
		if maxContinuousMs_3 < var10 then
			maxContinuousMs_3 = var10
		end
	end
	local cumulativeMs_1 = fullscreenBand50.cumulativeMs
	enteredAtMs_2 = fullscreenBand50.maxContinuousMs
	local enteredAtMs_3 = fullscreenBand50.enteredAtMs
	local var11 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then fullscreenBand50.currentContinuousMs else nil
	local var12 = nil
	
	if var11 == nil then
		if enteredAtMs_3 ~= nil then
			var12 = assert(nil, "image band requires the current timestamp") - enteredAtMs_3
		end
	elseif enteredAtMs_3 ~= nil or fullscreenBand50.pendingContinuity then
		var12 = var11
	end
	if var12 ~= nil then
		cumulativeMs_1 += var12
		
		if enteredAtMs_2 < var12 then
			enteredAtMs_2 = var12
		end
	end
	return {
		geometry = copyGeometry(p2),
		viewabilitySessionStartTimestampMs = self.startTimestampMs,
		cumulative30PercentInViewDurationMs = cumulativeMs,
		cumulative50PercentInViewDurationMs = enteredAtMs,
		cumulative100PercentInViewDurationMs = enteredAtMs_1,
		maxContinuous30PercentInViewDurationMs = maxContinuousMs,
		maxContinuous50PercentInViewDurationMs = maxContinuousMs_1,
		maxContinuous100PercentInViewDurationMs = maxContinuousMs_2,
		videoProgress = p1,
		videoLengthMs = video.lengthMs,
		videoCumulativePlaytimeMs = video.cumulativePlaytimeMs,
		cumulativeAudioPlaybackDurationMs = video.cumulativeAudioPlaybackMs,
		cumulative100PercentAudibleTimeMs = video.cumulative100PercentAudibleMs,
		maxAudioLevel = video.maxAudioLevel,
		audioOnAtEvent = video.audioOnAtEvent,
		isFullScreen = video.isFullscreen,
		cumulativeInGridViewDurationMs = enteredAtMs_1,
		cumulativeFullScreenViewDurationMs = cumulativeMs_1
	}
end

function t_1:_advanceVideo(p1, p2, p3, p4, p5, p6)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), isValidVideoPlaybackSnapshot (ref), updateVideoBand (ref), var2 (ref)
	local enteredAtMs
	local t = {}
	
	if self._video == nil or self._inGridBand50 == nil or self._fullscreenBand50 == nil then
		local band30 = self._band30
		enteredAtMs = band30.enteredAtMs
		local var3 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
		
		if var3 == nil then
			if enteredAtMs ~= nil then
				local var4 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band30.cumulativeMs += var4
				
				if band30.maxContinuousMs < var4 then
					band30.maxContinuousMs = var4
				end
				band30.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band30.pendingContinuity then
			band30.cumulativeMs += var3
			
			if band30.maxContinuousMs < var3 then
				band30.maxContinuousMs = var3
			end
			band30.enteredAtMs = nil
			band30.currentContinuousMs = 0
			band30.pendingContinuity = false
		end
		local band50 = self._band50
		enteredAtMs = band50.enteredAtMs
		local var5 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
		
		if var5 == nil then
			if enteredAtMs ~= nil then
				local var6 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band50.cumulativeMs += var6
				
				if band50.maxContinuousMs < var6 then
					band50.maxContinuousMs = var6
				end
				band50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band50.pendingContinuity then
			band50.cumulativeMs += var5
			
			if band50.maxContinuousMs < var5 then
				band50.maxContinuousMs = var5
			end
			band50.enteredAtMs = nil
			band50.currentContinuousMs = 0
			band50.pendingContinuity = false
		end
		local band100 = self._band100
		enteredAtMs = band100.enteredAtMs
		local var7 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
		
		if var7 == nil then
			if enteredAtMs ~= nil then
				local var8 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band100.cumulativeMs += var8
				
				if band100.maxContinuousMs < var8 then
					band100.maxContinuousMs = var8
				end
				band100.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band100.pendingContinuity then
			band100.cumulativeMs += var7
			
			if band100.maxContinuousMs < var7 then
				band100.maxContinuousMs = var7
			end
			band100.enteredAtMs = nil
			band100.currentContinuousMs = 0
			band100.pendingContinuity = false
		end
		return t, false, false
	else
		local video = self._video
		enteredAtMs = self._inGridBand50
		local fullscreenBand50 = self._fullscreenBand50
		local lastSampleMs = video.lastSampleMs
		local lastSnapshot = video.lastSnapshot
		
		if p5 ~= nil and not isValidVideoPlaybackSnapshot(p5) then
			p5 = nil
		end
		local enteredAtMs_1, enteredAtMs_2
		video.isFullscreen = p6
		local var9 = p5
		video.audioOnAtEvent = var9 ~= nil and (var9.isPlaying and var9.audioLevel > 0)
		
		if p5 == nil then
			local band30 = self._band30
			
			if band30.pendingContinuity then
				enteredAtMs_1 = band30.enteredAtMs
				local var10 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
				
				if var10 == nil then
					if enteredAtMs_1 ~= nil then
						local var11 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
						band30.cumulativeMs += var11
						
						if band30.maxContinuousMs < var11 then
							band30.maxContinuousMs = var11
						end
						band30.enteredAtMs = nil
					end
				elseif enteredAtMs_1 ~= nil or band30.pendingContinuity then
					band30.cumulativeMs += var10
					
					if band30.maxContinuousMs < var10 then
						band30.maxContinuousMs = var10
					end
					band30.enteredAtMs = nil
					band30.currentContinuousMs = 0
					band30.pendingContinuity = false
				end
			else
				enteredAtMs_1 = band30.enteredAtMs
				local var12 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
				
				if var12 == nil then
					if enteredAtMs_1 ~= nil then
						local var13 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
						band30.cumulativeMs += var13
						
						if band30.maxContinuousMs < var13 then
							band30.maxContinuousMs = var13
						end
						band30.enteredAtMs = nil
					end
				elseif enteredAtMs_1 ~= nil or band30.pendingContinuity then
					band30.cumulativeMs += var12
					
					if band30.maxContinuousMs < var12 then
						band30.maxContinuousMs = var12
					end
					band30.enteredAtMs = nil
					band30.currentContinuousMs = 0
					band30.pendingContinuity = false
				end
			end
			local band50 = self._band50
			
			if band50.pendingContinuity then
				enteredAtMs_1 = band50.enteredAtMs
				local var14 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
				
				if var14 == nil then
					if enteredAtMs_1 ~= nil then
						local var15 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
						band50.cumulativeMs += var15
						
						if band50.maxContinuousMs < var15 then
							band50.maxContinuousMs = var15
						end
						band50.enteredAtMs = nil
					end
				elseif enteredAtMs_1 ~= nil or band50.pendingContinuity then
					band50.cumulativeMs += var14
					
					if band50.maxContinuousMs < var14 then
						band50.maxContinuousMs = var14
					end
					band50.enteredAtMs = nil
					band50.currentContinuousMs = 0
					band50.pendingContinuity = false
				end
			else
				enteredAtMs_1 = band50.enteredAtMs
				local var16 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
				
				if var16 == nil then
					if enteredAtMs_1 ~= nil then
						local var17 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
						band50.cumulativeMs += var17
						
						if band50.maxContinuousMs < var17 then
							band50.maxContinuousMs = var17
						end
						band50.enteredAtMs = nil
					end
				elseif enteredAtMs_1 ~= nil or band50.pendingContinuity then
					band50.cumulativeMs += var16
					
					if band50.maxContinuousMs < var16 then
						band50.maxContinuousMs = var16
					end
					band50.enteredAtMs = nil
					band50.currentContinuousMs = 0
					band50.pendingContinuity = false
				end
			end
			local band100 = self._band100
			
			if band100.pendingContinuity then
				enteredAtMs_1 = band100.enteredAtMs
				local var18 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
				
				if var18 == nil then
					if enteredAtMs_1 ~= nil then
						local var19 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
						band100.cumulativeMs += var19
						
						if band100.maxContinuousMs < var19 then
							band100.maxContinuousMs = var19
						end
						band100.enteredAtMs = nil
					end
				elseif enteredAtMs_1 ~= nil or band100.pendingContinuity then
					band100.cumulativeMs += var18
					
					if band100.maxContinuousMs < var18 then
						band100.maxContinuousMs = var18
					end
					band100.enteredAtMs = nil
					band100.currentContinuousMs = 0
					band100.pendingContinuity = false
				end
			else
				enteredAtMs_1 = band100.enteredAtMs
				local var20 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
				
				if var20 == nil then
					if enteredAtMs_1 ~= nil then
						local var21 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
						band100.cumulativeMs += var21
						
						if band100.maxContinuousMs < var21 then
							band100.maxContinuousMs = var21
						end
						band100.enteredAtMs = nil
					end
				elseif enteredAtMs_1 ~= nil or band100.pendingContinuity then
					band100.cumulativeMs += var20
					
					if band100.maxContinuousMs < var20 then
						band100.maxContinuousMs = var20
					end
					band100.enteredAtMs = nil
					band100.currentContinuousMs = 0
					band100.pendingContinuity = false
				end
			end
			if enteredAtMs.pendingContinuity then
				enteredAtMs_2 = enteredAtMs.enteredAtMs
				enteredAtMs_1 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then enteredAtMs.currentContinuousMs else nil
				
				if enteredAtMs_1 == nil then
					if enteredAtMs_2 ~= nil then
						local var22 = assert(nil, "image band requires an end timestamp") - enteredAtMs_2
						enteredAtMs.cumulativeMs += var22
						
						if enteredAtMs.maxContinuousMs < var22 then
							enteredAtMs.maxContinuousMs = var22
						end
						enteredAtMs.enteredAtMs = nil
					end
				elseif enteredAtMs_2 ~= nil or enteredAtMs.pendingContinuity then
					enteredAtMs.cumulativeMs += enteredAtMs_1
					
					if enteredAtMs.maxContinuousMs < enteredAtMs_1 then
						enteredAtMs.maxContinuousMs = enteredAtMs_1
					end
					enteredAtMs.enteredAtMs = nil
					enteredAtMs.currentContinuousMs = 0
					enteredAtMs.pendingContinuity = false
				end
			else
				enteredAtMs_2 = enteredAtMs.enteredAtMs
				enteredAtMs_1 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then enteredAtMs.currentContinuousMs else nil
				
				if enteredAtMs_1 == nil then
					if enteredAtMs_2 ~= nil then
						local var23 = assert(nil, "image band requires an end timestamp") - enteredAtMs_2
						enteredAtMs.cumulativeMs += var23
						
						if enteredAtMs.maxContinuousMs < var23 then
							enteredAtMs.maxContinuousMs = var23
						end
						enteredAtMs.enteredAtMs = nil
					end
				elseif enteredAtMs_2 ~= nil or enteredAtMs.pendingContinuity then
					enteredAtMs.cumulativeMs += enteredAtMs_1
					
					if enteredAtMs.maxContinuousMs < enteredAtMs_1 then
						enteredAtMs.maxContinuousMs = enteredAtMs_1
					end
					enteredAtMs.enteredAtMs = nil
					enteredAtMs.currentContinuousMs = 0
					enteredAtMs.pendingContinuity = false
				end
			end
			if fullscreenBand50.pendingContinuity then
				enteredAtMs_2 = fullscreenBand50.enteredAtMs
				enteredAtMs_1 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then fullscreenBand50.currentContinuousMs else nil
				
				if enteredAtMs_1 == nil then
					if enteredAtMs_2 ~= nil then
						local var24 = assert(nil, "image band requires an end timestamp") - enteredAtMs_2
						fullscreenBand50.cumulativeMs += var24
						
						if fullscreenBand50.maxContinuousMs < var24 then
							fullscreenBand50.maxContinuousMs = var24
						end
						fullscreenBand50.enteredAtMs = nil
					end
				elseif enteredAtMs_2 ~= nil or fullscreenBand50.pendingContinuity then
					fullscreenBand50.cumulativeMs += enteredAtMs_1
					
					if fullscreenBand50.maxContinuousMs < enteredAtMs_1 then
						fullscreenBand50.maxContinuousMs = enteredAtMs_1
					end
					fullscreenBand50.enteredAtMs = nil
					fullscreenBand50.currentContinuousMs = 0
					fullscreenBand50.pendingContinuity = false
				end
			else
				enteredAtMs_2 = fullscreenBand50.enteredAtMs
				enteredAtMs_1 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then fullscreenBand50.currentContinuousMs else nil
				
				if enteredAtMs_1 == nil then
					if enteredAtMs_2 ~= nil then
						local var25 = assert(nil, "image band requires an end timestamp") - enteredAtMs_2
						fullscreenBand50.cumulativeMs += var25
						
						if fullscreenBand50.maxContinuousMs < var25 then
							fullscreenBand50.maxContinuousMs = var25
						end
						fullscreenBand50.enteredAtMs = nil
					end
				elseif enteredAtMs_2 ~= nil or fullscreenBand50.pendingContinuity then
					fullscreenBand50.cumulativeMs += enteredAtMs_1
					
					if fullscreenBand50.maxContinuousMs < enteredAtMs_1 then
						fullscreenBand50.maxContinuousMs = enteredAtMs_1
					end
					fullscreenBand50.enteredAtMs = nil
					fullscreenBand50.currentContinuousMs = 0
					fullscreenBand50.pendingContinuity = false
				end
			end
			video.lastSampleMs = p1
			video.lastSnapshot = nil
			
			return t, false, false
		elseif p5.videoLengthMs ~= nil then
			video.lengthMs = p5.videoLengthMs
		end
		local var26
		enteredAtMs_2 = p5.playbackPositionMs
		enteredAtMs_1 = p5.loopCount
		local endedCount = p5.endedCount or 0
		local var27 = if lastSnapshot then lastSnapshot.endedCount or 0 else nil
		local var28 = if lastSnapshot then lastSnapshot.playbackPositionMs else nil
		local var29 = if lastSnapshot then lastSnapshot.loopCount else nil
		local lengthMs = video.lengthMs
		
		if var28 == nil or enteredAtMs_2 == nil or (var29 == nil or enteredAtMs_1 == nil) then
			var26 = 0
		elseif enteredAtMs_1 < var29 then
			var26 = 0
		else
			local var30 = enteredAtMs_1 - var29
			var26 = if var30 == 0 then math.max(0, enteredAtMs_2 - var28) elseif lengthMs == nil or lengthMs <= 0 then 0 else math.max(0, var30 * lengthMs + enteredAtMs_2 - var28)
		end
		var28 = lastSnapshot ~= nil and lastSnapshot.loopCount < enteredAtMs_1
		var29 = var27 ~= nil and endedCount < var27
		lengthMs = var27 ~= nil and (not var29 and var27 < endedCount)
		local var31 = var28 or lengthMs
		local var32 = lastSnapshot ~= nil and lastSnapshot.isPlaying
		local isPlaying = p5.isPlaying
		local var33 = var32 and (var26 > 0 and (not var29 and (isPlaying or lengthMs)))
		local var34 = var33 and (isPlaying and not lengthMs)
		local var35 = if var33 then math.min(if lastSampleMs ~= nil then p1 - lastSampleMs else 0, var26) else 0
		local var36 = lengthMs and (var33 and p4 ~= nil)
		local isPlaying_1 = isPlaying or var36
		
		for i, v in { self._band30, self._band50, self._band100 } do
			updateVideoBand(v, var33, isPlaying_1, p2, p3, var35, p1)
		end
		local var37
		local var38 = not p6 or enteredAtMs.pendingContinuity == true
		updateVideoBand(enteredAtMs, var33 and var38, isPlaying_1 and var38, p2, p3, var35, p1)
		p6 = p6 or fullscreenBand50.pendingContinuity == true
		updateVideoBand(fullscreenBand50, var33 and p6, isPlaying_1 and p6, p2, p3, var35, p1)
		
		if var33 then
			video.cumulativePlaytimeMs += var35
			
			if lastSnapshot ~= nil then
				var37 = lastSnapshot ~= nil and (lastSnapshot.isPlaying and lastSnapshot.audioLevel > 0)
				
				if var37 then
					local var39 = p5
					var37 = var39 ~= nil and (var39.isPlaying and var39.audioLevel > 0)
					
					if var37 or lengthMs then
						video.cumulativeAudioPlaybackMs += var35
						video.maxAudioLevel = math.max(video.maxAudioLevel, lastSnapshot.audioLevel, p5.audioLevel)
						
						if p2 >= 1 and p3 >= 1 then
							video.cumulative100PercentAudibleMs += var35
						end
					end
				end
			end
		end
		if (var33 or var31) and p4 ~= nil then
			local lengthMs_1 = video.lengthMs
			var37 = if var31 then 100 elseif lengthMs_1 == nil or lengthMs_1 <= 0 then 0 else math.clamp(enteredAtMs_2 / lengthMs_1 * 100, 0, 100)
			
			for i_1, v_1 in var2 do
				if (video.highestProgress == nil or video.highestProgress < v_1) and v_1 <= var37 then
					local var40 = self:_buildVideoProgressMilestone(v_1, p4)
					
					if var40 ~= nil then
						video.highestProgress = v_1
						table.insert(t, var40)
					end
				end
			end
		end
		video.lastSampleMs = p1
		video.lastSnapshot = p5
		
		return t, var34, var36
	end
end

function t_1:transitionVideoSource(p7, p8)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local video = self._video
	local inGridBand50 = self._inGridBand50
	local fullscreenBand50 = self._fullscreenBand50
	
	if self._finalized or self._pausedAtMs ~= nil or (video == nil or inGridBand50 == nil) or fullscreenBand50 == nil then return end
	local maxValue = math.max(p7, video.lastSampleMs or self.startTimestampMs)
	
	if p8 then
		for i, v in { self._band30, self._band50, self._band100 } do
			if v.enteredAtMs ~= nil then
				v.enteredAtMs = nil
				v.pendingContinuity = true
			end
		end
		if video.isFullscreen then
			local enteredAtMs = inGridBand50.enteredAtMs
			local var41 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then inGridBand50.currentContinuousMs else nil
			
			if var41 == nil then
				if enteredAtMs ~= nil then
					local var42 = assert(nil, "image band requires an end timestamp") - enteredAtMs
					inGridBand50.cumulativeMs += var42
					
					if inGridBand50.maxContinuousMs < var42 then
						inGridBand50.maxContinuousMs = var42
					end
					inGridBand50.enteredAtMs = nil
				end
			elseif enteredAtMs ~= nil or inGridBand50.pendingContinuity then
				inGridBand50.cumulativeMs += var41
				
				if inGridBand50.maxContinuousMs < var41 then
					inGridBand50.maxContinuousMs = var41
				end
				inGridBand50.enteredAtMs = nil
				inGridBand50.currentContinuousMs = 0
				inGridBand50.pendingContinuity = false
			end
			if fullscreenBand50.enteredAtMs ~= nil then
				fullscreenBand50.enteredAtMs = nil
				fullscreenBand50.pendingContinuity = true
			end
		elseif inGridBand50.enteredAtMs ~= nil then
			inGridBand50.enteredAtMs = nil
			inGridBand50.pendingContinuity = true
		end
		local enteredAtMs = fullscreenBand50.enteredAtMs
		local var43 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then fullscreenBand50.currentContinuousMs else nil
		
		if var43 == nil then
			if enteredAtMs ~= nil then
				local var44 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				fullscreenBand50.cumulativeMs += var44
				
				if fullscreenBand50.maxContinuousMs < var44 then
					fullscreenBand50.maxContinuousMs = var44
				end
				fullscreenBand50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or fullscreenBand50.pendingContinuity then
			fullscreenBand50.cumulativeMs += var43
			
			if fullscreenBand50.maxContinuousMs < var43 then
				fullscreenBand50.maxContinuousMs = var43
			end
			fullscreenBand50.enteredAtMs = nil
			fullscreenBand50.currentContinuousMs = 0
			fullscreenBand50.pendingContinuity = false
		end
	else
		for i, v in { self._band30, self._band50, self._band100 } do
			local enteredAtMs = v.enteredAtMs
			local var45 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then v.currentContinuousMs else nil
			
			if var45 == nil then
				if enteredAtMs ~= nil then
					local var46 = assert(nil, "image band requires an end timestamp") - enteredAtMs
					v.cumulativeMs += var46
					
					if v.maxContinuousMs < var46 then
						v.maxContinuousMs = var46
					end
					v.enteredAtMs = nil
				end
			elseif enteredAtMs ~= nil or v.pendingContinuity then
				v.cumulativeMs += var45
				
				if v.maxContinuousMs < var45 then
					v.maxContinuousMs = var45
				end
				v.enteredAtMs = nil
				v.currentContinuousMs = 0
				v.pendingContinuity = false
			end
		end
		local enteredAtMs = inGridBand50.enteredAtMs
		local var47 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then inGridBand50.currentContinuousMs else nil
		
		if var47 == nil then
			if enteredAtMs ~= nil then
				local var48 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				inGridBand50.cumulativeMs += var48
				
				if inGridBand50.maxContinuousMs < var48 then
					inGridBand50.maxContinuousMs = var48
				end
				inGridBand50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or inGridBand50.pendingContinuity then
			inGridBand50.cumulativeMs += var47
			
			if inGridBand50.maxContinuousMs < var47 then
				inGridBand50.maxContinuousMs = var47
			end
			inGridBand50.enteredAtMs = nil
			inGridBand50.currentContinuousMs = 0
			inGridBand50.pendingContinuity = false
		end
		enteredAtMs = fullscreenBand50.enteredAtMs
		local var49 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then fullscreenBand50.currentContinuousMs else nil
		
		if var49 == nil then
			if enteredAtMs ~= nil then
				local var50 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				fullscreenBand50.cumulativeMs += var50
				
				if fullscreenBand50.maxContinuousMs < var50 then
					fullscreenBand50.maxContinuousMs = var50
				end
				fullscreenBand50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or fullscreenBand50.pendingContinuity then
			fullscreenBand50.cumulativeMs += var49
			
			if fullscreenBand50.maxContinuousMs < var49 then
				fullscreenBand50.maxContinuousMs = var49
			end
			fullscreenBand50.enteredAtMs = nil
			fullscreenBand50.currentContinuousMs = 0
			fullscreenBand50.pendingContinuity = false
		end
	end
	if not p8 then
		video.lastSampleMs = nil
		video.lastSnapshot = nil
	end
	video.audioOnAtEvent = false
	self._lastSampleMs = maxValue
	self._lastRatio = 0
	self._lastRealEstate = 0
end

function t_1:pause(p9)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local var51
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		var51 = self._video ~= nil
		var51 = nil
	else
		var51 = nil
	end
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var51 then
		if self._finalized or self._pausedAtMs ~= nil then return end
		p9 = math.max(p9, self._lastSampleMs or self.startTimestampMs)
	else
		assert(not self._finalized, "pause called after finalize")
		assert(self._pausedAtMs == nil, "pause called while already paused")
		assert((self._lastSampleMs or self.startTimestampMs) <= p9, "pause timestamp precedes the last sample")
	end
	self:_accumulate(p9, 0, nil)
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var51 then
		local video = self._video
		local band30 = self._band30
		local enteredAtMs = band30.enteredAtMs
		local var52 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
		
		if var52 == nil then
			if enteredAtMs ~= nil then
				local var53 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band30.cumulativeMs += var53
				
				if band30.maxContinuousMs < var53 then
					band30.maxContinuousMs = var53
				end
				band30.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band30.pendingContinuity then
			band30.cumulativeMs += var52
			
			if band30.maxContinuousMs < var52 then
				band30.maxContinuousMs = var52
			end
			band30.enteredAtMs = nil
			band30.currentContinuousMs = 0
			band30.pendingContinuity = false
		end
		local band50 = self._band50
		enteredAtMs = band50.enteredAtMs
		local var54 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
		
		if var54 == nil then
			if enteredAtMs ~= nil then
				local var55 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band50.cumulativeMs += var55
				
				if band50.maxContinuousMs < var55 then
					band50.maxContinuousMs = var55
				end
				band50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band50.pendingContinuity then
			band50.cumulativeMs += var54
			
			if band50.maxContinuousMs < var54 then
				band50.maxContinuousMs = var54
			end
			band50.enteredAtMs = nil
			band50.currentContinuousMs = 0
			band50.pendingContinuity = false
		end
		local band100 = self._band100
		enteredAtMs = band100.enteredAtMs
		local var56 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
		
		if var56 == nil then
			if enteredAtMs ~= nil then
				local var57 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band100.cumulativeMs += var57
				
				if band100.maxContinuousMs < var57 then
					band100.maxContinuousMs = var57
				end
				band100.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band100.pendingContinuity then
			band100.cumulativeMs += var56
			
			if band100.maxContinuousMs < var56 then
				band100.maxContinuousMs = var56
			end
			band100.enteredAtMs = nil
			band100.currentContinuousMs = 0
			band100.pendingContinuity = false
		end
		local enteredAtMs_1
		local inGridBand50 = self._inGridBand50
		enteredAtMs = self._fullscreenBand50
		
		if inGridBand50 ~= nil then
			enteredAtMs_1 = inGridBand50.enteredAtMs
			local var58 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then inGridBand50.currentContinuousMs else nil
			
			if var58 == nil then
				if enteredAtMs_1 ~= nil then
					local var59 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
					inGridBand50.cumulativeMs += var59
					
					if inGridBand50.maxContinuousMs < var59 then
						inGridBand50.maxContinuousMs = var59
					end
					inGridBand50.enteredAtMs = nil
				end
			elseif enteredAtMs_1 ~= nil or inGridBand50.pendingContinuity then
				inGridBand50.cumulativeMs += var58
				
				if inGridBand50.maxContinuousMs < var58 then
					inGridBand50.maxContinuousMs = var58
				end
				inGridBand50.enteredAtMs = nil
				inGridBand50.currentContinuousMs = 0
				inGridBand50.pendingContinuity = false
			end
		end
		if enteredAtMs ~= nil then
			enteredAtMs_1 = enteredAtMs.enteredAtMs
			local var60 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then enteredAtMs.currentContinuousMs else nil
			
			if var60 == nil then
				if enteredAtMs_1 ~= nil then
					local var61 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
					enteredAtMs.cumulativeMs += var61
					
					if enteredAtMs.maxContinuousMs < var61 then
						enteredAtMs.maxContinuousMs = var61
					end
					enteredAtMs.enteredAtMs = nil
				end
			elseif enteredAtMs_1 ~= nil or enteredAtMs.pendingContinuity then
				enteredAtMs.cumulativeMs += var60
				
				if enteredAtMs.maxContinuousMs < var60 then
					enteredAtMs.maxContinuousMs = var60
				end
				enteredAtMs.enteredAtMs = nil
				enteredAtMs.currentContinuousMs = 0
				enteredAtMs.pendingContinuity = false
			end
		end
		video.lastSampleMs = nil
		video.lastSnapshot = nil
		video.audioOnAtEvent = false
	else
		local band30 = self._band30
		local enteredAtMs = band30.enteredAtMs
		local var62 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
		
		if var62 == nil then
			if enteredAtMs ~= nil then
				local var63 = assert(p9, "image band requires an end timestamp") - enteredAtMs
				band30.cumulativeMs += var63
				
				if band30.maxContinuousMs < var63 then
					band30.maxContinuousMs = var63
				end
				band30.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band30.pendingContinuity then
			band30.cumulativeMs += var62
			
			if band30.maxContinuousMs < var62 then
				band30.maxContinuousMs = var62
			end
			band30.enteredAtMs = nil
			band30.currentContinuousMs = 0
			band30.pendingContinuity = false
		end
		local band50 = self._band50
		enteredAtMs = band50.enteredAtMs
		local var64 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
		
		if var64 == nil then
			if enteredAtMs ~= nil then
				local var65 = assert(p9, "image band requires an end timestamp") - enteredAtMs
				band50.cumulativeMs += var65
				
				if band50.maxContinuousMs < var65 then
					band50.maxContinuousMs = var65
				end
				band50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band50.pendingContinuity then
			band50.cumulativeMs += var64
			
			if band50.maxContinuousMs < var64 then
				band50.maxContinuousMs = var64
			end
			band50.enteredAtMs = nil
			band50.currentContinuousMs = 0
			band50.pendingContinuity = false
		end
		local band100 = self._band100
		local var66 = p9
		enteredAtMs = band100.enteredAtMs
		local var67 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
		
		if var67 == nil then
			if enteredAtMs ~= nil then
				local var68 = assert(var66, "image band requires an end timestamp") - enteredAtMs
				band100.cumulativeMs += var68
				
				if band100.maxContinuousMs < var68 then
					band100.maxContinuousMs = var68
				end
				band100.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band100.pendingContinuity then
			band100.cumulativeMs += var67
			
			if band100.maxContinuousMs < var67 then
				band100.maxContinuousMs = var67
			end
			band100.enteredAtMs = nil
			band100.currentContinuousMs = 0
			band100.pendingContinuity = false
		end
	end
	self._pausedAtMs = p9
end

function t_1:resume(p9)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local var51
	local pausedAtMs = self._pausedAtMs
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		var51 = self._video ~= nil
		var51 = nil
	else
		var51 = nil
	end
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var51 then
		if self._finalized or pausedAtMs == nil then return end
		p9 = math.max(p9, pausedAtMs)
	else
		assert(not self._finalized, "resume called after finalize")
		assert(pausedAtMs ~= nil, "resume called while not paused")
		assert(pausedAtMs <= p9, "resume timestamp precedes pause")
	end
	self._pausedDurationMs += p9 - pausedAtMs
	self._pausedAtMs = nil
	self._lastSampleMs = p9
	self._lastRatio = 0
	self._lastRealEstate = 0
end

function t_1:_advance_deprecated(p9, p10, p11)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), t (ref)
	assert(not self._finalized, "advance called after finalize")
	assert(self._pausedAtMs == nil, "advance called while paused")
	local t_1 = {}
	
	if p11 ~= nil then
		self:_classifyDisplayOnce(p11.adSize)
		self._latchedGeometry = p11
	end
	local enteredAtMs
	self:_accumulate(p9, p10, p11)
	local band30 = self._band30
	
	if band30.threshold > p10 then
		enteredAtMs = band30.enteredAtMs
		local var51 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
		
		if var51 == nil then
			if enteredAtMs ~= nil then
				local var52 = assert(p9, "image band requires an end timestamp") - enteredAtMs
				band30.cumulativeMs += var52
				
				if band30.maxContinuousMs < var52 then
					band30.maxContinuousMs = var52
				end
				band30.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band30.pendingContinuity then
			band30.cumulativeMs += var51
			
			if band30.maxContinuousMs < var51 then
				band30.maxContinuousMs = var51
			end
			band30.enteredAtMs = nil
			band30.currentContinuousMs = 0
			band30.pendingContinuity = false
		end
	elseif band30.enteredAtMs == nil then
		band30.enteredAtMs = p9
	end
	local band50 = self._band50
	
	if band50.threshold > p10 then
		enteredAtMs = band50.enteredAtMs
		local var53 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
		
		if var53 == nil then
			if enteredAtMs ~= nil then
				local var54 = assert(p9, "image band requires an end timestamp") - enteredAtMs
				band50.cumulativeMs += var54
				
				if band50.maxContinuousMs < var54 then
					band50.maxContinuousMs = var54
				end
				band50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band50.pendingContinuity then
			band50.cumulativeMs += var53
			
			if band50.maxContinuousMs < var53 then
				band50.maxContinuousMs = var53
			end
			band50.enteredAtMs = nil
			band50.currentContinuousMs = 0
			band50.pendingContinuity = false
		end
	elseif band50.enteredAtMs == nil then
		band50.enteredAtMs = p9
	end
	local band100 = self._band100
	
	if band100.threshold > p10 then
		enteredAtMs = band100.enteredAtMs
		local var55 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
		
		if var55 == nil then
			if enteredAtMs ~= nil then
				local var56 = assert(p9, "image band requires an end timestamp") - enteredAtMs
				band100.cumulativeMs += var56
				
				if band100.maxContinuousMs < var56 then
					band100.maxContinuousMs = var56
				end
				band100.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band100.pendingContinuity then
			band100.cumulativeMs += var55
			
			if band100.maxContinuousMs < var55 then
				band100.maxContinuousMs = var55
			end
			band100.enteredAtMs = nil
			band100.currentContinuousMs = 0
			band100.pendingContinuity = false
		end
	elseif band100.enteredAtMs == nil then
		band100.enteredAtMs = p9
	end
	if p11 == nil then
		return t_1
	end
	local displayLabel = self._displayLabel
	
	if displayLabel ~= nil then
		self:_tryFire(if displayLabel == t.IabDisplayLarge then self._band30 else self._band50, displayLabel, p9, p11, t_1)
	end
	self:_tryFire(self._band100, t.FullView, p9, p11, t_1)
	
	return t_1
end

function t_1:advance(p9, p10, p11, p12, p13)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), t (ref), var1 (ref)
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled or self._video == nil then
		return self:_advance_deprecated(p9, p10, p11)
	end
	local t_1 = {}
	
	if self._finalized or self._pausedAtMs ~= nil or p9 < (self._lastSampleMs or self.startTimestampMs) then
		return t_1, {}
	elseif p11 ~= nil then
		self._latchedGeometry = p11
	end
	local lastRatio = self._lastRatio
	self:_accumulate(p9, p10, p11)
	local var51, var52, var53 = self:_advanceVideo(p9, lastRatio, p10, p11, p12, p13 == true)
	
	if p11 == nil then
		return t_1, var51
	elseif var52 or var53 then
		self:_tryFire(self._band50, t.IabVideoStandard, p9, p11, t_1, var1)
		self:_tryFire(self._band100, t.FullViewVideo, p9, p11, t_1, 1000)
	end
	if var53 then
		local band30 = self._band30
		local enteredAtMs = band30.enteredAtMs
		local var54 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
		
		if var54 == nil then
			if enteredAtMs ~= nil then
				local var55 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band30.cumulativeMs += var55
				
				if band30.maxContinuousMs < var55 then
					band30.maxContinuousMs = var55
				end
				band30.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band30.pendingContinuity then
			band30.cumulativeMs += var54
			
			if band30.maxContinuousMs < var54 then
				band30.maxContinuousMs = var54
			end
			band30.enteredAtMs = nil
			band30.currentContinuousMs = 0
			band30.pendingContinuity = false
		end
		local band50 = self._band50
		enteredAtMs = band50.enteredAtMs
		local var56 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
		
		if var56 == nil then
			if enteredAtMs ~= nil then
				local var57 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band50.cumulativeMs += var57
				
				if band50.maxContinuousMs < var57 then
					band50.maxContinuousMs = var57
				end
				band50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band50.pendingContinuity then
			band50.cumulativeMs += var56
			
			if band50.maxContinuousMs < var56 then
				band50.maxContinuousMs = var56
			end
			band50.enteredAtMs = nil
			band50.currentContinuousMs = 0
			band50.pendingContinuity = false
		end
		local band100 = self._band100
		enteredAtMs = band100.enteredAtMs
		local var58 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
		
		if var58 == nil then
			if enteredAtMs ~= nil then
				local var59 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band100.cumulativeMs += var59
				
				if band100.maxContinuousMs < var59 then
					band100.maxContinuousMs = var59
				end
				band100.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band100.pendingContinuity then
			band100.cumulativeMs += var58
			
			if band100.maxContinuousMs < var58 then
				band100.maxContinuousMs = var58
			end
			band100.enteredAtMs = nil
			band100.currentContinuousMs = 0
			band100.pendingContinuity = false
		end
		local enteredAtMs_1
		local inGridBand50 = self._inGridBand50
		enteredAtMs = self._fullscreenBand50
		
		if inGridBand50 ~= nil then
			enteredAtMs_1 = inGridBand50.enteredAtMs
			local var60 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then inGridBand50.currentContinuousMs else nil
			
			if var60 == nil then
				if enteredAtMs_1 ~= nil then
					local var61 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
					inGridBand50.cumulativeMs += var61
					
					if inGridBand50.maxContinuousMs < var61 then
						inGridBand50.maxContinuousMs = var61
					end
					inGridBand50.enteredAtMs = nil
				end
			elseif enteredAtMs_1 ~= nil or inGridBand50.pendingContinuity then
				inGridBand50.cumulativeMs += var60
				
				if inGridBand50.maxContinuousMs < var60 then
					inGridBand50.maxContinuousMs = var60
				end
				inGridBand50.enteredAtMs = nil
				inGridBand50.currentContinuousMs = 0
				inGridBand50.pendingContinuity = false
			end
		end
		if enteredAtMs ~= nil then
			enteredAtMs_1 = enteredAtMs.enteredAtMs
			local var62 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then enteredAtMs.currentContinuousMs else nil
			
			if var62 == nil then
				if enteredAtMs_1 ~= nil then
					local var63 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
					enteredAtMs.cumulativeMs += var63
					
					if enteredAtMs.maxContinuousMs < var63 then
						enteredAtMs.maxContinuousMs = var63
					end
					enteredAtMs.enteredAtMs = nil
				end
			elseif enteredAtMs_1 ~= nil or enteredAtMs.pendingContinuity then
				enteredAtMs.cumulativeMs += var62
				
				if enteredAtMs.maxContinuousMs < var62 then
					enteredAtMs.maxContinuousMs = var62
				end
				enteredAtMs.enteredAtMs = nil
				enteredAtMs.currentContinuousMs = 0
				enteredAtMs.pendingContinuity = false
			end
		end
	end
	return t_1, var51
end

function t_1:_finalize_deprecated(p9)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	assert(not self._finalized, "finalize called more than once on the same session")
	self._finalized = true
	self:_accumulate(p9, self._lastRatio, self._latchedGeometry)
	local band30 = self._band30
	local enteredAtMs = band30.enteredAtMs
	local var51 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
	
	if var51 == nil then
		if enteredAtMs ~= nil then
			local var52 = assert(p9, "image band requires an end timestamp") - enteredAtMs
			band30.cumulativeMs += var52
			
			if band30.maxContinuousMs < var52 then
				band30.maxContinuousMs = var52
			end
			band30.enteredAtMs = nil
		end
	elseif enteredAtMs ~= nil or band30.pendingContinuity then
		band30.cumulativeMs += var51
		
		if band30.maxContinuousMs < var51 then
			band30.maxContinuousMs = var51
		end
		band30.enteredAtMs = nil
		band30.currentContinuousMs = 0
		band30.pendingContinuity = false
	end
	local band50 = self._band50
	enteredAtMs = band50.enteredAtMs
	local var53 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
	
	if var53 == nil then
		if enteredAtMs ~= nil then
			local var54 = assert(p9, "image band requires an end timestamp") - enteredAtMs
			band50.cumulativeMs += var54
			
			if band50.maxContinuousMs < var54 then
				band50.maxContinuousMs = var54
			end
			band50.enteredAtMs = nil
		end
	elseif enteredAtMs ~= nil or band50.pendingContinuity then
		band50.cumulativeMs += var53
		
		if band50.maxContinuousMs < var53 then
			band50.maxContinuousMs = var53
		end
		band50.enteredAtMs = nil
		band50.currentContinuousMs = 0
		band50.pendingContinuity = false
	end
	local band100 = self._band100
	enteredAtMs = band100.enteredAtMs
	local var55 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
	
	if var55 == nil then
		if enteredAtMs ~= nil then
			local var56 = assert(p9, "image band requires an end timestamp") - enteredAtMs
			band100.cumulativeMs += var56
			
			if band100.maxContinuousMs < var56 then
				band100.maxContinuousMs = var56
			end
			band100.enteredAtMs = nil
		end
	elseif enteredAtMs ~= nil or band100.pendingContinuity then
		band100.cumulativeMs += var55
		
		if band100.maxContinuousMs < var55 then
			band100.maxContinuousMs = var55
		end
		band100.enteredAtMs = nil
		band100.currentContinuousMs = 0
		band100.pendingContinuity = false
	end
	local visibleWeightedMs = self._visibleWeightedMs
	enteredAtMs = self._latchedGeometry
	local pausedDurationMs = self._pausedDurationMs
	local pausedAtMs = self._pausedAtMs
	
	if pausedAtMs ~= nil then
		assert(pausedAtMs <= p9, "session end precedes pause")
		pausedDurationMs += p9 - pausedAtMs
	end
	return {
		geometry = if enteredAtMs ~= nil then {
			adSize = Vector2.zero,
			viewportBounds = { min = Vector2.zero, max = Vector2.zero }
		} else {
			adSize = enteredAtMs.adSize,
			viewportBounds = {
				min = enteredAtMs.viewportBounds.min,
				max = enteredAtMs.viewportBounds.max
			}
		},
		viewabilitySessionStartTimestampMs = self.startTimestampMs,
		viewabilitySessionEndTimestampMs = p9,
		dwellDurationMs = p9 - self.startTimestampMs - pausedDurationMs,
		cumulative30PercentInViewDurationMs = self._band30.cumulativeMs,
		cumulative50PercentInViewDurationMs = self._band50.cumulativeMs,
		cumulative100PercentInViewDurationMs = self._band100.cumulativeMs,
		maxContinuous30PercentInViewDurationMs = self._band30.maxContinuousMs,
		maxContinuous50PercentInViewDurationMs = self._band50.maxContinuousMs,
		maxContinuous100PercentInViewDurationMs = self._band100.maxContinuousMs,
		averagePercentSeen = if visibleWeightedMs > 0 then self._percentWeightedSum / visibleWeightedMs else 0,
		minPercentSeen = self._minPercentSeen or 0,
		maxPercentSeen = self._maxPercentSeen or 0,
		averageOnScreenRealEstate = if visibleWeightedMs > 0 then self._realEstateWeightedSum / visibleWeightedMs else 0
	}
end

function t_1:finalize(p9)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), copyGeometry (ref)
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled or self._video == nil then
		return self:_finalize_deprecated(p9)
	elseif self._finalized then
		return self._terminalSnapshot
	end
	local video = self._video
	local inGridBand50 = self._inGridBand50
	local fullscreenBand50 = self._fullscreenBand50
	local maxValue = math.max(p9, self.startTimestampMs, self._lastSampleMs or self.startTimestampMs, self._pausedAtMs or self.startTimestampMs)
	
	if video == nil or inGridBand50 == nil or fullscreenBand50 == nil then
		maxValue = self:_finalize_deprecated(maxValue)
		self._terminalSnapshot = maxValue
		
		return maxValue
	end
	self._finalized = true
	self:_accumulate(maxValue, self._lastRatio, self._latchedGeometry)
	local band30 = self._band30
	local enteredAtMs = band30.enteredAtMs
	local var51 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
	
	if var51 == nil then
		if enteredAtMs ~= nil then
			local var52 = assert(nil, "image band requires an end timestamp") - enteredAtMs
			band30.cumulativeMs += var52
			
			if band30.maxContinuousMs < var52 then
				band30.maxContinuousMs = var52
			end
			band30.enteredAtMs = nil
		end
	elseif enteredAtMs ~= nil or band30.pendingContinuity then
		band30.cumulativeMs += var51
		
		if band30.maxContinuousMs < var51 then
			band30.maxContinuousMs = var51
		end
		band30.enteredAtMs = nil
		band30.currentContinuousMs = 0
		band30.pendingContinuity = false
	end
	local band50 = self._band50
	enteredAtMs = band50.enteredAtMs
	local var53 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
	
	if var53 == nil then
		if enteredAtMs ~= nil then
			local var54 = assert(nil, "image band requires an end timestamp") - enteredAtMs
			band50.cumulativeMs += var54
			
			if band50.maxContinuousMs < var54 then
				band50.maxContinuousMs = var54
			end
			band50.enteredAtMs = nil
		end
	elseif enteredAtMs ~= nil or band50.pendingContinuity then
		band50.cumulativeMs += var53
		
		if band50.maxContinuousMs < var53 then
			band50.maxContinuousMs = var53
		end
		band50.enteredAtMs = nil
		band50.currentContinuousMs = 0
		band50.pendingContinuity = false
	end
	local band100 = self._band100
	enteredAtMs = band100.enteredAtMs
	local var55 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
	
	if var55 == nil then
		if enteredAtMs ~= nil then
			local var56 = assert(nil, "image band requires an end timestamp") - enteredAtMs
			band100.cumulativeMs += var56
			
			if band100.maxContinuousMs < var56 then
				band100.maxContinuousMs = var56
			end
			band100.enteredAtMs = nil
		end
	elseif enteredAtMs ~= nil or band100.pendingContinuity then
		band100.cumulativeMs += var55
		
		if band100.maxContinuousMs < var55 then
			band100.maxContinuousMs = var55
		end
		band100.enteredAtMs = nil
		band100.currentContinuousMs = 0
		band100.pendingContinuity = false
	end
	local enteredAtMs_1 = inGridBand50.enteredAtMs
	enteredAtMs = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then inGridBand50.currentContinuousMs else nil
	
	if enteredAtMs == nil then
		if enteredAtMs_1 ~= nil then
			local var57 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
			inGridBand50.cumulativeMs += var57
			
			if inGridBand50.maxContinuousMs < var57 then
				inGridBand50.maxContinuousMs = var57
			end
			inGridBand50.enteredAtMs = nil
		end
	elseif enteredAtMs_1 ~= nil or inGridBand50.pendingContinuity then
		inGridBand50.cumulativeMs += enteredAtMs
		
		if inGridBand50.maxContinuousMs < enteredAtMs then
			inGridBand50.maxContinuousMs = enteredAtMs
		end
		inGridBand50.enteredAtMs = nil
		inGridBand50.currentContinuousMs = 0
		inGridBand50.pendingContinuity = false
	end
	enteredAtMs_1 = fullscreenBand50.enteredAtMs
	enteredAtMs = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then fullscreenBand50.currentContinuousMs else nil
	
	if enteredAtMs == nil then
		if enteredAtMs_1 ~= nil then
			local var58 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
			fullscreenBand50.cumulativeMs += var58
			
			if fullscreenBand50.maxContinuousMs < var58 then
				fullscreenBand50.maxContinuousMs = var58
			end
			fullscreenBand50.enteredAtMs = nil
		end
	elseif enteredAtMs_1 ~= nil or fullscreenBand50.pendingContinuity then
		fullscreenBand50.cumulativeMs += enteredAtMs
		
		if fullscreenBand50.maxContinuousMs < enteredAtMs then
			fullscreenBand50.maxContinuousMs = enteredAtMs
		end
		fullscreenBand50.enteredAtMs = nil
		fullscreenBand50.currentContinuousMs = 0
		fullscreenBand50.pendingContinuity = false
	end
	enteredAtMs_1 = self._visibleWeightedMs
	enteredAtMs = self._latchedGeometry
	local pausedDurationMs = self._pausedDurationMs
	local pausedAtMs = self._pausedAtMs
	
	if pausedAtMs ~= nil then
		pausedDurationMs += maxValue - pausedAtMs
	end
	local t = {
		geometry = if enteredAtMs ~= nil then {
			adSize = Vector2.zero,
			viewportBounds = { min = Vector2.zero, max = Vector2.zero }
		} else copyGeometry(enteredAtMs),
		viewabilitySessionStartTimestampMs = self.startTimestampMs,
		viewabilitySessionEndTimestampMs = maxValue,
		dwellDurationMs = maxValue - self.startTimestampMs - pausedDurationMs,
		cumulative30PercentInViewDurationMs = self._band30.cumulativeMs,
		cumulative50PercentInViewDurationMs = self._band50.cumulativeMs,
		cumulative100PercentInViewDurationMs = self._band100.cumulativeMs,
		maxContinuous30PercentInViewDurationMs = self._band30.maxContinuousMs,
		maxContinuous50PercentInViewDurationMs = self._band50.maxContinuousMs,
		maxContinuous100PercentInViewDurationMs = self._band100.maxContinuousMs,
		averagePercentSeen = if enteredAtMs_1 > 0 then self._percentWeightedSum / enteredAtMs_1 else 0,
		minPercentSeen = self._minPercentSeen or 0,
		maxPercentSeen = self._maxPercentSeen or 0,
		averageOnScreenRealEstate = if enteredAtMs_1 > 0 then self._realEstateWeightedSum / enteredAtMs_1 else 0,
		isFullScreen = video.isFullscreen,
		videoProgress = video.highestProgress,
		videoLengthMs = video.lengthMs,
		videoCumulativePlaytimeMs = video.cumulativePlaytimeMs,
		cumulativeAudioPlaybackDurationMs = video.cumulativeAudioPlaybackMs,
		cumulative100PercentAudibleTimeMs = video.cumulative100PercentAudibleMs,
		maxAudioLevel = video.maxAudioLevel,
		audioOnAtEvent = if video.highestProgress ~= nil then nil else video.audioOnAtEvent,
		cumulativeInGridViewDurationMs = inGridBand50.cumulativeMs,
		cumulativeFullScreenViewDurationMs = fullscreenBand50.cumulativeMs
	}
	self._terminalSnapshot = t
	
	return t
end

t_1.MilestoneLabels = t
t_1.MilestoneDurationMs = 1000

return t_1