local RunService = game:GetService("RunService")
local TModule = require(game:GetService("CorePackages").Packages.t)
local StrictInterfaceResult = TModule.strictInterface({
	period = TModule.number,
	threshold = TModule.number,
	processInterval = TModule.number
})
local RateLimiterModule = {}
RateLimiterModule.__index = RateLimiterModule

function RateLimiterModule.new(p1)
	-- upvalues: StrictInterfaceResult (copy), RateLimiterModule (copy)
	assert(StrictInterfaceResult(p1))
	
	return (setmetatable({
		_lastProcessed = 0,
		_period = p1.period,
		_threshold = p1.threshold,
		_processInterval = p1.processInterval,
		_counts = {},
		_lastOccurrences = {}
	}, RateLimiterModule))
end

function RateLimiterModule:increment(Key, p1)
	self._lastOccurrences[Key] = p1 or os.clock()
	
	if self._counts[Key] == nil then
		self._counts[Key] = 1
		
		return
	else
		local Counts = self._counts
		Counts[Key] += 1
	end
end

function RateLimiterModule:isRateLimited(p1): boolean
	local Count = self._counts[p1]
	
	return Count ~= nil and self._threshold < Count
end

function RateLimiterModule:startDecrementClock()
	-- upvalues: RunService (copy)
	self._decrementConnection = RunService.Heartbeat:Connect(function()
		-- upvalues: self (copy)
		self:stepDecrementClock(os.clock())
	end)
end

function RateLimiterModule:stepDecrementClock(_lastProcessed)
	if self._processInterval < _lastProcessed - self._lastProcessed then
		for i, lastOccurrence in pairs(self._lastOccurrences) do
			if self._period < _lastProcessed - lastOccurrence then
				local Counts = self._counts
				Counts[i] -= 1
				
				if self._counts[i] <= 0 then
					self._counts[i] = nil
					self._lastOccurrences[i] = nil
				end
			end
		end
		self._lastProcessed = _lastProcessed
	end
end

return RateLimiterModule