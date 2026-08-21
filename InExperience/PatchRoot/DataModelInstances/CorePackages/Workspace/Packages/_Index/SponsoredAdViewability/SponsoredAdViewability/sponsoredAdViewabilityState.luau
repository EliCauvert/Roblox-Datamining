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

local function newBand(p0, p1) --[[ line: 119 ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	return if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p1 ~= nil then {
		enteredAtMs = nil,
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

local function _(p2, p3) --[[ line: 132 | named "closeWindow" ]]
	local enteredAtMs = p2.enteredAtMs
	
	if enteredAtMs == nil then return end
	local currentContinuousMs = p2.currentContinuousMs
	local var7 = if currentContinuousMs ~= nil then assert(p3, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
	p2.cumulativeMs += var7
	
	if p2.maxContinuousMs < var7 then
		p2.maxContinuousMs = var7
	end
	p2.enteredAtMs = nil
	
	if currentContinuousMs ~= nil then
		p2.currentContinuousMs = 0
	end
end

local _ = function(p4, p5, p6) --[[ line: 153 | named "updateBandTimer" ]]
	if p4.threshold <= p5 then
		if p4.enteredAtMs == nil then
			p4.enteredAtMs = p6
			
			return
		end
	else
		local enteredAtMs = p4.enteredAtMs
		
		if enteredAtMs == nil then return end
		local currentContinuousMs = p4.currentContinuousMs
		local var8 = if currentContinuousMs ~= nil then assert(p6, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
		p4.cumulativeMs += var8
		
		if p4.maxContinuousMs < var8 then
			p4.maxContinuousMs = var8
		end
		p4.enteredAtMs = nil
		
		if currentContinuousMs ~= nil then
			p4.currentContinuousMs = 0
		end
	end
end

local _ = function(p7, p8) --[[ line: 166 | named "durationAsOf" ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local cumulativeMs = p7.cumulativeMs
	local maxContinuousMs = p7.maxContinuousMs
	local enteredAtMs = p7.enteredAtMs
	
	if enteredAtMs ~= nil then
		local currentContinuousMs = p7.currentContinuousMs
		local var9 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and currentContinuousMs ~= nil then currentContinuousMs else assert(p8, "image band requires the current timestamp") - enteredAtMs
		cumulativeMs += var9
		
		if maxContinuousMs < var9 then
			maxContinuousMs = var9
		end
	end
	return cumulativeMs, maxContinuousMs
end

local _ = function(p9) --[[ line: 182 | named "continuousVideoDurationAsOf" ]]
	return if p9.enteredAtMs == nil then 0 else assert(p9.currentContinuousMs, "video band must track continuous playback")
end

local function copyGeometry(p10) --[[ line: 189 ]]
	return {
		adSize = p10.adSize,
		viewportBounds = {
			min = p10.viewportBounds.min,
			max = p10.viewportBounds.max
		}
	}
end

local _ = function(p11, p12) --[[ line: 199 | named "realEstateOf" ]]
	if p12 == nil then
		return 0
	end
	local viewportBounds = p12.viewportBounds
	local var10 = (viewportBounds.max.X - viewportBounds.min.X) * (viewportBounds.max.Y - viewportBounds.min.Y)
	
	return if var10 <= 0 then 0 else p11 * p12.adSize.X * p12.adSize.Y / var10
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p13, p14) --[[ line: 247 ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), newBand (ref), t_1 (ref)
	local var11 = fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p14 == true
	
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
		startTimestampMs = p13,
		_achieved = {},
		_band30 = newBand(0.3, if var11 then 0 else nil),
		_band50 = newBand(0.5, if var11 then 0 else nil),
		_band100 = newBand(1, if var11 then 0 else nil),
		_video = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var11 then {
			highestProgress = nil,
			lengthMs = nil,
			cumulativePlaytimeMs = 0,
			lastSampleMs = nil,
			lastSnapshot = nil
		} else nil
	}, t_1)
end

function t_1:_classifyDisplayOnce(p15) --[[ line: 282 ]]
	-- upvalues: t (ref)
	if self._displayLabel ~= nil then return end
	local var12 = p15.X * p15.Y
	
	if var12 <= 0 then
		return
	end
	self._displayLabel = if var12 > 242500 then t.IabDisplayLarge else t.IabDisplayStandard
end

function t_1:_tryFire(p16, p17, p18, p19, p20, p21) --[[ line: 295 ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), copyGeometry (ref)
	if self._achieved[p17] then return end
	local var14
	local var13 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then self._video else nil
	local _ = false
	
	if var13 == nil then
		local enteredAtMs = p16.enteredAtMs
		var14 = enteredAtMs ~= nil and p18 - enteredAtMs >= 1000
	else
		var14 = (p21 or 1000) <= (if p16.enteredAtMs == nil then 0 else assert(p16.currentContinuousMs, "video band must track continuous playback"))
	end
	if not var14 then return end
	self._achieved[p17] = true
	local band30 = self._band30
	local cumulativeMs = band30.cumulativeMs
	local maxContinuousMs = band30.maxContinuousMs
	local enteredAtMs = band30.enteredAtMs
	
	if enteredAtMs ~= nil then
		local currentContinuousMs = band30.currentContinuousMs
		local var15 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and currentContinuousMs ~= nil then currentContinuousMs else assert(p18, "image band requires the current timestamp") - enteredAtMs
		cumulativeMs += var15
		
		if maxContinuousMs < var15 then
			maxContinuousMs = var15
		end
	end
	local band50 = self._band50
	local cumulativeMs_1 = band50.cumulativeMs
	local maxContinuousMs_1 = band50.maxContinuousMs
	local enteredAtMs_1 = band50.enteredAtMs
	
	if enteredAtMs_1 ~= nil then
		local currentContinuousMs = band50.currentContinuousMs
		local var16 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and currentContinuousMs ~= nil then currentContinuousMs else assert(p18, "image band requires the current timestamp") - enteredAtMs_1
		cumulativeMs_1 += var16
		
		if maxContinuousMs_1 < var16 then
			maxContinuousMs_1 = var16
		end
	end
	local band100 = self._band100
	local cumulativeMs_2 = band100.cumulativeMs
	local maxContinuousMs_2 = band100.maxContinuousMs
	local enteredAtMs_2 = band100.enteredAtMs
	
	if enteredAtMs_2 ~= nil then
		local currentContinuousMs = band100.currentContinuousMs
		local var17 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and currentContinuousMs ~= nil then currentContinuousMs else assert(p18, "image band requires the current timestamp") - enteredAtMs_2
		cumulativeMs_2 += var17
		
		if maxContinuousMs_2 < var17 then
			maxContinuousMs_2 = var17
		end
	end
	table.insert(p20, {
		milestoneLabel = p17,
		geometry = copyGeometry(p19),
		viewabilitySessionStartTimestampMs = self.startTimestampMs,
		cumulative30PercentInViewDurationMs = cumulativeMs,
		cumulative50PercentInViewDurationMs = cumulativeMs_1,
		cumulative100PercentInViewDurationMs = cumulativeMs_2,
		maxContinuous30PercentInViewDurationMs = maxContinuousMs,
		maxContinuous50PercentInViewDurationMs = maxContinuousMs_1,
		maxContinuous100PercentInViewDurationMs = maxContinuousMs_2,
		videoLengthMs = if var13 ~= nil then nil else var13.lengthMs,
		cumulativeInGridViewDurationMs = if var13 ~= nil then nil else cumulativeMs_1
	})
end

function t_1:_accumulate(p22, p23, p24) --[[ line: 343 ]]
	local lastSampleMs = self._lastSampleMs
	
	if lastSampleMs ~= nil and self._lastRatio > 0 then
		local var18 = p22 - lastSampleMs
		
		if var18 > 0 then
			self._percentWeightedSum += self._lastRatio * var18
			self._realEstateWeightedSum += self._lastRealEstate * var18
			self._visibleWeightedMs += var18
		end
	end
	local var19
	self._lastSampleMs = p22
	self._lastRatio = p23
	
	if p24 == nil then
		var19 = 0
	else
		local viewportBounds = p24.viewportBounds
		local var20 = (viewportBounds.max.X - viewportBounds.min.X) * (viewportBounds.max.Y - viewportBounds.min.Y)
		var19 = if var20 <= 0 then 0 else p23 * p24.adSize.X * p24.adSize.Y / var20
	end
	self._lastRealEstate = var19
	
	if p23 > 0 then
		if self._minPercentSeen == nil or p23 < self._minPercentSeen then
			self._minPercentSeen = p23
		end
		if self._maxPercentSeen == nil or self._maxPercentSeen < p23 then
			self._maxPercentSeen = p23
		end
	end
end

local _ = function(p25, p26, p27, p28, p29, p30) --[[ line: 373 | named "updateVideoBand" ]]
	if p26 and p25.threshold <= p28 then
		if p27 < p25.threshold then
			local enteredAtMs = p25.enteredAtMs
			
			if enteredAtMs ~= nil then
				local currentContinuousMs = p25.currentContinuousMs
				local var21 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
				p25.cumulativeMs += var21
				
				if p25.maxContinuousMs < var21 then
					p25.maxContinuousMs = var21
				end
				p25.enteredAtMs = nil
				
				if currentContinuousMs ~= nil then
					p25.currentContinuousMs = 0
				end
			end
			p25.enteredAtMs = p30
			
			return
		elseif p25.enteredAtMs == nil then
			p25.enteredAtMs = p30
		end
		p25.currentContinuousMs = assert(p25.currentContinuousMs, "video band must track continuous playback") + p29
		
		return
	else
		local enteredAtMs = p25.enteredAtMs
		
		if enteredAtMs == nil then return end
		local currentContinuousMs = p25.currentContinuousMs
		local var22 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
		p25.cumulativeMs += var22
		
		if p25.maxContinuousMs < var22 then
			p25.maxContinuousMs = var22
		end
		p25.enteredAtMs = nil
		
		if currentContinuousMs ~= nil then
			p25.currentContinuousMs = 0
		end
	end
end

local _ = function(p31, p32, p33, p34, p35) --[[ line: 399 | named "observedVideoMovementMs" ]]
	if p31 == nil or p32 == nil or (p33 == nil or p34 == nil) then
		return 0
	elseif p34 < p33 then
		return 0
	end
	local var23 = p34 - p33
	
	return if var23 == 0 then math.max(0, p32 - p31) elseif p35 == nil or p35 <= 0 then 0 else math.max(0, var23 * p35 + p32 - p31)
end

function t_1:_buildVideoProgressMilestone(p36, _, p37) --[[ line: 430 ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), copyGeometry (ref)
	local var24 = assert(self._video, "video progress requires video state")
	local band30 = self._band30
	local cumulativeMs = band30.cumulativeMs
	local maxContinuousMs = band30.maxContinuousMs
	local enteredAtMs = band30.enteredAtMs
	
	if enteredAtMs ~= nil then
		local currentContinuousMs = band30.currentContinuousMs
		local var25 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and currentContinuousMs ~= nil then currentContinuousMs else assert(nil, "image band requires the current timestamp") - enteredAtMs
		cumulativeMs += var25
		
		if maxContinuousMs < var25 then
			maxContinuousMs = var25
		end
	end
	local band50 = self._band50
	local cumulativeMs_1 = band50.cumulativeMs
	local maxContinuousMs_1 = band50.maxContinuousMs
	local enteredAtMs_1 = band50.enteredAtMs
	
	if enteredAtMs_1 ~= nil then
		local currentContinuousMs = band50.currentContinuousMs
		local var26 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and currentContinuousMs ~= nil then currentContinuousMs else assert(nil, "image band requires the current timestamp") - enteredAtMs_1
		cumulativeMs_1 += var26
		
		if maxContinuousMs_1 < var26 then
			maxContinuousMs_1 = var26
		end
	end
	local band100 = self._band100
	local cumulativeMs_2 = band100.cumulativeMs
	local maxContinuousMs_2 = band100.maxContinuousMs
	local enteredAtMs_2 = band100.enteredAtMs
	
	if enteredAtMs_2 ~= nil then
		local currentContinuousMs = band100.currentContinuousMs
		local var27 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and currentContinuousMs ~= nil then currentContinuousMs else assert(nil, "image band requires the current timestamp") - enteredAtMs_2
		cumulativeMs_2 += var27
		
		if maxContinuousMs_2 < var27 then
			maxContinuousMs_2 = var27
		end
	end
	return {
		geometry = copyGeometry(p37),
		viewabilitySessionStartTimestampMs = self.startTimestampMs,
		cumulative30PercentInViewDurationMs = cumulativeMs,
		cumulative50PercentInViewDurationMs = cumulativeMs_1,
		cumulative100PercentInViewDurationMs = cumulativeMs_2,
		maxContinuous30PercentInViewDurationMs = maxContinuousMs,
		maxContinuous50PercentInViewDurationMs = maxContinuousMs_1,
		maxContinuous100PercentInViewDurationMs = maxContinuousMs_2,
		videoProgress = p36,
		videoLengthMs = var24.lengthMs,
		videoCumulativePlaytimeMs = var24.cumulativePlaytimeMs,
		cumulativeInGridViewDurationMs = cumulativeMs_1
	}
end

function t_1:_advanceVideo(p38, p39, p40, p41, p42) --[[ line: 457 ]]
	-- upvalues: var2 (ref)
	local var28 = assert(self._video, "video advance requires video state")
	local t = {}
	local lastSampleMs = var28.lastSampleMs
	local lastSnapshot = var28.lastSnapshot
	
	if p42 ~= nil and (p42.playbackPositionMs < 0 or p42.loopCount < 0 or p42.videoLengthMs ~= nil and p42.videoLengthMs <= 0) then
		p42 = nil
	end
	if p42 == nil then
		local band30 = self._band30
		local enteredAtMs = band30.enteredAtMs
		
		if enteredAtMs ~= nil then
			local currentContinuousMs = band30.currentContinuousMs
			local var30 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
			band30.cumulativeMs += var30
			
			if band30.maxContinuousMs < var30 then
				band30.maxContinuousMs = var30
			end
			band30.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band30.currentContinuousMs = 0
			end
		end
		local band50 = self._band50
		local enteredAtMs_1 = band50.enteredAtMs
		
		if enteredAtMs_1 ~= nil then
			local currentContinuousMs = band50.currentContinuousMs
			local var31 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs_1 else currentContinuousMs
			band50.cumulativeMs += var31
			
			if band50.maxContinuousMs < var31 then
				band50.maxContinuousMs = var31
			end
			band50.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band50.currentContinuousMs = 0
			end
		end
		local band100 = self._band100
		local enteredAtMs_2 = band100.enteredAtMs
		
		if enteredAtMs_2 ~= nil then
			local currentContinuousMs = band100.currentContinuousMs
			local var32 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs_2 else currentContinuousMs
			band100.cumulativeMs += var32
			
			if band100.maxContinuousMs < var32 then
				band100.maxContinuousMs = var32
			end
			band100.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band100.currentContinuousMs = 0
			end
		end
		var28.lastSampleMs = p38
		var28.lastSnapshot = nil
		
		return t, false
	elseif p42.videoLengthMs ~= nil then
		var28.lengthMs = p42.videoLengthMs
	end
	local var35
	local playbackPositionMs = p42.playbackPositionMs
	local loopCount = p42.loopCount
	local var33 = if lastSnapshot then lastSnapshot.playbackPositionMs else nil
	local var34 = if lastSnapshot then lastSnapshot.loopCount else nil
	local lengthMs = var28.lengthMs
	
	if var33 == nil or playbackPositionMs == nil or (var34 == nil or loopCount == nil) then
		var35 = 0
	elseif loopCount < var34 then
		var35 = 0
	else
		local var36 = loopCount - var34
		var35 = if var36 == 0 then math.max(0, playbackPositionMs - var33) elseif lengthMs == nil or lengthMs <= 0 then 0 else math.max(0, var36 * lengthMs + playbackPositionMs - var33)
	end
	var33 = lastSnapshot ~= nil and lastSnapshot.loopCount < loopCount
	var34 = lastSnapshot ~= nil and lastSnapshot.isPlaying
	local var37 = var34 and (p42.isPlaying and var35 > 0)
	local var38 = 0
	
	if lastSampleMs ~= nil then
		assert(lastSampleMs <= p38, "video sample timestamp must not decrease")
		var38 = p38 - lastSampleMs
	end
	local var39 = if var37 then math.min(var38, var35) else 0
	local band30 = self._band30
	
	if not var37 or band30.threshold > p40 then
		local enteredAtMs = band30.enteredAtMs
		
		if enteredAtMs ~= nil then
			local currentContinuousMs = band30.currentContinuousMs
			local var40 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
			band30.cumulativeMs += var40
			
			if band30.maxContinuousMs < var40 then
				band30.maxContinuousMs = var40
			end
			band30.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band30.currentContinuousMs = 0
			end
		end
	elseif p39 < band30.threshold then
		local enteredAtMs = band30.enteredAtMs
		
		if enteredAtMs ~= nil then
			local currentContinuousMs = band30.currentContinuousMs
			local var41 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
			band30.cumulativeMs += var41
			
			if band30.maxContinuousMs < var41 then
				band30.maxContinuousMs = var41
			end
			band30.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band30.currentContinuousMs = 0
			end
		end
		band30.enteredAtMs = p38
	elseif band30.enteredAtMs == nil then
		band30.enteredAtMs = p38
	end
	band30.currentContinuousMs = assert(band30.currentContinuousMs, "video band must track continuous playback") + var39
	local band50 = self._band50
	
	if not var37 or band50.threshold > p40 then
		local enteredAtMs = band50.enteredAtMs
		
		if enteredAtMs ~= nil then
			local currentContinuousMs = band50.currentContinuousMs
			local var42 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
			band50.cumulativeMs += var42
			
			if band50.maxContinuousMs < var42 then
				band50.maxContinuousMs = var42
			end
			band50.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band50.currentContinuousMs = 0
			end
		end
	elseif p39 < band50.threshold then
		local enteredAtMs = band50.enteredAtMs
		
		if enteredAtMs ~= nil then
			local currentContinuousMs = band50.currentContinuousMs
			local var43 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
			band50.cumulativeMs += var43
			
			if band50.maxContinuousMs < var43 then
				band50.maxContinuousMs = var43
			end
			band50.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band50.currentContinuousMs = 0
			end
		end
		band50.enteredAtMs = p38
	elseif band50.enteredAtMs == nil then
		band50.enteredAtMs = p38
	end
	band50.currentContinuousMs = assert(band50.currentContinuousMs, "video band must track continuous playback") + var39
	local band100 = self._band100
	
	if not var37 or band100.threshold > p40 then
		local enteredAtMs = band100.enteredAtMs
		
		if enteredAtMs ~= nil then
			local currentContinuousMs = band100.currentContinuousMs
			local var44 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
			band100.cumulativeMs += var44
			
			if band100.maxContinuousMs < var44 then
				band100.maxContinuousMs = var44
			end
			band100.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band100.currentContinuousMs = 0
			end
		end
	elseif p39 < band100.threshold then
		local enteredAtMs = band100.enteredAtMs
		
		if enteredAtMs ~= nil then
			local currentContinuousMs = band100.currentContinuousMs
			local var45 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
			band100.cumulativeMs += var45
			
			if band100.maxContinuousMs < var45 then
				band100.maxContinuousMs = var45
			end
			band100.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band100.currentContinuousMs = 0
			end
		end
		band100.enteredAtMs = p38
	elseif band100.enteredAtMs == nil then
		band100.enteredAtMs = p38
	end
	band100.currentContinuousMs = assert(band100.currentContinuousMs, "video band must track continuous playback") + var39
	if var37 then
		var28.cumulativePlaytimeMs += var39
	end
	if var37 and p41 ~= nil then
		local var46 = 0
		
		if var33 then
			var46 = 100
		elseif var28.lengthMs ~= nil and var28.lengthMs > 0 then
			var46 = math.clamp(playbackPositionMs / var28.lengthMs * 100, 0, 100)
		end
		for i, v in var2 do
			if (var28.highestProgress == nil or var28.highestProgress < v) and v <= var46 then
				var28.highestProgress = v
				table.insert(t, self:_buildVideoProgressMilestone(v, p38, p41))
			end
		end
	end
	var28.lastSampleMs = p38
	var28.lastSnapshot = p42
	
	return t, var37
end

function t_1:transitionVideoSource(p43) --[[ line: 543 ]]
	assert(not self._finalized, "video source transition called after finalize")
	assert(self._pausedAtMs == nil, "video source transition called while paused")
	local var47 = assert(self._video, "video source transition requires video state")
	assert((var47.lastSampleMs or self.startTimestampMs) <= p43, "video source transition precedes last sample")
	local band30 = self._band30
	local enteredAtMs = band30.enteredAtMs
	
	if enteredAtMs ~= nil then
		local currentContinuousMs = band30.currentContinuousMs
		local var48 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
		band30.cumulativeMs += var48
		
		if band30.maxContinuousMs < var48 then
			band30.maxContinuousMs = var48
		end
		band30.enteredAtMs = nil
		
		if currentContinuousMs ~= nil then
			band30.currentContinuousMs = 0
		end
	end
	local band50 = self._band50
	local enteredAtMs_1 = band50.enteredAtMs
	
	if enteredAtMs_1 ~= nil then
		local currentContinuousMs = band50.currentContinuousMs
		local var49 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs_1 else currentContinuousMs
		band50.cumulativeMs += var49
		
		if band50.maxContinuousMs < var49 then
			band50.maxContinuousMs = var49
		end
		band50.enteredAtMs = nil
		
		if currentContinuousMs ~= nil then
			band50.currentContinuousMs = 0
		end
	end
	local band100 = self._band100
	local enteredAtMs_2 = band100.enteredAtMs
	
	if enteredAtMs_2 ~= nil then
		local currentContinuousMs = band100.currentContinuousMs
		local var50 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs_2 else currentContinuousMs
		band100.cumulativeMs += var50
		
		if band100.maxContinuousMs < var50 then
			band100.maxContinuousMs = var50
		end
		band100.enteredAtMs = nil
		
		if currentContinuousMs ~= nil then
			band100.currentContinuousMs = 0
		end
	end
	var47.lastSampleMs = nil
	var47.lastSnapshot = nil
	self._lastSampleMs = p43
	self._lastRatio = 0
	self._lastRealEstate = 0
end

function t_1:pause(p44) --[[ line: 560 ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	assert(not self._finalized, "pause called after finalize")
	assert(self._pausedAtMs == nil, "pause called while already paused")
	assert((self._lastSampleMs or self.startTimestampMs) <= p44, "pause timestamp precedes the last sample")
	self:_accumulate(p44, 0, nil)
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and self._video ~= nil then
		local video = self._video
		local band30 = self._band30
		local enteredAtMs = band30.enteredAtMs
		
		if enteredAtMs ~= nil then
			local currentContinuousMs = band30.currentContinuousMs
			local var54 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
			band30.cumulativeMs += var54
			
			if band30.maxContinuousMs < var54 then
				band30.maxContinuousMs = var54
			end
			band30.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band30.currentContinuousMs = 0
			end
		end
		local band50 = self._band50
		local enteredAtMs_1 = band50.enteredAtMs
		
		if enteredAtMs_1 ~= nil then
			local currentContinuousMs = band50.currentContinuousMs
			local var55 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs_1 else currentContinuousMs
			band50.cumulativeMs += var55
			
			if band50.maxContinuousMs < var55 then
				band50.maxContinuousMs = var55
			end
			band50.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band50.currentContinuousMs = 0
			end
		end
		local band100 = self._band100
		local enteredAtMs_2 = band100.enteredAtMs
		
		if enteredAtMs_2 ~= nil then
			local currentContinuousMs = band100.currentContinuousMs
			local var56 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs_2 else currentContinuousMs
			band100.cumulativeMs += var56
			
			if band100.maxContinuousMs < var56 then
				band100.maxContinuousMs = var56
			end
			band100.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band100.currentContinuousMs = 0
			end
		end
		video.lastSampleMs = nil
		video.lastSnapshot = nil
	else
		local band30 = self._band30
		local enteredAtMs = band30.enteredAtMs
		
		if enteredAtMs ~= nil then
			local currentContinuousMs = band30.currentContinuousMs
			local var51 = if currentContinuousMs ~= nil then assert(p44, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
			band30.cumulativeMs += var51
			
			if band30.maxContinuousMs < var51 then
				band30.maxContinuousMs = var51
			end
			band30.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band30.currentContinuousMs = 0
			end
		end
		local band50 = self._band50
		local enteredAtMs_1 = band50.enteredAtMs
		
		if enteredAtMs_1 ~= nil then
			local currentContinuousMs = band50.currentContinuousMs
			local var52 = if currentContinuousMs ~= nil then assert(p44, "image band requires an end timestamp") - enteredAtMs_1 else currentContinuousMs
			band50.cumulativeMs += var52
			
			if band50.maxContinuousMs < var52 then
				band50.maxContinuousMs = var52
			end
			band50.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band50.currentContinuousMs = 0
			end
		end
		local band100 = self._band100
		local enteredAtMs_2 = band100.enteredAtMs
		
		if enteredAtMs_2 ~= nil then
			local currentContinuousMs = band100.currentContinuousMs
			local var53 = if currentContinuousMs ~= nil then assert(p44, "image band requires an end timestamp") - enteredAtMs_2 else currentContinuousMs
			band100.cumulativeMs += var53
			
			if band100.maxContinuousMs < var53 then
				band100.maxContinuousMs = var53
			end
			band100.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band100.currentContinuousMs = 0
			end
		end
	end
	self._pausedAtMs = p44
end

function t_1:resume(p45) --[[ line: 581 ]]
	assert(not self._finalized, "resume called after finalize")
	local pausedAtMs = self._pausedAtMs
	assert(pausedAtMs ~= nil, "resume called while not paused")
	assert(pausedAtMs <= p45, "resume timestamp precedes pause")
	self._pausedDurationMs += p45 - pausedAtMs
	self._pausedAtMs = nil
	self._lastSampleMs = p45
	self._lastRatio = 0
	self._lastRealEstate = 0
end

function t_1:_advance_deprecated(p46, p47, p48) --[[ line: 596 ]]
	-- upvalues: t (ref)
	assert(not self._finalized, "advance called after finalize")
	assert(self._pausedAtMs == nil, "advance called while paused")
	local t_1 = {}
	
	if p48 ~= nil then
		self:_classifyDisplayOnce(p48.adSize)
		self._latchedGeometry = p48
	end
	self:_accumulate(p46, p47, p48)
	local band30 = self._band30
	
	if band30.threshold > p47 then
		local enteredAtMs = band30.enteredAtMs
		
		if enteredAtMs ~= nil then
			local currentContinuousMs = band30.currentContinuousMs
			local var58 = if currentContinuousMs ~= nil then assert(p46, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
			band30.cumulativeMs += var58
			
			if band30.maxContinuousMs < var58 then
				band30.maxContinuousMs = var58
			end
			band30.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band30.currentContinuousMs = 0
			end
		end
	elseif band30.enteredAtMs == nil then
		band30.enteredAtMs = p46
	end
	local band50 = self._band50
	
	if band50.threshold > p47 then
		local enteredAtMs = band50.enteredAtMs
		
		if enteredAtMs ~= nil then
			local currentContinuousMs = band50.currentContinuousMs
			local var59 = if currentContinuousMs ~= nil then assert(p46, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
			band50.cumulativeMs += var59
			
			if band50.maxContinuousMs < var59 then
				band50.maxContinuousMs = var59
			end
			band50.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band50.currentContinuousMs = 0
			end
		end
	elseif band50.enteredAtMs == nil then
		band50.enteredAtMs = p46
	end
	local band100 = self._band100
	
	if band100.threshold > p47 then
		local enteredAtMs = band100.enteredAtMs
		
		if enteredAtMs ~= nil then
			local currentContinuousMs = band100.currentContinuousMs
			local var60 = if currentContinuousMs ~= nil then assert(p46, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
			band100.cumulativeMs += var60
			
			if band100.maxContinuousMs < var60 then
				band100.maxContinuousMs = var60
			end
			band100.enteredAtMs = nil
			
			if currentContinuousMs ~= nil then
				band100.currentContinuousMs = 0
			end
		end
	elseif band100.enteredAtMs == nil then
		band100.enteredAtMs = p46
	end
	if p48 == nil then
		return t_1
	end
	local displayLabel = self._displayLabel
	
	if displayLabel ~= nil then
		self:_tryFire(if displayLabel == t.IabDisplayLarge then self._band30 else self._band50, displayLabel, p46, p48, t_1)
	end
	self:_tryFire(self._band100, t.FullView, p46, p48, t_1)
	
	return t_1
end

function t_1:advance(p49, p50, p51, p52) --[[ line: 631 ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), t (ref), var1 (ref)
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled or self._video == nil then
		return self:_advance_deprecated(p49, p50, p51)
	end
	assert(not self._finalized, "advance called after finalize")
	assert(self._pausedAtMs == nil, "advance called while paused")
	local t_1 = {}
	
	if p51 ~= nil then
		self._latchedGeometry = p51
	end
	local lastRatio = self._lastRatio
	self:_accumulate(p49, p50, p51)
	local var62, var63 = self:_advanceVideo(p49, lastRatio, p50, p51, p52)
	
	if p51 == nil then
		return t_1, var62
	elseif var63 then
		self:_tryFire(self._band50, t.IabVideoStandard, p49, p51, t_1, var1)
		self:_tryFire(self._band100, t.FullViewVideo, p49, p51, t_1)
	end
	return t_1, var62
end

function t_1:_finalize_deprecated(p53) --[[ line: 676 ]]
	assert(not self._finalized, "finalize called more than once on the same session")
	self._finalized = true
	self:_accumulate(p53, self._lastRatio, self._latchedGeometry)
	local band30 = self._band30
	local enteredAtMs = band30.enteredAtMs
	
	if enteredAtMs ~= nil then
		local currentContinuousMs = band30.currentContinuousMs
		local var64 = if currentContinuousMs ~= nil then assert(p53, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
		band30.cumulativeMs += var64
		
		if band30.maxContinuousMs < var64 then
			band30.maxContinuousMs = var64
		end
		band30.enteredAtMs = nil
		
		if currentContinuousMs ~= nil then
			band30.currentContinuousMs = 0
		end
	end
	local band50 = self._band50
	local enteredAtMs_1 = band50.enteredAtMs
	
	if enteredAtMs_1 ~= nil then
		local currentContinuousMs = band50.currentContinuousMs
		local var65 = if currentContinuousMs ~= nil then assert(p53, "image band requires an end timestamp") - enteredAtMs_1 else currentContinuousMs
		band50.cumulativeMs += var65
		
		if band50.maxContinuousMs < var65 then
			band50.maxContinuousMs = var65
		end
		band50.enteredAtMs = nil
		
		if currentContinuousMs ~= nil then
			band50.currentContinuousMs = 0
		end
	end
	local band100 = self._band100
	local enteredAtMs_2 = band100.enteredAtMs
	
	if enteredAtMs_2 ~= nil then
		local currentContinuousMs = band100.currentContinuousMs
		local var66 = if currentContinuousMs ~= nil then assert(p53, "image band requires an end timestamp") - enteredAtMs_2 else currentContinuousMs
		band100.cumulativeMs += var66
		
		if band100.maxContinuousMs < var66 then
			band100.maxContinuousMs = var66
		end
		band100.enteredAtMs = nil
		
		if currentContinuousMs ~= nil then
			band100.currentContinuousMs = 0
		end
	end
	local visibleWeightedMs = self._visibleWeightedMs
	local latchedGeometry = self._latchedGeometry
	local pausedDurationMs = self._pausedDurationMs
	local pausedAtMs = self._pausedAtMs
	
	if pausedAtMs ~= nil then
		assert(pausedAtMs <= p53, "session end precedes pause")
		pausedDurationMs += p53 - pausedAtMs
	end
	return {
		geometry = if latchedGeometry ~= nil then {
			adSize = Vector2.zero,
			viewportBounds = { min = Vector2.zero, max = Vector2.zero }
		} else {
			adSize = latchedGeometry.adSize,
			viewportBounds = {
				min = latchedGeometry.viewportBounds.min,
				max = latchedGeometry.viewportBounds.max
			}
		},
		viewabilitySessionStartTimestampMs = self.startTimestampMs,
		viewabilitySessionEndTimestampMs = p53,
		dwellDurationMs = p53 - self.startTimestampMs - pausedDurationMs,
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

function t_1:finalize(p54) --[[ line: 724 ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), copyGeometry (ref)
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled or self._video == nil then
		return self:_finalize_deprecated(p54)
	end
	assert(not self._finalized, "finalize called more than once on the same session")
	self._finalized = true
	self:_accumulate(p54, self._lastRatio, self._latchedGeometry)
	local var67 = assert(self._video, "video finalize requires video state")
	local band30 = self._band30
	local enteredAtMs = band30.enteredAtMs
	
	if enteredAtMs ~= nil then
		local currentContinuousMs = band30.currentContinuousMs
		local var68 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs else currentContinuousMs
		band30.cumulativeMs += var68
		
		if band30.maxContinuousMs < var68 then
			band30.maxContinuousMs = var68
		end
		band30.enteredAtMs = nil
		
		if currentContinuousMs ~= nil then
			band30.currentContinuousMs = 0
		end
	end
	local band50 = self._band50
	local enteredAtMs_1 = band50.enteredAtMs
	
	if enteredAtMs_1 ~= nil then
		local currentContinuousMs = band50.currentContinuousMs
		local var69 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs_1 else currentContinuousMs
		band50.cumulativeMs += var69
		
		if band50.maxContinuousMs < var69 then
			band50.maxContinuousMs = var69
		end
		band50.enteredAtMs = nil
		
		if currentContinuousMs ~= nil then
			band50.currentContinuousMs = 0
		end
	end
	local band100 = self._band100
	local enteredAtMs_2 = band100.enteredAtMs
	
	if enteredAtMs_2 ~= nil then
		local currentContinuousMs = band100.currentContinuousMs
		local var70 = if currentContinuousMs ~= nil then assert(nil, "image band requires an end timestamp") - enteredAtMs_2 else currentContinuousMs
		band100.cumulativeMs += var70
		
		if band100.maxContinuousMs < var70 then
			band100.maxContinuousMs = var70
		end
		band100.enteredAtMs = nil
		
		if currentContinuousMs ~= nil then
			band100.currentContinuousMs = 0
		end
	end
	local visibleWeightedMs = self._visibleWeightedMs
	local latchedGeometry = self._latchedGeometry
	local pausedDurationMs = self._pausedDurationMs
	local pausedAtMs = self._pausedAtMs
	
	if pausedAtMs ~= nil then
		assert(pausedAtMs <= p54, "session end precedes pause")
		pausedDurationMs += p54 - pausedAtMs
	end
	return {
		geometry = if latchedGeometry ~= nil then {
			adSize = Vector2.zero,
			viewportBounds = { min = Vector2.zero, max = Vector2.zero }
		} else copyGeometry(latchedGeometry),
		viewabilitySessionStartTimestampMs = self.startTimestampMs,
		viewabilitySessionEndTimestampMs = p54,
		dwellDurationMs = p54 - self.startTimestampMs - pausedDurationMs,
		cumulative30PercentInViewDurationMs = self._band30.cumulativeMs,
		cumulative50PercentInViewDurationMs = self._band50.cumulativeMs,
		cumulative100PercentInViewDurationMs = self._band100.cumulativeMs,
		maxContinuous30PercentInViewDurationMs = self._band30.maxContinuousMs,
		maxContinuous50PercentInViewDurationMs = self._band50.maxContinuousMs,
		maxContinuous100PercentInViewDurationMs = self._band100.maxContinuousMs,
		averagePercentSeen = if visibleWeightedMs > 0 then self._percentWeightedSum / visibleWeightedMs else 0,
		minPercentSeen = self._minPercentSeen or 0,
		maxPercentSeen = self._maxPercentSeen or 0,
		averageOnScreenRealEstate = if visibleWeightedMs > 0 then self._realEstateWeightedSum / visibleWeightedMs else 0,
		videoProgress = var67.highestProgress,
		videoLengthMs = var67.lengthMs,
		videoCumulativePlaytimeMs = var67.cumulativePlaytimeMs,
		cumulativeInGridViewDurationMs = self._band50.cumulativeMs
	}
end

t_1.MilestoneLabels = t
t_1.MilestoneDurationMs = 1000

return t_1