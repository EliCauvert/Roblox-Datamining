local _ = require(script.Parent.calculateIntersectionRatio)
local t = {
	IabDisplayStandard = "IabDisplayStandard",
	IabDisplayLarge = "IabDisplayLarge",
	FullView = "FullView"
}

local function _(p0) --[[ line: 71 | named "newBand" ]]
	return {
		enteredAtMs = nil,
		cumulativeMs = 0,
		maxContinuousMs = 0,
		threshold = p0
	}
end

local _ = function(p1, p2) --[[ line: 75 | named "closeWindow" ]]
	local enteredAtMs = p1.enteredAtMs
	
	if enteredAtMs == nil then return end
	local var2 = p2 - enteredAtMs
	p1.cumulativeMs += var2
	
	if p1.maxContinuousMs < var2 then
		p1.maxContinuousMs = var2
	end
	p1.enteredAtMs = nil
end

local _ = function(p3, p4, p5) --[[ line: 89 | named "updateBandTimer" ]]
	if p3.threshold <= p4 then
		if p3.enteredAtMs == nil then
			p3.enteredAtMs = p5
			
			return
		end
	else
		local enteredAtMs = p3.enteredAtMs
		
		if enteredAtMs == nil then return end
		local var3 = p5 - enteredAtMs
		p3.cumulativeMs += var3
		
		if p3.maxContinuousMs < var3 then
			p3.maxContinuousMs = var3
		end
		p3.enteredAtMs = nil
	end
end

local _ = function(p6, p7) --[[ line: 102 | named "durationAsOf" ]]
	local cumulativeMs = p6.cumulativeMs
	local maxContinuousMs = p6.maxContinuousMs
	local enteredAtMs = p6.enteredAtMs
	
	if enteredAtMs ~= nil then
		local var4 = p7 - enteredAtMs
		cumulativeMs += var4
		
		if maxContinuousMs < var4 then
			maxContinuousMs = var4
		end
	end
	return cumulativeMs, maxContinuousMs
end

local _ = function(p8, p9) --[[ line: 115 | named "realEstateOf" ]]
	if p9 == nil then
		return 0
	end
	local viewportBounds = p9.viewportBounds
	local var5 = (viewportBounds.max.X - viewportBounds.min.X) * (viewportBounds.max.Y - viewportBounds.min.Y)
	
	return if var5 <= 0 then 0 else p8 * p9.adSize.X * p9.adSize.Y / var5
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p10) --[[ line: 161 ]]
	-- upvalues: t_1 (ref)
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
		startTimestampMs = p10,
		_achieved = {},
		_band30 = {
			threshold = 0.3,
			enteredAtMs = nil,
			cumulativeMs = 0,
			maxContinuousMs = 0
		},
		_band50 = {
			threshold = 0.5,
			enteredAtMs = nil,
			cumulativeMs = 0,
			maxContinuousMs = 0
		},
		_band100 = {
			threshold = 1,
			enteredAtMs = nil,
			cumulativeMs = 0,
			maxContinuousMs = 0
		}
	}, t_1)
end

function t_1:_classifyDisplayOnce(p11) --[[ line: 186 ]]
	-- upvalues: t (ref)
	if self._displayLabel ~= nil then return end
	local var6 = p11.X * p11.Y
	
	if var6 <= 0 then
		return
	end
	self._displayLabel = if var6 > 242500 then t.IabDisplayLarge else t.IabDisplayStandard
end

function t_1:_tryFire(p12, p13, p14, p15, p16) --[[ line: 199 ]]
	if self._achieved[p13] then return end
	local enteredAtMs = p12.enteredAtMs
	
	if enteredAtMs == nil then return end
	if p14 - enteredAtMs < 1000 then return end
	self._achieved[p13] = true
	local band30 = self._band30
	local cumulativeMs = band30.cumulativeMs
	local maxContinuousMs = band30.maxContinuousMs
	local enteredAtMs_1 = band30.enteredAtMs
	
	if enteredAtMs_1 ~= nil then
		local var7 = p14 - enteredAtMs_1
		cumulativeMs += var7
		
		if maxContinuousMs < var7 then
			maxContinuousMs = var7
		end
	end
	local band50 = self._band50
	local cumulativeMs_1 = band50.cumulativeMs
	local maxContinuousMs_1 = band50.maxContinuousMs
	local enteredAtMs_2 = band50.enteredAtMs
	
	if enteredAtMs_2 ~= nil then
		local var8 = p14 - enteredAtMs_2
		cumulativeMs_1 += var8
		
		if maxContinuousMs_1 < var8 then
			maxContinuousMs_1 = var8
		end
	end
	local band100 = self._band100
	local cumulativeMs_2 = band100.cumulativeMs
	local maxContinuousMs_2 = band100.maxContinuousMs
	local enteredAtMs_3 = band100.enteredAtMs
	
	if enteredAtMs_3 ~= nil then
		local var9 = p14 - enteredAtMs_3
		cumulativeMs_2 += var9
		
		if maxContinuousMs_2 < var9 then
			maxContinuousMs_2 = var9
		end
	end
	table.insert(p16, {
		milestoneLabel = p13,
		geometry = {
			adSize = p15.adSize,
			viewportBounds = {
				min = p15.viewportBounds.min,
				max = p15.viewportBounds.max
			}
		},
		viewabilitySessionStartTimestampMs = self.startTimestampMs,
		cumulative30PercentInViewDurationMs = cumulativeMs,
		cumulative50PercentInViewDurationMs = cumulativeMs_1,
		cumulative100PercentInViewDurationMs = cumulativeMs_2,
		maxContinuous30PercentInViewDurationMs = maxContinuousMs,
		maxContinuous50PercentInViewDurationMs = maxContinuousMs_1,
		maxContinuous100PercentInViewDurationMs = maxContinuousMs_2
	})
end

function t_1:_accumulate(p17, p18, p19) --[[ line: 246 ]]
	local lastSampleMs = self._lastSampleMs
	
	if lastSampleMs ~= nil and self._lastRatio > 0 then
		local var10 = p17 - lastSampleMs
		
		if var10 > 0 then
			self._percentWeightedSum += self._lastRatio * var10
			self._realEstateWeightedSum += self._lastRealEstate * var10
			self._visibleWeightedMs += var10
		end
	end
	local var11
	self._lastSampleMs = p17
	self._lastRatio = p18
	
	if p19 == nil then
		var11 = 0
	else
		local viewportBounds = p19.viewportBounds
		local var12 = (viewportBounds.max.X - viewportBounds.min.X) * (viewportBounds.max.Y - viewportBounds.min.Y)
		var11 = if var12 <= 0 then 0 else p18 * p19.adSize.X * p19.adSize.Y / var12
	end
	self._lastRealEstate = var11
	
	if p18 > 0 then
		if self._minPercentSeen == nil or p18 < self._minPercentSeen then
			self._minPercentSeen = p18
		end
		if self._maxPercentSeen == nil or self._maxPercentSeen < p18 then
			self._maxPercentSeen = p18
		end
	end
end

function t_1:pause(p20) --[[ line: 276 ]]
	assert(not self._finalized, "pause called after finalize")
	assert(self._pausedAtMs == nil, "pause called while already paused")
	assert((self._lastSampleMs or self.startTimestampMs) <= p20, "pause timestamp precedes the last sample")
	self:_accumulate(p20, 0, nil)
	local band30 = self._band30
	local enteredAtMs = band30.enteredAtMs
	
	if enteredAtMs ~= nil then
		local var13 = p20 - enteredAtMs
		band30.cumulativeMs += var13
		
		if band30.maxContinuousMs < var13 then
			band30.maxContinuousMs = var13
		end
		band30.enteredAtMs = nil
	end
	local band50 = self._band50
	local enteredAtMs_1 = band50.enteredAtMs
	
	if enteredAtMs_1 ~= nil then
		local var14 = p20 - enteredAtMs_1
		band50.cumulativeMs += var14
		
		if band50.maxContinuousMs < var14 then
			band50.maxContinuousMs = var14
		end
		band50.enteredAtMs = nil
	end
	local band100 = self._band100
	local enteredAtMs_2 = band100.enteredAtMs
	
	if enteredAtMs_2 ~= nil then
		local var15 = p20 - enteredAtMs_2
		band100.cumulativeMs += var15
		
		if band100.maxContinuousMs < var15 then
			band100.maxContinuousMs = var15
		end
		band100.enteredAtMs = nil
	end
	self._pausedAtMs = p20
end

function t_1:resume(p21) --[[ line: 288 ]]
	assert(not self._finalized, "resume called after finalize")
	local pausedAtMs = self._pausedAtMs
	assert(pausedAtMs ~= nil, "resume called while not paused")
	assert(pausedAtMs <= p21, "resume timestamp precedes pause")
	self._pausedDurationMs += p21 - pausedAtMs
	self._pausedAtMs = nil
	self._lastSampleMs = p21
	self._lastRatio = 0
	self._lastRealEstate = 0
end

function t_1:advance(p22, p23, p24) --[[ line: 303 ]]
	-- upvalues: t (ref)
	assert(not self._finalized, "advance called after finalize")
	assert(self._pausedAtMs == nil, "advance called while paused")
	local t_1 = {}
	
	if p24 ~= nil then
		self:_classifyDisplayOnce(p24.adSize)
		self._latchedGeometry = p24
	end
	self:_accumulate(p22, p23, p24)
	local band30 = self._band30
	
	if band30.threshold > p23 then
		local enteredAtMs = band30.enteredAtMs
		
		if enteredAtMs ~= nil then
			local var17 = p22 - enteredAtMs
			band30.cumulativeMs += var17
			
			if band30.maxContinuousMs < var17 then
				band30.maxContinuousMs = var17
			end
			band30.enteredAtMs = nil
		end
	elseif band30.enteredAtMs == nil then
		band30.enteredAtMs = p22
	end
	local band50 = self._band50
	
	if band50.threshold > p23 then
		local enteredAtMs = band50.enteredAtMs
		
		if enteredAtMs ~= nil then
			local var18 = p22 - enteredAtMs
			band50.cumulativeMs += var18
			
			if band50.maxContinuousMs < var18 then
				band50.maxContinuousMs = var18
			end
			band50.enteredAtMs = nil
		end
	elseif band50.enteredAtMs == nil then
		band50.enteredAtMs = p22
	end
	local band100 = self._band100
	
	if band100.threshold > p23 then
		local enteredAtMs = band100.enteredAtMs
		
		if enteredAtMs ~= nil then
			local var19 = p22 - enteredAtMs
			band100.cumulativeMs += var19
			
			if band100.maxContinuousMs < var19 then
				band100.maxContinuousMs = var19
			end
			band100.enteredAtMs = nil
		end
	elseif band100.enteredAtMs == nil then
		band100.enteredAtMs = p22
	end
	if p24 == nil then
		return t_1
	end
	local displayLabel = self._displayLabel
	
	if displayLabel ~= nil then
		self:_tryFire(if displayLabel == t.IabDisplayLarge then self._band30 else self._band50, displayLabel, p22, p24, t_1)
	end
	self:_tryFire(self._band100, t.FullView, p22, p24, t_1)
	
	return t_1
end

function t_1:finalize(p25) --[[ line: 339 ]]
	assert(not self._finalized, "finalize called more than once on the same session")
	self._finalized = true
	self:_accumulate(p25, self._lastRatio, self._latchedGeometry)
	local band30 = self._band30
	local enteredAtMs = band30.enteredAtMs
	
	if enteredAtMs ~= nil then
		local var20 = p25 - enteredAtMs
		band30.cumulativeMs += var20
		
		if band30.maxContinuousMs < var20 then
			band30.maxContinuousMs = var20
		end
		band30.enteredAtMs = nil
	end
	local band50 = self._band50
	local enteredAtMs_1 = band50.enteredAtMs
	
	if enteredAtMs_1 ~= nil then
		local var21 = p25 - enteredAtMs_1
		band50.cumulativeMs += var21
		
		if band50.maxContinuousMs < var21 then
			band50.maxContinuousMs = var21
		end
		band50.enteredAtMs = nil
	end
	local band100 = self._band100
	local enteredAtMs_2 = band100.enteredAtMs
	
	if enteredAtMs_2 ~= nil then
		local var22 = p25 - enteredAtMs_2
		band100.cumulativeMs += var22
		
		if band100.maxContinuousMs < var22 then
			band100.maxContinuousMs = var22
		end
		band100.enteredAtMs = nil
	end
	local visibleWeightedMs = self._visibleWeightedMs
	local latchedGeometry = self._latchedGeometry
	local pausedDurationMs = self._pausedDurationMs
	local pausedAtMs = self._pausedAtMs
	
	if pausedAtMs ~= nil then
		assert(pausedAtMs <= p25, "session end precedes pause")
		pausedDurationMs += p25 - pausedAtMs
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
		viewabilitySessionEndTimestampMs = p25,
		dwellDurationMs = p25 - self.startTimestampMs - pausedDurationMs,
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

t_1.MilestoneLabels = t
t_1.MilestoneDurationMs = 1000

return t_1