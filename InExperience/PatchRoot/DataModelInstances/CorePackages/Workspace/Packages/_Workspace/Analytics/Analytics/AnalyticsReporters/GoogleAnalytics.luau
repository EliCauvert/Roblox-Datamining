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

function t:trackEvent(p1, p2, p3, p4)
	assert(type(p1) == "string", "Expected category to be a string")
	assert(type(p2) == "string", "Expected action to be a string")
	
	if p3 then
		assert(type(p3) == "string", "Expected label to be a string")
	end
	if p4 then
		assert(type(p4) == "number", "Expected value to be a number")
		assert(p4 >= 0, "Expected value must not be a negative value")
	end
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:TrackEvent(p1, p2, p3, p4)
end

return t