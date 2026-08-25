local userInputService = game:GetService("UserInputService")
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref)
	local var2 = type(p0)
	assert(if var2 ~= "table" then var2 == "userdata" else true, "Unexpected value for reportingService")
	local t_1 = { _isEnabled = true, _reporter = p0 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:setEnabled(p1)
	assert(type(p1) == "boolean", "Expected isEnabled to be a boolean")
	self._isEnabled = p1
end

function t:reportCounter(p2, p3)
	-- upvalues: userInputService (ref)
	assert(type(p2) == "string", "Expected counterName to be a string")
	assert(type(p3) == "number", "Expected amount to be a number")
	assert(self._isEnabled, "This reporting service is disabled")
	local none = Enum.Platform.None
	pcall(function()
		-- upvalues: none (write), userInputService (copy)
		none = userInputService:GetPlatform()
	end)
	
	if none == Enum.Platform.XBoxOne then
		p2 = "Xbox-" .. tostring(p2)
	end
	self._reporter:ReportCounter(p2, p3)
end

function t:reportCounterSimple(p4, p5)
	if self._isEnabled then
		self._reporter:ReportCounter(p4, p5)
	end
end

function t:reportStats(p6, p7)
	assert(type(p6) == "string", "Expected category to be a string")
	assert(type(p7) == "number", "Expected value to be a number")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:ReportStats(p6, p7)
end

return t