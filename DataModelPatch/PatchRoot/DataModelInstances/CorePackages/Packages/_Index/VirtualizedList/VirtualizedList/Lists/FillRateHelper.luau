local LuauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local Console = LuauPolyfillModule.console
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy)
	local self = setmetatable({}, Module)
	self.any_blank_count = 0
	self.any_blank_ms = 0
	self.any_blank_speed_sum = 0
	self.mostly_blank_count = 0
	self.mostly_blank_ms = 0
	self.pixels_blank = 0
	self.pixels_sampled = 0
	self.pixels_scrolled = 0
	self.total_time_spent = 0
	self.sample_count = 0
	
	return self
end

local FilterResult = {}
local MinSampleCount = 10
local SampleRate = nil
local FillRateHelper = {}
FillRateHelper.__index = FillRateHelper

function FillRateHelper.new(_getFrameMetrics)
	-- upvalues: FillRateHelper (copy), Module (copy), SampleRate (ref)
	local self = setmetatable({}, FillRateHelper)
	self._anyBlankStartTime = nil
	self._enabled = false
	self._info = Module.new()
	self._mostlyBlankStartTime = nil
	self._samplesStartTime = nil
	self._getFrameMetrics = _getFrameMetrics
	
	if SampleRate then
		self._enabled = math.random() < SampleRate
	else
		self._enabled = math.random() < 0
	end
	self:_resetData()
	
	return self
end

function FillRateHelper.addListener(p1)
	-- upvalues: SampleRate (ref), Console (copy), FilterResult (ref), Array (copy)
	if SampleRate == nil then
		Console.warn("Call `FillRateHelper.setSampleRate` before `addListener`.")
	end
	table.insert(FilterResult, p1)
	
	return {
		remove = function()
			-- upvalues: FilterResult (upval), Array (upval), p1 (copy)
			FilterResult = Array.filter(FilterResult, function(p2): boolean
				-- upvalues: p1 (upval)
				return p1 ~= p2
			end)
		end
	}
end

function FillRateHelper.setSampleRate(Value)
	-- upvalues: SampleRate (ref)
	SampleRate = Value
end

function FillRateHelper.setMinSampleCount(Value)
	-- upvalues: MinSampleCount (ref)
	MinSampleCount = Value
end

function FillRateHelper:activate()
	if self._enabled and self._samplesStartTime == nil then
		self._samplesStartTime = os.clock()
	end
end

function FillRateHelper:deactivateAndFlush()
	-- upvalues: MinSampleCount (ref), Object (copy), Array (copy), FilterResult (ref)
	if not self._enabled then return end
	local SamplesStartTime = self._samplesStartTime
	
	if SamplesStartTime == nil then return end
	if self._info.sample_count < MinSampleCount then
		self:_resetData()
		
		return
	else
		local AssignResult = Object.assign({}, self._info, { total_time_spent = os.clock() - SamplesStartTime })
		Array.forEach(FilterResult, function(Callback)
			-- upvalues: AssignResult (copy)
			return Callback(AssignResult)
		end)
		self:_resetData()
	end
end

function FillRateHelper:computeBlankness(p1, p2, p3): number
	if not self._enabled or p1.getItemCount(p1.data) == 0 or self._samplesStartTime == nil then
		return 0
	end
	local DOffset = p3.dOffset
	local Offset: number = p3.offset
	local Velocity = p3.velocity
	local VisibleLength: number = p3.visibleLength
	local Info = self._info
	Info.sample_count += 1
	local Info1 = self._info
	Info1.pixels_sampled += math.round(VisibleLength)
	local Info2 = self._info
	Info2.pixels_scrolled += math.round((math.abs(DOffset or 0)))
	local Rounded = math.round(math.abs(Velocity or 0) * 1000)
	local ScaledClockTime = os.clock() * 1000
	
	if self._anyBlankStartTime ~= nil then
		local Info3 = self._info
		Info3.any_blank_ms += ScaledClockTime - self._anyBlankStartTime
	end
	self._anyBlankStartTime = nil
	
	if self._mostlyBlankStartTime ~= nil then
		local Info4 = self._info
		Info4.mostly_blank_ms += ScaledClockTime - self._mostlyBlankStartTime
	end
	self._mostlyBlankStartTime = nil
	local Smallest = 0
	local First = p2.first
	local FrameMetrics = self._getFrameMetrics(First)
	while First <= p2.last and (not FrameMetrics or not FrameMetrics.inLayout) do
		FrameMetrics = self._getFrameMetrics(First)
		First += 1
	end
	if FrameMetrics and First > 1 then
		Smallest = math.min(VisibleLength, (math.max(0, FrameMetrics.offset - Offset)))
	end
	local Smallest1 = 0
	local Last = p2.last
	local FrameMetrics1 = self._getFrameMetrics(Last)
	while p2.first <= Last and (not FrameMetrics1 or not FrameMetrics1.inLayout) do
		FrameMetrics1 = self._getFrameMetrics(Last)
		Last -= 1
	end
	if FrameMetrics1 and Last < p1.getItemCount(p1.data) then
		Smallest1 = math.min(VisibleLength, (math.max(0, Offset + VisibleLength - (FrameMetrics1.offset + FrameMetrics1.length))))
	end
	local Rounded1 = math.round(Smallest + Smallest1)
	local RoundedRatio = Rounded1 / VisibleLength
	
	if RoundedRatio > 0 then
		self._anyBlankStartTime = ScaledClockTime
		local Info5 = self._info
		Info5.any_blank_speed_sum += Rounded
		local Info6 = self._info
		Info6.any_blank_count += 1
		local Info7 = self._info
		Info7.pixels_blank += Rounded1
		
		if RoundedRatio > 0.5 then
			self._mostlyBlankStartTime = ScaledClockTime
			local Info8 = self._info
			Info8.mostly_blank_count += 1
			
			return RoundedRatio
		end
	elseif Rounded < 0.01 or math.abs(DOffset or 0) < 1 then
		self:deactivateAndFlush()
	end
	return RoundedRatio
end

function FillRateHelper:enabled()
	return self._enabled
end

function FillRateHelper:_resetData()
	-- upvalues: Module (copy)
	self._anyBlankStartTime = nil
	self._info = Module.new()
	self._mostlyBlankStartTime = nil
	self._samplesStartTime = nil
end

return FillRateHelper