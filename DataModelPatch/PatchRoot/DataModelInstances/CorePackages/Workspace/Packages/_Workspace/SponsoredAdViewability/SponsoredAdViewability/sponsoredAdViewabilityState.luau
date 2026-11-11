local _ = require(script.Parent.calculateIntersectionRatio)
local MilestoneLabels = {
	IabDisplayStandard = "IabDisplayStandard",
	IabDisplayLarge = "IabDisplayLarge",
	FullView = "FullView"
}

local function _(Threshold)
	return { enteredAtMs = nil, threshold = Threshold }
end

local _ = function(_displayBand, p1, EnteredAtMs)
	if _displayBand.threshold > p1 then
		_displayBand.enteredAtMs = nil
	elseif _displayBand.enteredAtMs == nil then
		_displayBand.enteredAtMs = EnteredAtMs
		
		return
	end
end

local SponsoredAdViewabilityStateModule = {}
SponsoredAdViewabilityStateModule.__index = SponsoredAdViewabilityStateModule

function SponsoredAdViewabilityStateModule.new(StartTimestampMs)
	-- upvalues: SponsoredAdViewabilityStateModule (copy)
	return (setmetatable({
		_displayBand = nil,
		_displayLabel = nil,
		startTimestampMs = StartTimestampMs,
		_achieved = {},
		_band100 = { threshold = 1, enteredAtMs = nil }
	}, SponsoredAdViewabilityStateModule))
end

function SponsoredAdViewabilityStateModule:_classifyDisplayOnce(AdSize)
	-- upvalues: MilestoneLabels (copy)
	if self._displayBand ~= nil then return end
	local ScaledX = AdSize.X * AdSize.Y
	
	if ScaledX <= 0 then return end
	if ScaledX > 242500 then
		self._displayBand = { threshold = 0.3, enteredAtMs = nil }
		self._displayLabel = MilestoneLabels.IabDisplayLarge
		
		return
	else
		self._displayBand = { threshold = 0.5, enteredAtMs = nil }
		self._displayLabel = MilestoneLabels.IabDisplayStandard
	end
end

function SponsoredAdViewabilityStateModule:_tryFire(Band, MilestoneLabel, EnteredAtMs, p1, List)
	if self._achieved[MilestoneLabel] then return end
	local EnteredAtMs1 = Band.enteredAtMs
	
	if EnteredAtMs1 == nil then return end
	if EnteredAtMs - EnteredAtMs1 >= 1000 then
		self._achieved[MilestoneLabel] = true
		table.insert(List, {
			milestoneLabel = MilestoneLabel,
			geometry = {
				adSize = p1.adSize,
				viewportBounds = {
					min = p1.viewportBounds.min,
					max = p1.viewportBounds.max
				}
			},
			viewabilitySessionStartTimestampMs = self.startTimestampMs
		})
		
		return
	end
end

function SponsoredAdViewabilityStateModule:advance(EnteredAtMs, p1, p2)
	-- upvalues: MilestoneLabels (copy)
	if p2 ~= nil then
		self:_classifyDisplayOnce(p2.adSize)
	end
	local DisplayBand = self._displayBand
	
	if DisplayBand ~= nil then
		if DisplayBand.threshold <= p1 then
			if DisplayBand.enteredAtMs == nil then
				DisplayBand.enteredAtMs = EnteredAtMs
			end
		else
			DisplayBand.enteredAtMs = nil
		end
	end
	local Band100 = self._band100
	
	if Band100.threshold <= p1 then
		if Band100.enteredAtMs == nil then
			Band100.enteredAtMs = EnteredAtMs
		end
	else
		Band100.enteredAtMs = nil
	end
	local t = {}
	
	if p2 == nil then
		return t
	end
	local DisplayLabel = self._displayLabel
	
	if DisplayBand ~= nil and DisplayLabel ~= nil then
		self:_tryFire(DisplayBand, DisplayLabel, EnteredAtMs, p2, t)
	end
	self:_tryFire(self._band100, MilestoneLabels.FullView, EnteredAtMs, p2, t)
	
	return t
end

SponsoredAdViewabilityStateModule.MilestoneLabels = MilestoneLabels
SponsoredAdViewabilityStateModule.MilestoneDurationMs = 1000

return SponsoredAdViewabilityStateModule