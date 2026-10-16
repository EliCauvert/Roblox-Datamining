local StatsUtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Stats.StatsUtils)
local StatsAggregatorModule = {}
StatsAggregatorModule.__index = StatsAggregatorModule

function StatsAggregatorModule.new(_statType, _numSamples: number, _pauseBetweenSamples) --[[ Line: 18 ]]
	-- upvalues: StatsAggregatorModule (copy), StatsUtilsModule (copy)
	local t = {}
	setmetatable(t, StatsAggregatorModule)
	t._statType = _statType
	t._numSamples = _numSamples
	t._pauseBetweenSamples = _pauseBetweenSamples
	t._statName = StatsUtilsModule.StatNames[t._statType]
	t._statMaxName = StatsUtilsModule.StatMaxNames[t._statType]
	t._samples = {}
	
	for i = 0, _numSamples - 1 do
		t._samples[i] = 0
	end
	t._oldestIndex = 0
	t._listeners = {}
	t._nextListenerId = 1001
	
	return t
end

function StatsAggregatorModule:AddListener(p1) --[[ Line: 45 ]]
	local NextListenerId = self._nextListenerId
	self._nextListenerId += 1
	self._listeners[NextListenerId] = p1
	
	return NextListenerId
end

function StatsAggregatorModule:RemoveListener(p1) --[[ Line: 52 ]]
	self._listeners[p1] = nil
end

function StatsAggregatorModule._notifyAllListeners(p1) --[[ Line: 56 ]]
	for _, listener in pairs(p1._listeners) do
		listener()
	end
end

function StatsAggregatorModule:StartListening() --[[ Line: 62 ]]
	if self._listening ~= true then
		spawn(function() --[[ Line: 70 ]]
			-- upvalues: self (copy)
			self._listening = true
			while self._listening do
				self:_storeStatValue((self:_getStatValue()))
				self:_notifyAllListeners()
				wait(self._pauseBetweenSamples)
			end
		end)
		
		return
	end
end

function StatsAggregatorModule:StopListening() --[[ Line: 81 ]]
	self._listening = false
end

function StatsAggregatorModule:GetValues() --[[ Line: 85 ]]
	local Samples = {}
	
	for i = 0, self._numSamples - 1 do
		Samples[i + 1] = self._samples[(self._oldestIndex + i) % self._numSamples]
	end
	return Samples
end

function StatsAggregatorModule:GetAverage() --[[ Line: 96 ]]
	local NewSample = 0
	
	for i = 0, self._numSamples - 1 do
		NewSample += self._samples[i]
	end
	return NewSample / self._numSamples
end

function StatsAggregatorModule:GetLatestValue() --[[ Line: 105 ]]
	return self._samples[(self._oldestIndex + self._numSamples - 1) % self._numSamples]
end

function StatsAggregatorModule:_storeStatValue(StatValue) --[[ Line: 111 ]]
	self._samples[self._oldestIndex] = StatValue
	self._oldestIndex = (self._oldestIndex + 1) % self._numSamples
end

function StatsAggregatorModule:_getStatValue() --[[ Line: 117 ]]
	local StatsService = game:GetService("Stats")
	
	if StatsService == nil then
		return 0
	end
	local PerformanceStats = StatsService:FindFirstChild("PerformanceStats")
	
	if PerformanceStats == nil then
		return 0
	else
		local StatName = PerformanceStats:FindFirstChild(self._statName)
		
		return if StatName == nil then 0 else StatName:GetValue()
	end
end

function StatsAggregatorModule:GetTarget() --[[ Line: 137 ]]
	local StatsService = game:GetService("Stats")
	
	if StatsService == nil then
		return 0
	end
	local PerformanceStats = StatsService:FindFirstChild("PerformanceStats")
	
	if PerformanceStats == nil then
		return 0
	else
		local StatMaxName = PerformanceStats:FindFirstChild(self._statMaxName)
		
		return if StatMaxName == nil then 0 else StatMaxName:GetValue()
	end
end

return StatsAggregatorModule