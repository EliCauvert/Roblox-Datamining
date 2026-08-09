local _ = require(script.Parent.calculateIntersectionRatio)
local t = {
	IabDisplayStandard = "IabDisplayStandard",
	IabDisplayLarge = "IabDisplayLarge",
	FullView = "FullView"
}

local function _(p0) --[[ line: 45 | named "newBand" ]]
	return { enteredAtMs = nil, threshold = p0 }
end

local _ = function(p1, p2, p3) --[[ line: 50 | named "updateBandTimer" ]]
	if p1.threshold <= p2 then
		if p1.enteredAtMs == nil then
			p1.enteredAtMs = p3
			
			return
		end
	else
		p1.enteredAtMs = nil
	end
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p4) --[[ line: 75 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		_displayBand = nil,
		_displayLabel = nil,
		startTimestampMs = p4,
		_achieved = {},
		_band100 = { threshold = 1, enteredAtMs = nil }
	}, t_1)
end

function t_1:_classifyDisplayOnce(p5) --[[ line: 87 ]]
	-- upvalues: t (ref)
	if self._displayBand ~= nil then return end
	local var2 = p5.X * p5.Y
	
	if var2 <= 0 then return end
	if var2 > 242500 then
		self._displayBand = { threshold = 0.3, enteredAtMs = nil }
		self._displayLabel = t.IabDisplayLarge
		
		return
	end
	self._displayBand = { threshold = 0.5, enteredAtMs = nil }
	self._displayLabel = t.IabDisplayStandard
end

function t_1:_tryFire(p6, p7, p8, p9, p10) --[[ line: 104 ]]
	if self._achieved[p7] then return end
	local enteredAtMs = p6.enteredAtMs
	
	if enteredAtMs == nil then return end
	if p8 - enteredAtMs < 1000 then
		return
	end
	self._achieved[p7] = true
	table.insert(p10, {
		milestoneLabel = p7,
		geometry = {
			adSize = p9.adSize,
			viewportBounds = { min = p9.viewportBounds.min, max = p9.viewportBounds.max }
		},
		viewabilitySessionStartTimestampMs = self.startTimestampMs
	})
end

function t_1:advance(p11, p12, p13) --[[ line: 141 ]]
	-- upvalues: t (ref)
	if p13 ~= nil then
		self:_classifyDisplayOnce(p13.adSize)
	end
	local displayBand = self._displayBand
	
	if displayBand ~= nil then
		if displayBand.threshold > p12 then
			displayBand.enteredAtMs = nil
		elseif displayBand.enteredAtMs == nil then
			displayBand.enteredAtMs = p11
		end
	end
	local band100 = self._band100
	
	if band100.threshold > p12 then
		band100.enteredAtMs = nil
	elseif band100.enteredAtMs == nil then
		band100.enteredAtMs = p11
	end
	local t_1 = {}
	
	if p13 == nil then
		return t_1
	end
	local displayLabel = self._displayLabel
	
	if displayBand ~= nil and displayLabel ~= nil then
		self:_tryFire(displayBand, displayLabel, p11, p13, t_1)
	end
	self:_tryFire(self._band100, t.FullView, p11, p13, t_1)
	
	return t_1
end

t_1.MilestoneLabels = t
t_1.MilestoneDurationMs = 1000

return t_1