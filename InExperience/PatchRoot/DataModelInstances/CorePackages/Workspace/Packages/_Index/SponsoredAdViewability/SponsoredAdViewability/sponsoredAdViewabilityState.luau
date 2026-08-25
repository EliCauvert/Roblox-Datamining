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

local function newBand(p0, p1)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	return if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p1 ~= nil then {
		enteredAtMs = nil,
		pendingContinuity = false,
		cumulativeMs = 0,
		maxContinuousMs = 0,
		threshold = p0,
		currentContinuousMs = p1
	} else {
		enteredAtMs = nil,
		cumulativeMs = 0,
		maxContinuousMs = 0,
		threshold = p0
	}
end

local function _(p2, p3)
	p2.cumulativeMs += p3
	
	if p2.maxContinuousMs < p3 then
		p2.maxContinuousMs = p3
	end
	p2.enteredAtMs = nil
end

local _ = function(p4, p5)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local enteredAtMs = p4.enteredAtMs
	local var9 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then p4.currentContinuousMs else nil
	
	if var9 == nil then
		if enteredAtMs == nil then return end
		local var10 = assert(p5, "image band requires an end timestamp") - enteredAtMs
		p4.cumulativeMs += var10
		
		if p4.maxContinuousMs < var10 then
			p4.maxContinuousMs = var10
		end
		p4.enteredAtMs = nil
		
		return
	elseif enteredAtMs == nil and not p4.pendingContinuity then return end
	p4.cumulativeMs += var9
	
	if p4.maxContinuousMs < var9 then
		p4.maxContinuousMs = var9
	end
	p4.enteredAtMs = nil
	p4.currentContinuousMs = 0
	p4.pendingContinuity = false
end

local _ = function(p6, p7, p8)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	if p6.threshold <= p7 then
		if p6.enteredAtMs == nil then
			p6.enteredAtMs = p8
			
			return
		end
	else
		local enteredAtMs = p6.enteredAtMs
		local var11 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then p6.currentContinuousMs else nil
		
		if var11 == nil then
			if enteredAtMs == nil then return end
			local var12 = assert(p8, "image band requires an end timestamp") - enteredAtMs
			p6.cumulativeMs += var12
			
			if p6.maxContinuousMs < var12 then
				p6.maxContinuousMs = var12
			end
			p6.enteredAtMs = nil
		elseif enteredAtMs == nil and not p6.pendingContinuity then return end
		p6.cumulativeMs += var11
		
		if p6.maxContinuousMs < var11 then
			p6.maxContinuousMs = var11
		end
		p6.enteredAtMs = nil
		p6.currentContinuousMs = 0
		p6.pendingContinuity = false
		
		return
	end
end

local _ = function(p9, p10)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local cumulativeMs = p9.cumulativeMs
	local maxContinuousMs = p9.maxContinuousMs
	local enteredAtMs = p9.enteredAtMs
	local var13 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then p9.currentContinuousMs else nil
	local var14 = nil
	
	if var13 == nil then
		if enteredAtMs ~= nil then
			var14 = assert(p10, "image band requires the current timestamp") - enteredAtMs
		end
	elseif enteredAtMs ~= nil or p9.pendingContinuity then
		var14 = var13
	end
	if var14 ~= nil then
		cumulativeMs += var14
		
		if maxContinuousMs < var14 then
			maxContinuousMs = var14
		end
	end
	return cumulativeMs, maxContinuousMs
end

local _ = function(p11)
	return if p11.enteredAtMs == nil then 0 else p11.currentContinuousMs or 0
end

local _ = function(vectorA)
	if vectorA.enteredAtMs ~= nil then
		vectorA.enteredAtMs = nil
		vectorA.pendingContinuity = true
	end
end

local function copyGeometry(p12)
	return {
		adSize = p12.adSize,
		viewportBounds = {
			min = p12.viewportBounds.min,
			max = p12.viewportBounds.max
		}
	}
end

local _ = function(p13)
	return p13 ~= nil and (p13.isPlaying and p13.audioLevel > 0)
end

local _ = function(p14)
	return typeof(p14) == "number" and (p14 >= 0 and p14 % 1 == 0)
end

local function isValidVideoPlaybackSnapshot(p15)
	local playbackPositionMs = p15.playbackPositionMs
	local loopCount = p15.loopCount
	local endedCount = p15.endedCount
	local audioLevel = p15.audioLevel
	local videoLengthMs = p15.videoLengthMs
	local var15 = false
	
	if typeof(p15.isPlaying) == "boolean" then
		var15 = false
		
		if typeof(playbackPositionMs) == "number" then
			var15 = false
			
			if playbackPositionMs >= 0 then
				var15 = typeof(loopCount) == "number" and (loopCount >= 0 and loopCount % 1 == 0)
				
				if var15 then
					if endedCount ~= nil then
						var15 = typeof(endedCount) == "number" and (endedCount >= 0 and endedCount % 1 == 0)
						
						if var15 then
							var15 = typeof(audioLevel) == "number" and (audioLevel >= 0 and (audioLevel <= 1 and (if videoLengthMs ~= nil then typeof(videoLengthMs) == "number" and videoLengthMs > 0 else true)))
						end
					end
				end
			end
		end
	end
	return var15
end

local _ = function(p16, p17)
	if p17 == nil then
		return 0
	end
	local viewportBounds = p17.viewportBounds
	local var16 = (viewportBounds.max.X - viewportBounds.min.X) * (viewportBounds.max.Y - viewportBounds.min.Y)
	
	return if var16 <= 0 then 0 else p16 * p17.adSize.X * p17.adSize.Y / var16
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p18, p19)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), newBand (ref), t_1 (ref)
	local var17 = fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p19 == true
	
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
		startTimestampMs = p18,
		_achieved = {},
		_band30 = newBand(0.3, if var17 then 0 else nil),
		_band50 = newBand(0.5, if var17 then 0 else nil),
		_band100 = newBand(1, if var17 then 0 else nil),
		_inGridBand50 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var17 then newBand(0.5, 0) else nil,
		_fullscreenBand50 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var17 then newBand(0.5, 0) else nil,
		_video = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var17 then {
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

function t_1:_classifyDisplayOnce(p20)
	-- upvalues: t (ref)
	if self._displayLabel ~= nil then return end
	local var18 = p20.X * p20.Y
	
	if var18 <= 0 then
		return
	end
	self._displayLabel = if var18 > 242500 then t.IabDisplayLarge else t.IabDisplayStandard
end

function t_1:_tryFire(p21, p22, p23, p24, p25, p26)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), copyGeometry (ref)
	if self._achieved[p22] then return end
	local var20
	local var19 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then self._video else nil
	local _ = false
	
	if var19 == nil then
		local enteredAtMs = p21.enteredAtMs
		var20 = enteredAtMs ~= nil and p23 - enteredAtMs >= 1000
	else
		var20 = (p26 or 1000) <= (if p21.enteredAtMs == nil then 0 else p21.currentContinuousMs or 0)
	end
	if not var20 then return end
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		self._achieved[p22] = true
	end
	local band30 = self._band30
	local cumulativeMs = band30.cumulativeMs
	local maxContinuousMs = band30.maxContinuousMs
	local enteredAtMs = band30.enteredAtMs
	local var21 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
	local var22 = nil
	
	if var21 == nil then
		if enteredAtMs ~= nil then
			var22 = assert(p23, "image band requires the current timestamp") - enteredAtMs
		end
	elseif enteredAtMs ~= nil or band30.pendingContinuity then
		var22 = var21
	end
	if var22 ~= nil then
		cumulativeMs += var22
		
		if maxContinuousMs < var22 then
			maxContinuousMs = var22
		end
	end
	local band50 = self._band50
	enteredAtMs = band50.cumulativeMs
	local maxContinuousMs_1 = band50.maxContinuousMs
	local enteredAtMs_1 = band50.enteredAtMs
	local var23 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
	local var24 = nil
	
	if var23 == nil then
		if enteredAtMs_1 ~= nil then
			var24 = assert(p23, "image band requires the current timestamp") - enteredAtMs_1
		end
	elseif enteredAtMs_1 ~= nil or band50.pendingContinuity then
		var24 = var23
	end
	if var24 ~= nil then
		enteredAtMs += var24
		
		if maxContinuousMs_1 < var24 then
			maxContinuousMs_1 = var24
		end
	end
	local band100 = self._band100
	enteredAtMs_1 = band100.cumulativeMs
	local maxContinuousMs_2 = band100.maxContinuousMs
	local enteredAtMs_2 = band100.enteredAtMs
	local var25 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
	local var26 = nil
	
	if var25 == nil then
		if enteredAtMs_2 ~= nil then
			var26 = assert(p23, "image band requires the current timestamp") - enteredAtMs_2
		end
	elseif enteredAtMs_2 ~= nil or band100.pendingContinuity then
		var26 = var25
	end
	if var26 ~= nil then
		enteredAtMs_1 += var26
		
		if maxContinuousMs_2 < var26 then
			maxContinuousMs_2 = var26
		end
	end
	maxContinuousMs_1 = {
		milestoneLabel = p22,
		geometry = copyGeometry(p24),
		viewabilitySessionStartTimestampMs = self.startTimestampMs,
		cumulative30PercentInViewDurationMs = cumulativeMs,
		cumulative50PercentInViewDurationMs = enteredAtMs,
		cumulative100PercentInViewDurationMs = enteredAtMs_1,
		maxContinuous30PercentInViewDurationMs = maxContinuousMs,
		maxContinuous50PercentInViewDurationMs = maxContinuousMs_1,
		maxContinuous100PercentInViewDurationMs = maxContinuousMs_2
	}
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var19 ~= nil then
		enteredAtMs_1 = self._inGridBand50
		local fullscreenBand50 = self._fullscreenBand50
		
		if enteredAtMs_1 == nil or fullscreenBand50 == nil then return end
		maxContinuousMs_1.isFullScreen = var19.isFullscreen
		maxContinuousMs_1.videoLengthMs = var19.lengthMs
		maxContinuousMs_1.maxAudioLevel = var19.maxAudioLevel
		local cumulativeMs_1 = enteredAtMs_1.cumulativeMs
		local maxContinuousMs_3 = enteredAtMs_1.maxContinuousMs
		local enteredAtMs_3 = enteredAtMs_1.enteredAtMs
		local var27 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then enteredAtMs_1.currentContinuousMs else nil
		local var28 = nil
		
		if var27 == nil then
			if enteredAtMs_3 ~= nil then
				var28 = assert(nil, "image band requires the current timestamp") - enteredAtMs_3
			end
		elseif enteredAtMs_3 ~= nil or enteredAtMs_1.pendingContinuity then
			var28 = var27
		end
		if var28 ~= nil then
			cumulativeMs_1 += var28
			
			if maxContinuousMs_3 < var28 then
				maxContinuousMs_3 = var28
			end
		end
		maxContinuousMs_1.cumulativeInGridViewDurationMs = cumulativeMs_1
		local cumulativeMs_2 = fullscreenBand50.cumulativeMs
		local maxContinuousMs_4 = fullscreenBand50.maxContinuousMs
		enteredAtMs_3 = fullscreenBand50.enteredAtMs
		local var29 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then fullscreenBand50.currentContinuousMs else nil
		local var30 = nil
		
		if var29 == nil then
			if enteredAtMs_3 ~= nil then
				var30 = assert(nil, "image band requires the current timestamp") - enteredAtMs_3
			end
		elseif enteredAtMs_3 ~= nil or fullscreenBand50.pendingContinuity then
			var30 = var29
		end
		if var30 ~= nil then
			cumulativeMs_2 += var30
			
			if maxContinuousMs_4 < var30 then
				maxContinuousMs_4 = var30
			end
		end
		maxContinuousMs_1.cumulativeFullScreenViewDurationMs = cumulativeMs_2
	end
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		self._achieved[p22] = true
	end
	table.insert(p25, maxContinuousMs_1)
end

function t_1:_accumulate(p27, p28, p29)
	local lastSampleMs = self._lastSampleMs
	
	if lastSampleMs ~= nil and self._lastRatio > 0 then
		local var31 = p27 - lastSampleMs
		
		if var31 > 0 then
			self._percentWeightedSum += self._lastRatio * var31
			self._realEstateWeightedSum += self._lastRealEstate * var31
			self._visibleWeightedMs += var31
		end
	end
	local var32
	self._lastSampleMs = p27
	self._lastRatio = p28
	
	if p29 == nil then
		var32 = 0
	else
		local viewportBounds = p29.viewportBounds
		local var33 = (viewportBounds.max.X - viewportBounds.min.X) * (viewportBounds.max.Y - viewportBounds.min.Y)
		var32 = if var33 <= 0 then 0 else p28 * p29.adSize.X * p29.adSize.Y / var33
	end
	self._lastRealEstate = var32
	
	if p28 > 0 then
		if self._minPercentSeen == nil or p28 < self._minPercentSeen then
			self._minPercentSeen = p28
		end
		if self._maxPercentSeen == nil or self._maxPercentSeen < p28 then
			self._maxPercentSeen = p28
		end
	end
end

local function updateVideoBand(p30, p31, p32, p33, p34, p35, p36)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local enteredAtMs
	if p30.pendingContinuity then
		if p32 and p30.threshold <= p34 then
			p30.pendingContinuity = false
			p30.enteredAtMs = p36
			local currentContinuousMs = p30.currentContinuousMs
			
			if p31 and currentContinuousMs ~= nil then
				p30.currentContinuousMs = currentContinuousMs + p35
				
				return
			end
		else
			local enteredAtMs = p30.enteredAtMs
			local var34 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then p30.currentContinuousMs else nil
			
			if var34 == nil then
				if enteredAtMs == nil then return end
				local var35 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				p30.cumulativeMs += var35
				
				if p30.maxContinuousMs < var35 then
					p30.maxContinuousMs = var35
				end
				p30.enteredAtMs = nil
			elseif enteredAtMs == nil and not p30.pendingContinuity then return end
			p30.cumulativeMs += var34
			
			if p30.maxContinuousMs < var34 then
				p30.maxContinuousMs = var34
			end
			p30.enteredAtMs = nil
			p30.currentContinuousMs = 0
			p30.pendingContinuity = false
			
			return
		end
		return
	elseif p31 and p30.threshold <= p34 then
		if p33 < p30.threshold then
			enteredAtMs = p30.enteredAtMs
			local var36 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then p30.currentContinuousMs else nil
			
			if var36 == nil then
				if enteredAtMs ~= nil then
					local var37 = assert(nil, "image band requires an end timestamp") - enteredAtMs
					p30.cumulativeMs += var37
					
					if p30.maxContinuousMs < var37 then
						p30.maxContinuousMs = var37
					end
					p30.enteredAtMs = nil
				end
			elseif enteredAtMs ~= nil or p30.pendingContinuity then
				p30.cumulativeMs += var36
				
				if p30.maxContinuousMs < var36 then
					p30.maxContinuousMs = var36
				end
				p30.enteredAtMs = nil
				p30.currentContinuousMs = 0
				p30.pendingContinuity = false
			end
			if p32 then
				p30.enteredAtMs = p36
			end
			return
		elseif p30.enteredAtMs == nil then
			p30.enteredAtMs = p36
		end
		enteredAtMs = p30.currentContinuousMs
		
		if enteredAtMs == nil then
			p30.enteredAtMs = nil
			p30.pendingContinuity = false
			
			return
		end
		p30.currentContinuousMs = enteredAtMs + p35
		
		if not p32 then
			local enteredAtMs_1 = p30.enteredAtMs
			local var38 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then p30.currentContinuousMs else nil
			
			if var38 == nil then
				if enteredAtMs_1 == nil then return end
				local var39 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
				p30.cumulativeMs += var39
				
				if p30.maxContinuousMs < var39 then
					p30.maxContinuousMs = var39
				end
				p30.enteredAtMs = nil
			elseif enteredAtMs_1 == nil and not p30.pendingContinuity then return end
			p30.cumulativeMs += var38
			
			if p30.maxContinuousMs < var38 then
				p30.maxContinuousMs = var38
			end
			p30.enteredAtMs = nil
			p30.currentContinuousMs = 0
			p30.pendingContinuity = false
			
			return
		end
		return
	else
		enteredAtMs = p30.enteredAtMs
		local var40 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then p30.currentContinuousMs else nil
		
		if var40 == nil then
			if enteredAtMs == nil then return end
			local var41 = assert(nil, "image band requires an end timestamp") - enteredAtMs
			p30.cumulativeMs += var41
			
			if p30.maxContinuousMs < var41 then
				p30.maxContinuousMs = var41
			end
			p30.enteredAtMs = nil
			
			return
		elseif enteredAtMs == nil and not p30.pendingContinuity then return end
		p30.cumulativeMs += var40
		
		if p30.maxContinuousMs < var40 then
			p30.maxContinuousMs = var40
		end
		p30.enteredAtMs = nil
		p30.currentContinuousMs = 0
		p30.pendingContinuity = false
	end
end

local _ = function(p37, p38, p39, p40, p41, p42, p43, p44)
	-- upvalues: updateVideoBand (ref)
	p38 = p38 or p37.pendingContinuity == true
	updateVideoBand(p37, p39 and p38, p40 and p38, p41, p42, p43, p44)
end

local _ = function(p45, p46, p47, p48, p49)
	if p45 == nil or p46 == nil or (p47 == nil or p48 == nil) then
		return 0
	elseif p48 < p47 then
		return 0
	end
	local var43 = p48 - p47
	
	return if var43 == 0 then math.max(0, p46 - p45) elseif p49 == nil or p49 <= 0 then 0 else math.max(0, var43 * p49 + p46 - p45)
end

local _ = function(p50, p51, p52)
	return if p50 then 100 elseif p51 == nil or p51 <= 0 then 0 else math.clamp(p52 / p51 * 100, 0, 100)
end

function t_1:_buildVideoProgressMilestone(p53, p54)
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
	local var44 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
	local var45 = nil
	
	if var44 == nil then
		if enteredAtMs ~= nil then
			var45 = assert(nil, "image band requires the current timestamp") - enteredAtMs
		end
	elseif enteredAtMs ~= nil or band30.pendingContinuity then
		var45 = var44
	end
	if var45 ~= nil then
		cumulativeMs += var45
		
		if maxContinuousMs < var45 then
			maxContinuousMs = var45
		end
	end
	local band50 = self._band50
	enteredAtMs = band50.cumulativeMs
	local maxContinuousMs_1 = band50.maxContinuousMs
	local enteredAtMs_1 = band50.enteredAtMs
	local var46 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
	local var47 = nil
	
	if var46 == nil then
		if enteredAtMs_1 ~= nil then
			var47 = assert(nil, "image band requires the current timestamp") - enteredAtMs_1
		end
	elseif enteredAtMs_1 ~= nil or band50.pendingContinuity then
		var47 = var46
	end
	if var47 ~= nil then
		enteredAtMs += var47
		
		if maxContinuousMs_1 < var47 then
			maxContinuousMs_1 = var47
		end
	end
	local band100 = self._band100
	enteredAtMs_1 = band100.cumulativeMs
	local maxContinuousMs_2 = band100.maxContinuousMs
	local enteredAtMs_2 = band100.enteredAtMs
	local var48 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
	local var49 = nil
	
	if var48 == nil then
		if enteredAtMs_2 ~= nil then
			var49 = assert(nil, "image band requires the current timestamp") - enteredAtMs_2
		end
	elseif enteredAtMs_2 ~= nil or band100.pendingContinuity then
		var49 = var48
	end
	if var49 ~= nil then
		enteredAtMs_1 += var49
		
		if maxContinuousMs_2 < var49 then
			maxContinuousMs_2 = var49
		end
	end
	enteredAtMs_1 = inGridBand50.cumulativeMs
	local maxContinuousMs_3 = inGridBand50.maxContinuousMs
	enteredAtMs_2 = inGridBand50.enteredAtMs
	local var50 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then inGridBand50.currentContinuousMs else nil
	local var51 = nil
	
	if var50 == nil then
		if enteredAtMs_2 ~= nil then
			var51 = assert(nil, "image band requires the current timestamp") - enteredAtMs_2
		end
	elseif enteredAtMs_2 ~= nil or inGridBand50.pendingContinuity then
		var51 = var50
	end
	if var51 ~= nil then
		enteredAtMs_1 += var51
		
		if maxContinuousMs_3 < var51 then
			maxContinuousMs_3 = var51
		end
	end
	local cumulativeMs_1 = fullscreenBand50.cumulativeMs
	enteredAtMs_2 = fullscreenBand50.maxContinuousMs
	local enteredAtMs_3 = fullscreenBand50.enteredAtMs
	local var52 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then fullscreenBand50.currentContinuousMs else nil
	local var53 = nil
	
	if var52 == nil then
		if enteredAtMs_3 ~= nil then
			var53 = assert(nil, "image band requires the current timestamp") - enteredAtMs_3
		end
	elseif enteredAtMs_3 ~= nil or fullscreenBand50.pendingContinuity then
		var53 = var52
	end
	if var53 ~= nil then
		cumulativeMs_1 += var53
		
		if enteredAtMs_2 < var53 then
			enteredAtMs_2 = var53
		end
	end
	return {
		geometry = copyGeometry(p54),
		viewabilitySessionStartTimestampMs = self.startTimestampMs,
		cumulative30PercentInViewDurationMs = cumulativeMs,
		cumulative50PercentInViewDurationMs = enteredAtMs,
		cumulative100PercentInViewDurationMs = enteredAtMs_1,
		maxContinuous30PercentInViewDurationMs = maxContinuousMs,
		maxContinuous50PercentInViewDurationMs = maxContinuousMs_1,
		maxContinuous100PercentInViewDurationMs = maxContinuousMs_2,
		videoProgress = p53,
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

function t_1:_advanceVideo(p55, p56, p57, p58, p59, p60)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), isValidVideoPlaybackSnapshot (ref), updateVideoBand (ref), var2 (ref)
	local enteredAtMs
	local t = {}
	
	if self._video == nil or self._inGridBand50 == nil or self._fullscreenBand50 == nil then
		local band30 = self._band30
		enteredAtMs = band30.enteredAtMs
		local var55 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
		
		if var55 == nil then
			if enteredAtMs ~= nil then
				local var56 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band30.cumulativeMs += var56
				
				if band30.maxContinuousMs < var56 then
					band30.maxContinuousMs = var56
				end
				band30.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band30.pendingContinuity then
			band30.cumulativeMs += var55
			
			if band30.maxContinuousMs < var55 then
				band30.maxContinuousMs = var55
			end
			band30.enteredAtMs = nil
			band30.currentContinuousMs = 0
			band30.pendingContinuity = false
		end
		local band50 = self._band50
		enteredAtMs = band50.enteredAtMs
		local var57 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
		
		if var57 == nil then
			if enteredAtMs ~= nil then
				local var58 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band50.cumulativeMs += var58
				
				if band50.maxContinuousMs < var58 then
					band50.maxContinuousMs = var58
				end
				band50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band50.pendingContinuity then
			band50.cumulativeMs += var57
			
			if band50.maxContinuousMs < var57 then
				band50.maxContinuousMs = var57
			end
			band50.enteredAtMs = nil
			band50.currentContinuousMs = 0
			band50.pendingContinuity = false
		end
		local band100 = self._band100
		enteredAtMs = band100.enteredAtMs
		local var59 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
		
		if var59 == nil then
			if enteredAtMs ~= nil then
				local var60 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band100.cumulativeMs += var60
				
				if band100.maxContinuousMs < var60 then
					band100.maxContinuousMs = var60
				end
				band100.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band100.pendingContinuity then
			band100.cumulativeMs += var59
			
			if band100.maxContinuousMs < var59 then
				band100.maxContinuousMs = var59
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
		
		if p59 ~= nil and not isValidVideoPlaybackSnapshot(p59) then
			p59 = nil
		end
		local enteredAtMs_1, enteredAtMs_2
		video.isFullscreen = p60
		local var61 = p59
		video.audioOnAtEvent = var61 ~= nil and (var61.isPlaying and var61.audioLevel > 0)
		
		if p59 == nil then
			local band30 = self._band30
			
			if band30.pendingContinuity then
				enteredAtMs_1 = band30.enteredAtMs
				local var62 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
				
				if var62 == nil then
					if enteredAtMs_1 ~= nil then
						local var63 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
						band30.cumulativeMs += var63
						
						if band30.maxContinuousMs < var63 then
							band30.maxContinuousMs = var63
						end
						band30.enteredAtMs = nil
					end
				elseif enteredAtMs_1 ~= nil or band30.pendingContinuity then
					band30.cumulativeMs += var62
					
					if band30.maxContinuousMs < var62 then
						band30.maxContinuousMs = var62
					end
					band30.enteredAtMs = nil
					band30.currentContinuousMs = 0
					band30.pendingContinuity = false
				end
			else
				enteredAtMs_1 = band30.enteredAtMs
				local var64 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
				
				if var64 == nil then
					if enteredAtMs_1 ~= nil then
						local var65 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
						band30.cumulativeMs += var65
						
						if band30.maxContinuousMs < var65 then
							band30.maxContinuousMs = var65
						end
						band30.enteredAtMs = nil
					end
				elseif enteredAtMs_1 ~= nil or band30.pendingContinuity then
					band30.cumulativeMs += var64
					
					if band30.maxContinuousMs < var64 then
						band30.maxContinuousMs = var64
					end
					band30.enteredAtMs = nil
					band30.currentContinuousMs = 0
					band30.pendingContinuity = false
				end
			end
			local band50 = self._band50
			
			if band50.pendingContinuity then
				enteredAtMs_1 = band50.enteredAtMs
				local var66 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
				
				if var66 == nil then
					if enteredAtMs_1 ~= nil then
						local var67 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
						band50.cumulativeMs += var67
						
						if band50.maxContinuousMs < var67 then
							band50.maxContinuousMs = var67
						end
						band50.enteredAtMs = nil
					end
				elseif enteredAtMs_1 ~= nil or band50.pendingContinuity then
					band50.cumulativeMs += var66
					
					if band50.maxContinuousMs < var66 then
						band50.maxContinuousMs = var66
					end
					band50.enteredAtMs = nil
					band50.currentContinuousMs = 0
					band50.pendingContinuity = false
				end
			else
				enteredAtMs_1 = band50.enteredAtMs
				local var68 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
				
				if var68 == nil then
					if enteredAtMs_1 ~= nil then
						local var69 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
						band50.cumulativeMs += var69
						
						if band50.maxContinuousMs < var69 then
							band50.maxContinuousMs = var69
						end
						band50.enteredAtMs = nil
					end
				elseif enteredAtMs_1 ~= nil or band50.pendingContinuity then
					band50.cumulativeMs += var68
					
					if band50.maxContinuousMs < var68 then
						band50.maxContinuousMs = var68
					end
					band50.enteredAtMs = nil
					band50.currentContinuousMs = 0
					band50.pendingContinuity = false
				end
			end
			local band100 = self._band100
			
			if band100.pendingContinuity then
				enteredAtMs_1 = band100.enteredAtMs
				local var70 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
				
				if var70 == nil then
					if enteredAtMs_1 ~= nil then
						local var71 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
						band100.cumulativeMs += var71
						
						if band100.maxContinuousMs < var71 then
							band100.maxContinuousMs = var71
						end
						band100.enteredAtMs = nil
					end
				elseif enteredAtMs_1 ~= nil or band100.pendingContinuity then
					band100.cumulativeMs += var70
					
					if band100.maxContinuousMs < var70 then
						band100.maxContinuousMs = var70
					end
					band100.enteredAtMs = nil
					band100.currentContinuousMs = 0
					band100.pendingContinuity = false
				end
			else
				enteredAtMs_1 = band100.enteredAtMs
				local var72 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
				
				if var72 == nil then
					if enteredAtMs_1 ~= nil then
						local var73 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
						band100.cumulativeMs += var73
						
						if band100.maxContinuousMs < var73 then
							band100.maxContinuousMs = var73
						end
						band100.enteredAtMs = nil
					end
				elseif enteredAtMs_1 ~= nil or band100.pendingContinuity then
					band100.cumulativeMs += var72
					
					if band100.maxContinuousMs < var72 then
						band100.maxContinuousMs = var72
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
						local var74 = assert(nil, "image band requires an end timestamp") - enteredAtMs_2
						enteredAtMs.cumulativeMs += var74
						
						if enteredAtMs.maxContinuousMs < var74 then
							enteredAtMs.maxContinuousMs = var74
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
						local var75 = assert(nil, "image band requires an end timestamp") - enteredAtMs_2
						enteredAtMs.cumulativeMs += var75
						
						if enteredAtMs.maxContinuousMs < var75 then
							enteredAtMs.maxContinuousMs = var75
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
						local var76 = assert(nil, "image band requires an end timestamp") - enteredAtMs_2
						fullscreenBand50.cumulativeMs += var76
						
						if fullscreenBand50.maxContinuousMs < var76 then
							fullscreenBand50.maxContinuousMs = var76
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
						local var77 = assert(nil, "image band requires an end timestamp") - enteredAtMs_2
						fullscreenBand50.cumulativeMs += var77
						
						if fullscreenBand50.maxContinuousMs < var77 then
							fullscreenBand50.maxContinuousMs = var77
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
			video.lastSampleMs = p55
			video.lastSnapshot = nil
			
			return t, false, false
		elseif p59.videoLengthMs ~= nil then
			video.lengthMs = p59.videoLengthMs
		end
		local var82
		enteredAtMs_2 = p59.playbackPositionMs
		enteredAtMs_1 = p59.loopCount
		local endedCount = p59.endedCount or 0
		local var79 = if lastSnapshot then lastSnapshot.endedCount or 0 else nil
		local var80 = if lastSnapshot then lastSnapshot.playbackPositionMs else nil
		local var81 = if lastSnapshot then lastSnapshot.loopCount else nil
		local lengthMs = video.lengthMs
		
		if var80 == nil or enteredAtMs_2 == nil or (var81 == nil or enteredAtMs_1 == nil) then
			var82 = 0
		elseif enteredAtMs_1 < var81 then
			var82 = 0
		else
			local var83 = enteredAtMs_1 - var81
			var82 = if var83 == 0 then math.max(0, enteredAtMs_2 - var80) elseif lengthMs == nil or lengthMs <= 0 then 0 else math.max(0, var83 * lengthMs + enteredAtMs_2 - var80)
		end
		var80 = lastSnapshot ~= nil and lastSnapshot.loopCount < enteredAtMs_1
		var81 = var79 ~= nil and endedCount < var79
		lengthMs = var79 ~= nil and (not var81 and var79 < endedCount)
		local var80_1 = var80 or lengthMs
		local var85 = lastSnapshot ~= nil and lastSnapshot.isPlaying
		local isPlaying = p59.isPlaying
		local var86 = var85 and (var82 > 0 and (not var81 and (isPlaying or lengthMs)))
		local var87 = var86 and (isPlaying and not lengthMs)
		local var88 = if var86 then math.min(if lastSampleMs ~= nil then p55 - lastSampleMs else 0, var82) else 0
		local var89 = lengthMs and (var86 and p58 ~= nil)
		local isPlaying_1 = isPlaying or var89
		
		for i, v in { self._band30, self._band50, self._band100 } do
			updateVideoBand(v, var86, isPlaying_1, p56, p57, var88, p55)
		end
		local var93
		local var91 = not p60 or enteredAtMs.pendingContinuity == true
		updateVideoBand(enteredAtMs, var86 and var91, isPlaying_1 and var91, p56, p57, var88, p55)
		p60 = p60 or fullscreenBand50.pendingContinuity == true
		updateVideoBand(fullscreenBand50, var86 and p60, isPlaying_1 and p60, p56, p57, var88, p55)
		
		if var86 then
			video.cumulativePlaytimeMs += var88
			
			if lastSnapshot ~= nil then
				var93 = lastSnapshot ~= nil and (lastSnapshot.isPlaying and lastSnapshot.audioLevel > 0)
				
				if var93 then
					local var94 = p59
					var93 = var94 ~= nil and (var94.isPlaying and var94.audioLevel > 0)
					
					if var93 or lengthMs then
						video.cumulativeAudioPlaybackMs += var88
						video.maxAudioLevel = math.max(video.maxAudioLevel, lastSnapshot.audioLevel, p59.audioLevel)
						
						if p56 >= 1 and p57 >= 1 then
							video.cumulative100PercentAudibleMs += var88
						end
					end
				end
			end
		end
		if (var86 or var80_1) and p58 ~= nil then
			local lengthMs_1 = video.lengthMs
			var93 = if var80_1 then 100 elseif lengthMs_1 == nil or lengthMs_1 <= 0 then 0 else math.clamp(enteredAtMs_2 / lengthMs_1 * 100, 0, 100)
			
			for i_1, v_1 in var2 do
				if (video.highestProgress == nil or video.highestProgress < v_1) and v_1 <= var93 then
					local var95 = self:_buildVideoProgressMilestone(v_1, p58)
					
					if var95 ~= nil then
						video.highestProgress = v_1
						table.insert(t, var95)
					end
				end
			end
		end
		video.lastSampleMs = p55
		video.lastSnapshot = p59
		
		return t, var87, var89
	end
end

function t_1:transitionVideoSource(p61, p62)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local video = self._video
	local inGridBand50 = self._inGridBand50
	local fullscreenBand50 = self._fullscreenBand50
	
	if self._finalized or self._pausedAtMs ~= nil or (video == nil or inGridBand50 == nil) or fullscreenBand50 == nil then return end
	local maxValue = math.max(p61, video.lastSampleMs or self.startTimestampMs)
	
	if p62 then
		for i, v in { self._band30, self._band50, self._band100 } do
			if v.enteredAtMs ~= nil then
				v.enteredAtMs = nil
				v.pendingContinuity = true
			end
		end
		if video.isFullscreen then
			local enteredAtMs = inGridBand50.enteredAtMs
			local var103 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then inGridBand50.currentContinuousMs else nil
			
			if var103 == nil then
				if enteredAtMs ~= nil then
					local var104 = assert(nil, "image band requires an end timestamp") - enteredAtMs
					inGridBand50.cumulativeMs += var104
					
					if inGridBand50.maxContinuousMs < var104 then
						inGridBand50.maxContinuousMs = var104
					end
					inGridBand50.enteredAtMs = nil
				end
			elseif enteredAtMs ~= nil or inGridBand50.pendingContinuity then
				inGridBand50.cumulativeMs += var103
				
				if inGridBand50.maxContinuousMs < var103 then
					inGridBand50.maxContinuousMs = var103
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
		local var105 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then fullscreenBand50.currentContinuousMs else nil
		
		if var105 == nil then
			if enteredAtMs ~= nil then
				local var106 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				fullscreenBand50.cumulativeMs += var106
				
				if fullscreenBand50.maxContinuousMs < var106 then
					fullscreenBand50.maxContinuousMs = var106
				end
				fullscreenBand50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or fullscreenBand50.pendingContinuity then
			fullscreenBand50.cumulativeMs += var105
			
			if fullscreenBand50.maxContinuousMs < var105 then
				fullscreenBand50.maxContinuousMs = var105
			end
			fullscreenBand50.enteredAtMs = nil
			fullscreenBand50.currentContinuousMs = 0
			fullscreenBand50.pendingContinuity = false
		end
	else
		for i, v in { self._band30, self._band50, self._band100 } do
			local enteredAtMs = v.enteredAtMs
			local var101 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then v.currentContinuousMs else nil
			
			if var101 == nil then
				if enteredAtMs ~= nil then
					local var102 = assert(nil, "image band requires an end timestamp") - enteredAtMs
					v.cumulativeMs += var102
					
					if v.maxContinuousMs < var102 then
						v.maxContinuousMs = var102
					end
					v.enteredAtMs = nil
				end
			elseif enteredAtMs ~= nil or v.pendingContinuity then
				v.cumulativeMs += var101
				
				if v.maxContinuousMs < var101 then
					v.maxContinuousMs = var101
				end
				v.enteredAtMs = nil
				v.currentContinuousMs = 0
				v.pendingContinuity = false
			end
		end
		local enteredAtMs = inGridBand50.enteredAtMs
		local var97 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then inGridBand50.currentContinuousMs else nil
		
		if var97 == nil then
			if enteredAtMs ~= nil then
				local var98 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				inGridBand50.cumulativeMs += var98
				
				if inGridBand50.maxContinuousMs < var98 then
					inGridBand50.maxContinuousMs = var98
				end
				inGridBand50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or inGridBand50.pendingContinuity then
			inGridBand50.cumulativeMs += var97
			
			if inGridBand50.maxContinuousMs < var97 then
				inGridBand50.maxContinuousMs = var97
			end
			inGridBand50.enteredAtMs = nil
			inGridBand50.currentContinuousMs = 0
			inGridBand50.pendingContinuity = false
		end
		enteredAtMs = fullscreenBand50.enteredAtMs
		local var99 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then fullscreenBand50.currentContinuousMs else nil
		
		if var99 == nil then
			if enteredAtMs ~= nil then
				local var100 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				fullscreenBand50.cumulativeMs += var100
				
				if fullscreenBand50.maxContinuousMs < var100 then
					fullscreenBand50.maxContinuousMs = var100
				end
				fullscreenBand50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or fullscreenBand50.pendingContinuity then
			fullscreenBand50.cumulativeMs += var99
			
			if fullscreenBand50.maxContinuousMs < var99 then
				fullscreenBand50.maxContinuousMs = var99
			end
			fullscreenBand50.enteredAtMs = nil
			fullscreenBand50.currentContinuousMs = 0
			fullscreenBand50.pendingContinuity = false
		end
	end
	if not p62 then
		video.lastSampleMs = nil
		video.lastSnapshot = nil
	end
	video.audioOnAtEvent = false
	self._lastSampleMs = maxValue
	self._lastRatio = 0
	self._lastRealEstate = 0
end

function t_1:pause(p63)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local var107
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		var107 = self._video ~= nil
		var107 = nil
	else
		var107 = nil
	end
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var107 then
		if self._finalized or self._pausedAtMs ~= nil then return end
		p63 = math.max(p63, self._lastSampleMs or self.startTimestampMs)
	else
		assert(not self._finalized, "pause called after finalize")
		assert(self._pausedAtMs == nil, "pause called while already paused")
		assert((self._lastSampleMs or self.startTimestampMs) <= p63, "pause timestamp precedes the last sample")
	end
	self:_accumulate(p63, 0, nil)
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var107 then
		local video = self._video
		local band30 = self._band30
		local enteredAtMs = band30.enteredAtMs
		local var115 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
		
		if var115 == nil then
			if enteredAtMs ~= nil then
				local var116 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band30.cumulativeMs += var116
				
				if band30.maxContinuousMs < var116 then
					band30.maxContinuousMs = var116
				end
				band30.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band30.pendingContinuity then
			band30.cumulativeMs += var115
			
			if band30.maxContinuousMs < var115 then
				band30.maxContinuousMs = var115
			end
			band30.enteredAtMs = nil
			band30.currentContinuousMs = 0
			band30.pendingContinuity = false
		end
		local band50 = self._band50
		enteredAtMs = band50.enteredAtMs
		local var117 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
		
		if var117 == nil then
			if enteredAtMs ~= nil then
				local var118 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band50.cumulativeMs += var118
				
				if band50.maxContinuousMs < var118 then
					band50.maxContinuousMs = var118
				end
				band50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band50.pendingContinuity then
			band50.cumulativeMs += var117
			
			if band50.maxContinuousMs < var117 then
				band50.maxContinuousMs = var117
			end
			band50.enteredAtMs = nil
			band50.currentContinuousMs = 0
			band50.pendingContinuity = false
		end
		local band100 = self._band100
		enteredAtMs = band100.enteredAtMs
		local var119 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
		
		if var119 == nil then
			if enteredAtMs ~= nil then
				local var120 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band100.cumulativeMs += var120
				
				if band100.maxContinuousMs < var120 then
					band100.maxContinuousMs = var120
				end
				band100.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band100.pendingContinuity then
			band100.cumulativeMs += var119
			
			if band100.maxContinuousMs < var119 then
				band100.maxContinuousMs = var119
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
			local var121 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then inGridBand50.currentContinuousMs else nil
			
			if var121 == nil then
				if enteredAtMs_1 ~= nil then
					local var122 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
					inGridBand50.cumulativeMs += var122
					
					if inGridBand50.maxContinuousMs < var122 then
						inGridBand50.maxContinuousMs = var122
					end
					inGridBand50.enteredAtMs = nil
				end
			elseif enteredAtMs_1 ~= nil or inGridBand50.pendingContinuity then
				inGridBand50.cumulativeMs += var121
				
				if inGridBand50.maxContinuousMs < var121 then
					inGridBand50.maxContinuousMs = var121
				end
				inGridBand50.enteredAtMs = nil
				inGridBand50.currentContinuousMs = 0
				inGridBand50.pendingContinuity = false
			end
		end
		if enteredAtMs ~= nil then
			enteredAtMs_1 = enteredAtMs.enteredAtMs
			local var123 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then enteredAtMs.currentContinuousMs else nil
			
			if var123 == nil then
				if enteredAtMs_1 ~= nil then
					local var124 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
					enteredAtMs.cumulativeMs += var124
					
					if enteredAtMs.maxContinuousMs < var124 then
						enteredAtMs.maxContinuousMs = var124
					end
					enteredAtMs.enteredAtMs = nil
				end
			elseif enteredAtMs_1 ~= nil or enteredAtMs.pendingContinuity then
				enteredAtMs.cumulativeMs += var123
				
				if enteredAtMs.maxContinuousMs < var123 then
					enteredAtMs.maxContinuousMs = var123
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
		local var108 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
		
		if var108 == nil then
			if enteredAtMs ~= nil then
				local var109 = assert(p63, "image band requires an end timestamp") - enteredAtMs
				band30.cumulativeMs += var109
				
				if band30.maxContinuousMs < var109 then
					band30.maxContinuousMs = var109
				end
				band30.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band30.pendingContinuity then
			band30.cumulativeMs += var108
			
			if band30.maxContinuousMs < var108 then
				band30.maxContinuousMs = var108
			end
			band30.enteredAtMs = nil
			band30.currentContinuousMs = 0
			band30.pendingContinuity = false
		end
		local band50 = self._band50
		enteredAtMs = band50.enteredAtMs
		local var110 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
		
		if var110 == nil then
			if enteredAtMs ~= nil then
				local var111 = assert(p63, "image band requires an end timestamp") - enteredAtMs
				band50.cumulativeMs += var111
				
				if band50.maxContinuousMs < var111 then
					band50.maxContinuousMs = var111
				end
				band50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band50.pendingContinuity then
			band50.cumulativeMs += var110
			
			if band50.maxContinuousMs < var110 then
				band50.maxContinuousMs = var110
			end
			band50.enteredAtMs = nil
			band50.currentContinuousMs = 0
			band50.pendingContinuity = false
		end
		local band100 = self._band100
		local var112 = p63
		enteredAtMs = band100.enteredAtMs
		local var113 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
		
		if var113 == nil then
			if enteredAtMs ~= nil then
				local var114 = assert(var112, "image band requires an end timestamp") - enteredAtMs
				band100.cumulativeMs += var114
				
				if band100.maxContinuousMs < var114 then
					band100.maxContinuousMs = var114
				end
				band100.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band100.pendingContinuity then
			band100.cumulativeMs += var113
			
			if band100.maxContinuousMs < var113 then
				band100.maxContinuousMs = var113
			end
			band100.enteredAtMs = nil
			band100.currentContinuousMs = 0
			band100.pendingContinuity = false
		end
	end
	self._pausedAtMs = p63
end

function t_1:resume(p64)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local var125
	local pausedAtMs = self._pausedAtMs
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		var125 = self._video ~= nil
		var125 = nil
	else
		var125 = nil
	end
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var125 then
		if self._finalized or pausedAtMs == nil then return end
		p64 = math.max(p64, pausedAtMs)
	else
		assert(not self._finalized, "resume called after finalize")
		assert(pausedAtMs ~= nil, "resume called while not paused")
		assert(pausedAtMs <= p64, "resume timestamp precedes pause")
	end
	self._pausedDurationMs += p64 - pausedAtMs
	self._pausedAtMs = nil
	self._lastSampleMs = p64
	self._lastRatio = 0
	self._lastRealEstate = 0
end

function t_1:_advance_deprecated(p65, p66, p67)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), t (ref)
	assert(not self._finalized, "advance called after finalize")
	assert(self._pausedAtMs == nil, "advance called while paused")
	local t_1 = {}
	
	if p67 ~= nil then
		self:_classifyDisplayOnce(p67.adSize)
		self._latchedGeometry = p67
	end
	local enteredAtMs
	self:_accumulate(p65, p66, p67)
	local band30 = self._band30
	
	if band30.threshold > p66 then
		enteredAtMs = band30.enteredAtMs
		local var127 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
		
		if var127 == nil then
			if enteredAtMs ~= nil then
				local var128 = assert(p65, "image band requires an end timestamp") - enteredAtMs
				band30.cumulativeMs += var128
				
				if band30.maxContinuousMs < var128 then
					band30.maxContinuousMs = var128
				end
				band30.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band30.pendingContinuity then
			band30.cumulativeMs += var127
			
			if band30.maxContinuousMs < var127 then
				band30.maxContinuousMs = var127
			end
			band30.enteredAtMs = nil
			band30.currentContinuousMs = 0
			band30.pendingContinuity = false
		end
	elseif band30.enteredAtMs == nil then
		band30.enteredAtMs = p65
	end
	local band50 = self._band50
	
	if band50.threshold > p66 then
		enteredAtMs = band50.enteredAtMs
		local var129 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
		
		if var129 == nil then
			if enteredAtMs ~= nil then
				local var130 = assert(p65, "image band requires an end timestamp") - enteredAtMs
				band50.cumulativeMs += var130
				
				if band50.maxContinuousMs < var130 then
					band50.maxContinuousMs = var130
				end
				band50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band50.pendingContinuity then
			band50.cumulativeMs += var129
			
			if band50.maxContinuousMs < var129 then
				band50.maxContinuousMs = var129
			end
			band50.enteredAtMs = nil
			band50.currentContinuousMs = 0
			band50.pendingContinuity = false
		end
	elseif band50.enteredAtMs == nil then
		band50.enteredAtMs = p65
	end
	local band100 = self._band100
	
	if band100.threshold > p66 then
		enteredAtMs = band100.enteredAtMs
		local var131 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
		
		if var131 == nil then
			if enteredAtMs ~= nil then
				local var132 = assert(p65, "image band requires an end timestamp") - enteredAtMs
				band100.cumulativeMs += var132
				
				if band100.maxContinuousMs < var132 then
					band100.maxContinuousMs = var132
				end
				band100.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band100.pendingContinuity then
			band100.cumulativeMs += var131
			
			if band100.maxContinuousMs < var131 then
				band100.maxContinuousMs = var131
			end
			band100.enteredAtMs = nil
			band100.currentContinuousMs = 0
			band100.pendingContinuity = false
		end
	elseif band100.enteredAtMs == nil then
		band100.enteredAtMs = p65
	end
	if p67 == nil then
		return t_1
	end
	local displayLabel = self._displayLabel
	
	if displayLabel ~= nil then
		self:_tryFire(if displayLabel == t.IabDisplayLarge then self._band30 else self._band50, displayLabel, p65, p67, t_1)
	end
	self:_tryFire(self._band100, t.FullView, p65, p67, t_1)
	
	return t_1
end

function t_1:advance(p68, p69, p70, p71, p72)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), t (ref), var1 (ref)
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled or self._video == nil then
		return self:_advance_deprecated(p68, p69, p70)
	end
	local t_1 = {}
	
	if self._finalized or self._pausedAtMs ~= nil or p68 < (self._lastSampleMs or self.startTimestampMs) then
		return t_1, {}
	elseif p70 ~= nil then
		self._latchedGeometry = p70
	end
	local lastRatio = self._lastRatio
	self:_accumulate(p68, p69, p70)
	local var134, var135, var136 = self:_advanceVideo(p68, lastRatio, p69, p70, p71, p72 == true)
	
	if p70 == nil then
		return t_1, var134
	elseif var135 or var136 then
		self:_tryFire(self._band50, t.IabVideoStandard, p68, p70, t_1, var1)
		self:_tryFire(self._band100, t.FullViewVideo, p68, p70, t_1, 1000)
	end
	if var136 then
		local band30 = self._band30
		local enteredAtMs = band30.enteredAtMs
		local var137 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
		
		if var137 == nil then
			if enteredAtMs ~= nil then
				local var138 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band30.cumulativeMs += var138
				
				if band30.maxContinuousMs < var138 then
					band30.maxContinuousMs = var138
				end
				band30.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band30.pendingContinuity then
			band30.cumulativeMs += var137
			
			if band30.maxContinuousMs < var137 then
				band30.maxContinuousMs = var137
			end
			band30.enteredAtMs = nil
			band30.currentContinuousMs = 0
			band30.pendingContinuity = false
		end
		local band50 = self._band50
		enteredAtMs = band50.enteredAtMs
		local var139 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
		
		if var139 == nil then
			if enteredAtMs ~= nil then
				local var140 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band50.cumulativeMs += var140
				
				if band50.maxContinuousMs < var140 then
					band50.maxContinuousMs = var140
				end
				band50.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band50.pendingContinuity then
			band50.cumulativeMs += var139
			
			if band50.maxContinuousMs < var139 then
				band50.maxContinuousMs = var139
			end
			band50.enteredAtMs = nil
			band50.currentContinuousMs = 0
			band50.pendingContinuity = false
		end
		local band100 = self._band100
		enteredAtMs = band100.enteredAtMs
		local var141 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
		
		if var141 == nil then
			if enteredAtMs ~= nil then
				local var142 = assert(nil, "image band requires an end timestamp") - enteredAtMs
				band100.cumulativeMs += var142
				
				if band100.maxContinuousMs < var142 then
					band100.maxContinuousMs = var142
				end
				band100.enteredAtMs = nil
			end
		elseif enteredAtMs ~= nil or band100.pendingContinuity then
			band100.cumulativeMs += var141
			
			if band100.maxContinuousMs < var141 then
				band100.maxContinuousMs = var141
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
			local var143 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then inGridBand50.currentContinuousMs else nil
			
			if var143 == nil then
				if enteredAtMs_1 ~= nil then
					local var144 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
					inGridBand50.cumulativeMs += var144
					
					if inGridBand50.maxContinuousMs < var144 then
						inGridBand50.maxContinuousMs = var144
					end
					inGridBand50.enteredAtMs = nil
				end
			elseif enteredAtMs_1 ~= nil or inGridBand50.pendingContinuity then
				inGridBand50.cumulativeMs += var143
				
				if inGridBand50.maxContinuousMs < var143 then
					inGridBand50.maxContinuousMs = var143
				end
				inGridBand50.enteredAtMs = nil
				inGridBand50.currentContinuousMs = 0
				inGridBand50.pendingContinuity = false
			end
		end
		if enteredAtMs ~= nil then
			enteredAtMs_1 = enteredAtMs.enteredAtMs
			local var145 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then enteredAtMs.currentContinuousMs else nil
			
			if var145 == nil then
				if enteredAtMs_1 ~= nil then
					local var146 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
					enteredAtMs.cumulativeMs += var146
					
					if enteredAtMs.maxContinuousMs < var146 then
						enteredAtMs.maxContinuousMs = var146
					end
					enteredAtMs.enteredAtMs = nil
				end
			elseif enteredAtMs_1 ~= nil or enteredAtMs.pendingContinuity then
				enteredAtMs.cumulativeMs += var145
				
				if enteredAtMs.maxContinuousMs < var145 then
					enteredAtMs.maxContinuousMs = var145
				end
				enteredAtMs.enteredAtMs = nil
				enteredAtMs.currentContinuousMs = 0
				enteredAtMs.pendingContinuity = false
			end
		end
	end
	return t_1, var134
end

function t_1:_finalize_deprecated(p73)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	assert(not self._finalized, "finalize called more than once on the same session")
	self._finalized = true
	self:_accumulate(p73, self._lastRatio, self._latchedGeometry)
	local band30 = self._band30
	local enteredAtMs = band30.enteredAtMs
	local var147 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
	
	if var147 == nil then
		if enteredAtMs ~= nil then
			local var148 = assert(p73, "image band requires an end timestamp") - enteredAtMs
			band30.cumulativeMs += var148
			
			if band30.maxContinuousMs < var148 then
				band30.maxContinuousMs = var148
			end
			band30.enteredAtMs = nil
		end
	elseif enteredAtMs ~= nil or band30.pendingContinuity then
		band30.cumulativeMs += var147
		
		if band30.maxContinuousMs < var147 then
			band30.maxContinuousMs = var147
		end
		band30.enteredAtMs = nil
		band30.currentContinuousMs = 0
		band30.pendingContinuity = false
	end
	local band50 = self._band50
	enteredAtMs = band50.enteredAtMs
	local var149 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
	
	if var149 == nil then
		if enteredAtMs ~= nil then
			local var150 = assert(p73, "image band requires an end timestamp") - enteredAtMs
			band50.cumulativeMs += var150
			
			if band50.maxContinuousMs < var150 then
				band50.maxContinuousMs = var150
			end
			band50.enteredAtMs = nil
		end
	elseif enteredAtMs ~= nil or band50.pendingContinuity then
		band50.cumulativeMs += var149
		
		if band50.maxContinuousMs < var149 then
			band50.maxContinuousMs = var149
		end
		band50.enteredAtMs = nil
		band50.currentContinuousMs = 0
		band50.pendingContinuity = false
	end
	local band100 = self._band100
	enteredAtMs = band100.enteredAtMs
	local var151 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
	
	if var151 == nil then
		if enteredAtMs ~= nil then
			local var152 = assert(p73, "image band requires an end timestamp") - enteredAtMs
			band100.cumulativeMs += var152
			
			if band100.maxContinuousMs < var152 then
				band100.maxContinuousMs = var152
			end
			band100.enteredAtMs = nil
		end
	elseif enteredAtMs ~= nil or band100.pendingContinuity then
		band100.cumulativeMs += var151
		
		if band100.maxContinuousMs < var151 then
			band100.maxContinuousMs = var151
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
		assert(pausedAtMs <= p73, "session end precedes pause")
		pausedDurationMs += p73 - pausedAtMs
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
		viewabilitySessionEndTimestampMs = p73,
		dwellDurationMs = p73 - self.startTimestampMs - pausedDurationMs,
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

function t_1:finalize(p74)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), copyGeometry (ref)
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled or self._video == nil then
		return self:_finalize_deprecated(p74)
	elseif self._finalized then
		return self._terminalSnapshot
	end
	local video = self._video
	local inGridBand50 = self._inGridBand50
	local fullscreenBand50 = self._fullscreenBand50
	local maxValue = math.max(p74, self.startTimestampMs, self._lastSampleMs or self.startTimestampMs, self._pausedAtMs or self.startTimestampMs)
	
	if video == nil or inGridBand50 == nil or fullscreenBand50 == nil then
		maxValue = self:_finalize_deprecated(maxValue)
		self._terminalSnapshot = maxValue
		
		return maxValue
	end
	self._finalized = true
	self:_accumulate(maxValue, self._lastRatio, self._latchedGeometry)
	local band30 = self._band30
	local enteredAtMs = band30.enteredAtMs
	local var154 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band30.currentContinuousMs else nil
	
	if var154 == nil then
		if enteredAtMs ~= nil then
			local var155 = assert(nil, "image band requires an end timestamp") - enteredAtMs
			band30.cumulativeMs += var155
			
			if band30.maxContinuousMs < var155 then
				band30.maxContinuousMs = var155
			end
			band30.enteredAtMs = nil
		end
	elseif enteredAtMs ~= nil or band30.pendingContinuity then
		band30.cumulativeMs += var154
		
		if band30.maxContinuousMs < var154 then
			band30.maxContinuousMs = var154
		end
		band30.enteredAtMs = nil
		band30.currentContinuousMs = 0
		band30.pendingContinuity = false
	end
	local band50 = self._band50
	enteredAtMs = band50.enteredAtMs
	local var156 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band50.currentContinuousMs else nil
	
	if var156 == nil then
		if enteredAtMs ~= nil then
			local var157 = assert(nil, "image band requires an end timestamp") - enteredAtMs
			band50.cumulativeMs += var157
			
			if band50.maxContinuousMs < var157 then
				band50.maxContinuousMs = var157
			end
			band50.enteredAtMs = nil
		end
	elseif enteredAtMs ~= nil or band50.pendingContinuity then
		band50.cumulativeMs += var156
		
		if band50.maxContinuousMs < var156 then
			band50.maxContinuousMs = var156
		end
		band50.enteredAtMs = nil
		band50.currentContinuousMs = 0
		band50.pendingContinuity = false
	end
	local band100 = self._band100
	enteredAtMs = band100.enteredAtMs
	local var158 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then band100.currentContinuousMs else nil
	
	if var158 == nil then
		if enteredAtMs ~= nil then
			local var159 = assert(nil, "image band requires an end timestamp") - enteredAtMs
			band100.cumulativeMs += var159
			
			if band100.maxContinuousMs < var159 then
				band100.maxContinuousMs = var159
			end
			band100.enteredAtMs = nil
		end
	elseif enteredAtMs ~= nil or band100.pendingContinuity then
		band100.cumulativeMs += var158
		
		if band100.maxContinuousMs < var158 then
			band100.maxContinuousMs = var158
		end
		band100.enteredAtMs = nil
		band100.currentContinuousMs = 0
		band100.pendingContinuity = false
	end
	local enteredAtMs_1 = inGridBand50.enteredAtMs
	enteredAtMs = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then inGridBand50.currentContinuousMs else nil
	
	if enteredAtMs == nil then
		if enteredAtMs_1 ~= nil then
			local var160 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
			inGridBand50.cumulativeMs += var160
			
			if inGridBand50.maxContinuousMs < var160 then
				inGridBand50.maxContinuousMs = var160
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
			local var161 = assert(nil, "image band requires an end timestamp") - enteredAtMs_1
			fullscreenBand50.cumulativeMs += var161
			
			if fullscreenBand50.maxContinuousMs < var161 then
				fullscreenBand50.maxContinuousMs = var161
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