local runService = game:GetService("RunService")
local tModule = require(game:GetService("CorePackages").Packages.t)
local var2 = tModule.strictInterface({
	period = tModule.number,
	threshold = tModule.number,
	processInterval = tModule.number
})
local t = {}
t.__index = t

function t.new(p0) --[[ line: 16 ]]
	-- upvalues: var2 (ref), t (ref)
	assert(var2(p0))
	
	return setmetatable({
		_lastProcessed = 0,
		_period = p0.period,
		_threshold = p0.threshold,
		_processInterval = p0.processInterval,
		_counts = {},
		_lastOccurrences = {}
	}, t)
end

function t:increment(p1, p2) --[[ line: 29 ]]
	self._lastOccurrences[p1] = p2 or os.clock()
	
	if self._counts[p1] == nil then
		self._counts[p1] = 1
		
		return
	end
	self._counts[p1] += 1
end

function t:isRateLimited(p3) --[[ line: 40 ]]
	local var4 = self._counts[p3]
	
	return var4 ~= nil and self._threshold < var4
end

function t:startDecrementClock() --[[ line: 45 ]]
	-- upvalues: runService (ref)
	self._decrementConnection = runService.Heartbeat:Connect(function() --[[ line: 46 ]]
		-- upvalues: self (ref)
		self:stepDecrementClock(os.clock())
	end)
end

function t:stepDecrementClock(p4) --[[ line: 51 ]]
	if self._processInterval < p4 - self._lastProcessed then
		for i, v in pairs(self._lastOccurrences) do
			if self._period < p4 - v then
				self._counts[i] -= 1
				
				if self._counts[i] <= 0 then
					self._counts[i] = nil
					self._lastOccurrences[i] = nil
				end
			end
		end
		self._lastProcessed = p4
	end
end

return t