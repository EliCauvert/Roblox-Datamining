local UserInputService = game:GetService("UserInputService")
local GetPlatformTargetModule = nil
GetPlatformTargetModule = if require(script:FindFirstAncestor("Analytics").Parent.SharedFlags).GetFFlagShareGetPlatformTargetImpl() then require(script.Parent.Parent.getPlatformTarget) else function(): string --[[ Line: 36 | Named "getPlatformTarget" ]]
	-- upvalues: UserInputService (copy)
	local v1 = "unknownLua"
	local None = Enum.Platform.None
	pcall(function() --[[ Line: 42 ]]
		-- upvalues: None (ref), UserInputService (upval)
		None = UserInputService:GetPlatform()
	end)
	local IsNoneMatch: boolean = None == Enum.Platform.Windows or None == Enum.Platform.OSX
	local IsNoneMatch1: boolean = None == Enum.Platform.IOS or None == Enum.Platform.Android or None == Enum.Platform.UWP
	local IsNoneMatch2: boolean = None == Enum.Platform.XBox360 or None == Enum.Platform.XBoxOne or (None == Enum.Platform.PS3 or (None == Enum.Platform.PS4 or game:GetEngineFeature("PlatformEnumPS5") and None == Enum.Platform.PS5)) or None == Enum.Platform.WiiU
	
	return if IsNoneMatch then "client" elseif IsNoneMatch1 then "mobile" elseif IsNoneMatch2 then "console" else v1 .. tostring(None)
end
local EventStreamModule = {}
EventStreamModule.__index = EventStreamModule

function EventStreamModule.new(_reporter) --[[ Line: 79 ]]
	-- upvalues: EventStreamModule (copy)
	local ValueType = type(_reporter)
	assert(ValueType == "table" or ValueType == "userdata", "Unexpected value for reportingService")
	local config = { _isEnabled = true, _reporter = _reporter }
	setmetatable(config, EventStreamModule)
	
	return config
end

function EventStreamModule:setEnabled(_isEnabled) --[[ Line: 92 ]]
	assert(type(_isEnabled) == "boolean", "Expected isEnabled to be a boolean")
	self._isEnabled = _isEnabled
end

function EventStreamModule:setRBXEvent(EventContext, EventName, p1) --[[ Line: 100 ]]
	-- upvalues: GetPlatformTargetModule (ref)
	local PlatformTargetModule = GetPlatformTargetModule()
	local P6 = p1 or {}
	assert(type(EventContext) == "string", "Expected eventContext to be a string")
	assert(type(EventName) == "string", "Expected eventName to be a string")
	assert(type(P6) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:SetRBXEvent(PlatformTargetModule, EventContext, EventName, P6)
end

function EventStreamModule:setRBXEventStream(EventContext, EventName, p1) --[[ Line: 116 ]]
	-- upvalues: GetPlatformTargetModule (ref)
	local PlatformTargetModule = GetPlatformTargetModule()
	local P10 = p1 or {}
	assert(type(EventContext) == "string", "Expected eventContext to be a string")
	assert(type(EventName) == "string", "Expected eventName to be a string")
	assert(type(P10) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:SetRBXEventStream(PlatformTargetModule, EventContext, EventName, P10)
end

function EventStreamModule:releaseRBXEventStream() --[[ Line: 129 ]]
	-- upvalues: GetPlatformTargetModule (ref)
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:ReleaseRBXEventStream(GetPlatformTargetModule())
end

function EventStreamModule:sendEventDeferred(EventContext, EventName, p1) --[[ Line: 138 ]]
	-- upvalues: GetPlatformTargetModule (ref)
	local PlatformTargetModule = GetPlatformTargetModule()
	local P15 = p1 or {}
	assert(type(EventContext) == "string", "Expected eventContext to be a string")
	assert(type(EventName) == "string", "Expected eventName to be a string")
	assert(type(P15) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:SendEventDeferred(PlatformTargetModule, EventContext, EventName, P15)
end

function EventStreamModule:sendEventImmediately(EventContext, EventName, p1) --[[ Line: 154 ]]
	-- upvalues: GetPlatformTargetModule (ref)
	local PlatformTargetModule = GetPlatformTargetModule()
	local P19 = p1 or {}
	assert(type(EventContext) == "string", "Expected eventContext to be a string")
	assert(type(EventName) == "string", "Expected eventName to be a string")
	assert(type(P19) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:SendEventImmediately(PlatformTargetModule, EventContext, EventName, P19)
end

function EventStreamModule:updateHeartbeatObject(p1) --[[ Line: 168 ]]
	local P21 = p1 or {}
	assert(type(P21) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:UpdateHeartbeatObject(P21)
end

return EventStreamModule