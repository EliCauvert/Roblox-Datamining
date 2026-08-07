local t = {}
t.__index = t

function t.new(p0) --[[ line: 27 ]]
	-- upvalues: t (ref)
	local var1 = type(p0)
	assert(if var1 ~= "table" then var1 == "userdata" else true, "Unexpected value for reportingService")
	local t_1 = { _isEnabled = true, _reporter = p0 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:setEnabled(p1) --[[ line: 40 ]]
	assert(type(p1) == "boolean", "Expected isEnabled to be a boolean")
	self._isEnabled = p1
end

function t:reportSeries(p2, p3, p4) --[[ line: 48 ]]
	p3 = p3 or {}
	assert(type(p2) == "string", "Expected seriesName to be a string")
	assert(type(p3) == "table", "Expected additionalArgs to be a table")
	assert(type(p4) == "number", "Expected throttlingPercent to be a number")
	assert(p4 >= 0 and p4 <= 10000, "throttlingPercent must be between 0 - 10,000")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:ReportInfluxSeries(p2, p3, p4)
end

return t