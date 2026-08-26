local statsUtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Stats.StatsUtils)
local t = {}
t.__index = t

function t.new(p1, p2, p3)
	-- upvalues: t (ref), statsUtilsModule (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1._statType = p1
	t_1._numSamples = p2
	t_1._pauseBetweenSamples = p3
	t_1._statName = statsUtilsModule.StatNames[t_1._statType]
	t_1._statMaxName = statsUtilsModule.StatMaxNames[t_1._statType]
	t_1._samples = {}
	
	for i = 0, p2 - 1 do
		t_1._samples[i] = 0
	end
	t_1._oldestIndex = 0
	t_1._listeners = {}
	t_1._nextListenerId = 1001
	
	return t_1
end

function t:AddListener(p4)
	local nextListenerId = self._nextListenerId
	self._nextListenerId += 1
	self._listeners[nextListenerId] = p4
	
	return nextListenerId
end

function t:RemoveListener(p4)
	self._listeners[p4] = nil
end

function t:_notifyAllListeners()
	for i, v in pairs(self._listeners) do
		v()
	end
end

function t:StartListening()
	if self._listening == true then
		return
	end
	spawn(function()
		-- upvalues: self (ref)
		self._listening = true
		while self._listening do
			self:_storeStatValue(self:_getStatValue())
			self:_notifyAllListeners()
			wait(self._pauseBetweenSamples)
		end
	end)
end

function t:StopListening()
	self._listening = false
end

function t:GetValues()
	local t = {}
	local _ = nil
	
	for i = 0, self._numSamples - 1 do
		t[i + 1] = self._samples[(self._oldestIndex + i) % self._numSamples]
	end
	return t
end

function t:GetAverage()
	local var1 = 0
	
	for i = 0, self._numSamples - 1 do
		var1 += self._samples[i]
	end
	return var1 / self._numSamples
end

function t:GetLatestValue()
	return self._samples[(self._oldestIndex + self._numSamples - 1) % self._numSamples]
end

function t:_storeStatValue(p4)
	self._samples[self._oldestIndex] = p4
	self._oldestIndex = (self._oldestIndex + 1) % self._numSamples
end

function t:_getStatValue()
	local statsService = game:GetService("Stats")
	
	if statsService == nil then
		return 0
	end
	local performanceStats = statsService:FindFirstChild("PerformanceStats")
	
	if performanceStats == nil then
		return 0
	end
	local statName = performanceStats:FindFirstChild(self._statName)
	
	return if statName == nil then 0 else statName:GetValue()
end

function t:GetTarget()
	local statsService = game:GetService("Stats")
	
	if statsService == nil then
		return 0
	end
	local performanceStats = statsService:FindFirstChild("PerformanceStats")
	
	if performanceStats == nil then
		return 0
	end
	local statMaxName = performanceStats:FindFirstChild(self._statMaxName)
	
	return if statMaxName == nil then 0 else statMaxName:GetValue()
end

return t