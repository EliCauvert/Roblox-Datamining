local t = {}
t.__index = t

function t.new(p0) --[[ line: 24 ]]
	-- upvalues: t (ref)
	local var1 = type(p0)
	assert(if var1 ~= "table" then var1 == "userdata" else true, "Unexpected value for reportingService")
	local t_1 = { _isEnabled = true, _reporter = p0 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:setEnabled(p1) --[[ line: 37 ]]
	assert(type(p1) == "boolean", "Expected isEnabled to be a boolean")
	self._isEnabled = p1
end

function t:trackEvent(p2, p3, p4, p5) --[[ line: 46 ]]
	assert(type(p2) == "string", "Expected category to be a string")
	assert(type(p3) == "string", "Expected action to be a string")
	
	if p4 then
		assert(type(p4) == "string", "Expected label to be a string")
	end
	if p5 then
		assert(type(p5) == "number", "Expected value to be a number")
		assert(p5 >= 0, "Expected value must not be a negative value")
	end
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:TrackEvent(p2, p3, p4, p5)
end

return t