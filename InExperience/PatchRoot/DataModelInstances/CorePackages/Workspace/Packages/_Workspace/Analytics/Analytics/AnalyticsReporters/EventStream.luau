local userInputService = game:GetService("UserInputService")
local var1 = if require(script:FindFirstAncestor("Analytics").Parent.SharedFlags).GetFFlagShareGetPlatformTargetImpl() then require(script.Parent.Parent.getPlatformTarget) else function()
	-- upvalues: userInputService (ref)
	local var2 = "unknownLua"
	local none = Enum.Platform.None
	pcall(function()
		-- upvalues: none (write), userInputService (copy)
		none = userInputService:GetPlatform()
	end)
	local var3 = if none ~= Enum.Platform.XBox360 then none == Enum.Platform.XBoxOne else true
	
	return if if none ~= Enum.Platform.Windows then none == Enum.Platform.OSX else true then "client" elseif (if none ~= Enum.Platform.IOS then none == Enum.Platform.Android else true) or none == Enum.Platform.UWP then "mobile" elseif (var3 or (if none ~= Enum.Platform.PS3 then if none ~= Enum.Platform.PS4 then game:GetEngineFeature("PlatformEnumPS5") and none == Enum.Platform.PS5 else true else true)) or none == Enum.Platform.WiiU then "console" else var2 .. tostring(none)
end
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local var2 = type(p1)
	assert(if var2 ~= "table" then var2 == "userdata" else true, "Unexpected value for reportingService")
	local t_1 = { _isEnabled = true, _reporter = p1 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:setEnabled(p1)
	assert(type(p1) == "boolean", "Expected isEnabled to be a boolean")
	self._isEnabled = p1
end

function t:setRBXEvent(p1, p2, p3)
	-- upvalues: var1 (write)
	local var2 = var1()
	p3 = p3 or {}
	assert(type(p1) == "string", "Expected eventContext to be a string")
	assert(type(p2) == "string", "Expected eventName to be a string")
	assert(type(p3) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:SetRBXEvent(var2, p1, p2, p3)
end

function t:setRBXEventStream(p1, p2, p3)
	-- upvalues: var1 (write)
	local var2 = var1()
	p3 = p3 or {}
	assert(type(p1) == "string", "Expected eventContext to be a string")
	assert(type(p2) == "string", "Expected eventName to be a string")
	assert(type(p3) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:SetRBXEventStream(var2, p1, p2, p3)
end

function t:releaseRBXEventStream()
	-- upvalues: var1 (write)
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:ReleaseRBXEventStream(var1())
end

function t:sendEventDeferred(p1, p2, p3)
	-- upvalues: var1 (write)
	local var2 = var1()
	p3 = p3 or {}
	assert(type(p1) == "string", "Expected eventContext to be a string")
	assert(type(p2) == "string", "Expected eventName to be a string")
	assert(type(p3) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:SendEventDeferred(var2, p1, p2, p3)
end

function t:sendEventImmediately(p1, p2, p3)
	-- upvalues: var1 (write)
	local var2 = var1()
	p3 = p3 or {}
	assert(type(p1) == "string", "Expected eventContext to be a string")
	assert(type(p2) == "string", "Expected eventName to be a string")
	assert(type(p3) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:SendEventImmediately(var2, p1, p2, p3)
end

function t:updateHeartbeatObject(p1)
	p1 = p1 or {}
	assert(type(p1) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:UpdateHeartbeatObject(p1)
end

return t