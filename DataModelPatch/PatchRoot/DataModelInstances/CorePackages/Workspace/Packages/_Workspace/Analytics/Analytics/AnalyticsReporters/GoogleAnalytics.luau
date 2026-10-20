local GoogleAnalyticsModule = {}
GoogleAnalyticsModule.__index = GoogleAnalyticsModule

function GoogleAnalyticsModule.new(_reporter)
	-- upvalues: GoogleAnalyticsModule (copy)
	local ValueType = type(_reporter)
	assert(ValueType == "table" or ValueType == "userdata", "Unexpected value for reportingService")
	local config = { _isEnabled = true, _reporter = _reporter }
	setmetatable(config, GoogleAnalyticsModule)
	
	return config
end

function GoogleAnalyticsModule:setEnabled(_isEnabled)
	assert(type(_isEnabled) == "boolean", "Expected isEnabled to be a boolean")
	self._isEnabled = _isEnabled
end

function GoogleAnalyticsModule:trackEvent(Category, Action, Label, p1: number)
	assert(type(Category) == "string", "Expected category to be a string")
	assert(type(Action) == "string", "Expected action to be a string")
	
	if Label then
		assert(type(Label) == "string", "Expected label to be a string")
	end
	if p1 then
		assert(type(p1) == "number", "Expected value to be a number")
		assert(p1 >= 0, "Expected value must not be a negative value")
	end
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:TrackEvent(Category, Action, Label, p1)
end

return GoogleAnalyticsModule