local userInputService = game:GetService("UserInputService")
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local var1 = type(p1)
	assert(if var1 ~= "table" then var1 == "userdata" else true, "Unexpected value for reportingService")
	local t_1 = { _isEnabled = true, _reporter = p1 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:setEnabled(p1)
	assert(type(p1) == "boolean", "Expected isEnabled to be a boolean")
	self._isEnabled = p1
end

function t:reportCounter(p1, p2)
	-- upvalues: userInputService (ref)
	assert(type(p1) == "string", "Expected counterName to be a string")
	assert(type(p2) == "number", "Expected amount to be a number")
	assert(self._isEnabled, "This reporting service is disabled")
	local none = Enum.Platform.None
	pcall(function()
		-- upvalues: none (write), userInputService (copy)
		none = userInputService:GetPlatform()
	end)
	
	if none == Enum.Platform.XBoxOne then
		p1 = "Xbox-" .. tostring(p1)
	end
	self._reporter:ReportCounter(p1, p2)
end

function t:reportCounterSimple(p1, p2)
	if self._isEnabled then
		self._reporter:ReportCounter(p1, p2)
	end
end

function t:reportStats(p1, p2)
	assert(type(p1) == "string", "Expected category to be a string")
	assert(type(p2) == "number", "Expected value to be a number")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:ReportStats(p1, p2)
end

return t