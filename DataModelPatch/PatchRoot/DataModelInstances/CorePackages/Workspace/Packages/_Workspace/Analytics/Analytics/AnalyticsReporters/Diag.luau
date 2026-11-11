local UserInputService = game:GetService("UserInputService")
local DiagModule = {}
DiagModule.__index = DiagModule

function DiagModule.new(_reporter)
	-- upvalues: DiagModule (copy)
	local ValueType = type(_reporter)
	assert(ValueType == "table" or ValueType == "userdata", "Unexpected value for reportingService")
	local config = { _isEnabled = true, _reporter = _reporter }
	setmetatable(config, DiagModule)
	
	return config
end

function DiagModule:setEnabled(_isEnabled)
	assert(type(_isEnabled) == "boolean", "Expected isEnabled to be a boolean")
	self._isEnabled = _isEnabled
end

function DiagModule:reportCounter(CounterName: string, Amount)
	-- upvalues: UserInputService (copy)
	assert(type(CounterName) == "string", "Expected counterName to be a string")
	assert(type(Amount) == "number", "Expected amount to be a number")
	assert(self._isEnabled, "This reporting service is disabled")
	local None = Enum.Platform.None
	pcall(function()
		-- upvalues: None (ref), UserInputService (upval)
		None = UserInputService:GetPlatform()
	end)
	
	if None == Enum.Platform.XBoxOne then
		CounterName = "Xbox-" .. tostring(CounterName)
	end
	self._reporter:ReportCounter(CounterName, Amount)
end

function DiagModule:reportCounterSimple(CounterName, Amount)
	if self._isEnabled then
		self._reporter:ReportCounter(CounterName, Amount)
	end
end

function DiagModule:reportStats(Category, p1)
	assert(type(Category) == "string", "Expected category to be a string")
	assert(type(p1) == "number", "Expected value to be a number")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:ReportStats(Category, p1)
end

return DiagModule