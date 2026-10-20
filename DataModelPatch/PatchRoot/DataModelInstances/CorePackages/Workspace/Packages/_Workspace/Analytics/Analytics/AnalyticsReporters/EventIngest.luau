local Analytics = script:FindFirstAncestor("Analytics")
local UserInputService = game:GetService("UserInputService")
local GetPlatformTargetModule = nil
GetPlatformTargetModule = if require(Analytics.Parent.SharedFlags).GetFFlagShareGetPlatformTargetImpl() then require(Analytics.getPlatformTarget) else function(): string
	-- upvalues: UserInputService (copy)
	local v1 = "unknownLua"
	local None = Enum.Platform.None
	pcall(function()
		-- upvalues: None (ref), UserInputService (upval)
		None = UserInputService:GetPlatform()
	end)
	local IsNoneMatch: boolean = None == Enum.Platform.Windows or None == Enum.Platform.OSX
	local IsNoneMatch1: boolean = None == Enum.Platform.IOS or None == Enum.Platform.Android or None == Enum.Platform.UWP
	local IsNoneMatch2: boolean = None == Enum.Platform.XBox360 or None == Enum.Platform.XBoxOne or (None == Enum.Platform.PS3 or (None == Enum.Platform.PS4 or game:GetEngineFeature("PlatformEnumPS5") and None == Enum.Platform.PS5)) or None == Enum.Platform.WiiU
	
	return if IsNoneMatch then "client" elseif IsNoneMatch1 then "mobile" elseif IsNoneMatch2 then "console" else v1 .. tostring(None)
end
local EventIngestModule = {}
EventIngestModule.__index = EventIngestModule

function EventIngestModule.new(_eventIngest)
	-- upvalues: EventIngestModule (copy)
	local ValueType = type(_eventIngest)
	assert(ValueType == "table" or ValueType == "userdata", "Unexpected value for eventIngestService")
	local config = { _eventIngest = _eventIngest }
	setmetatable(config, EventIngestModule)
	
	return config
end

function EventIngestModule:setRBXEvent(EventContext, EventName, p1)
	-- upvalues: GetPlatformTargetModule (ref)
	local PlatformTargetModule = GetPlatformTargetModule()
	local P4 = p1 or {}
	assert(type(EventContext) == "string", "Expected eventContext to be a string")
	assert(type(EventName) == "string", "Expected eventName to be a string")
	assert(type(P4) == "table", "Expected additionalArgs to be a table")
	self._eventIngest:SetRBXEvent(PlatformTargetModule, EventContext, EventName, P4)
end

function EventIngestModule:setRBXEventStream(EventContext, EventName, p1)
	-- upvalues: GetPlatformTargetModule (ref)
	local PlatformTargetModule = GetPlatformTargetModule()
	local P8 = p1 or {}
	assert(type(EventContext) == "string", "Expected eventContext to be a string")
	assert(type(EventName) == "string", "Expected eventName to be a string")
	assert(type(P8) == "table", "Expected additionalArgs to be a table")
	self._eventIngest:SetRBXEventStream(PlatformTargetModule, EventContext, EventName, P8)
end

function EventIngestModule:sendEventDeferred(EventContext, EventName, p1)
	-- upvalues: GetPlatformTargetModule (ref)
	local PlatformTargetModule = GetPlatformTargetModule()
	local P12 = p1 or {}
	assert(type(EventContext) == "string", "Expected eventContext to be a string")
	assert(type(EventName) == "string", "Expected eventName to be a string")
	assert(type(P12) == "table", "Expected additionalArgs to be a table")
	self._eventIngest:SendEventDeferred(PlatformTargetModule, EventContext, EventName, P12)
end

function EventIngestModule:sendEventImmediately(EventContext, EventName, p1)
	-- upvalues: GetPlatformTargetModule (ref)
	local PlatformTargetModule = GetPlatformTargetModule()
	local P16 = p1 or {}
	assert(type(EventContext) == "string", "Expected eventContext to be a string")
	assert(type(EventName) == "string", "Expected eventName to be a string")
	assert(type(P16) == "table", "Expected additionalArgs to be a table")
	self._eventIngest:SendEventImmediately(PlatformTargetModule, EventContext, EventName, P16)
end

return EventIngestModule