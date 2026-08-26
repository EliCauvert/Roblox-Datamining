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

function t:reportSeries(p1, p2, p3)
	p2 = p2 or {}
	assert(type(p1) == "string", "Expected seriesName to be a string")
	assert(type(p2) == "table", "Expected additionalArgs to be a table")
	assert(type(p3) == "number", "Expected throttlingPercent to be a number")
	assert(p3 >= 0 and p3 <= 10000, "throttlingPercent must be between 0 - 10,000")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:ReportInfluxSeries(p1, p2, p3)
end

return t