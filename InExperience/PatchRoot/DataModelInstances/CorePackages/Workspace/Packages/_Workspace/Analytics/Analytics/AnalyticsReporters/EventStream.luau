local userInputService = game:GetService("UserInputService")
local var1 = if require(script:FindFirstAncestor("Analytics").Parent.SharedFlags).GetFFlagShareGetPlatformTargetImpl() then require(script.Parent.Parent.getPlatformTarget) else function()
	-- upvalues: userInputService (ref)
	local var3 = "unknownLua"
	local none = Enum.Platform.None
	pcall(function()
		-- upvalues: none (write), userInputService (copy)
		none = userInputService:GetPlatform()
	end)
	local var4 = if none ~= Enum.Platform.XBox360 then none == Enum.Platform.XBoxOne else true
	
	return if if none ~= Enum.Platform.Windows then none == Enum.Platform.OSX else true then "client" elseif (if none ~= Enum.Platform.IOS then none == Enum.Platform.Android else true) or none == Enum.Platform.UWP then "mobile" elseif (var4 or (if none ~= Enum.Platform.PS3 then if none ~= Enum.Platform.PS4 then game:GetEngineFeature("PlatformEnumPS5") and none == Enum.Platform.PS5 else true else true)) or none == Enum.Platform.WiiU then "console" else var3 .. tostring(none)
end
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref)
	local var5 = type(p0)
	assert(if var5 ~= "table" then var5 == "userdata" else true, "Unexpected value for reportingService")
	local t_1 = { _isEnabled = true, _reporter = p0 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:setEnabled(p1)
	assert(type(p1) == "boolean", "Expected isEnabled to be a boolean")
	self._isEnabled = p1
end

function t:setRBXEvent(p2, p3, p4)
	-- upvalues: var1 (write)
	local var7 = var1()
	p4 = p4 or {}
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(p3) == "string", "Expected eventName to be a string")
	assert(type(p4) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:SetRBXEvent(var7, p2, p3, p4)
end

function t:setRBXEventStream(p5, p6, p7)
	-- upvalues: var1 (write)
	local var9 = var1()
	p7 = p7 or {}
	assert(type(p5) == "string", "Expected eventContext to be a string")
	assert(type(p6) == "string", "Expected eventName to be a string")
	assert(type(p7) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:SetRBXEventStream(var9, p5, p6, p7)
end

function t:releaseRBXEventStream()
	-- upvalues: var1 (write)
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:ReleaseRBXEventStream(var1())
end

function t:sendEventDeferred(p8, p9, p10)
	-- upvalues: var1 (write)
	local var11 = var1()
	p10 = p10 or {}
	assert(type(p8) == "string", "Expected eventContext to be a string")
	assert(type(p9) == "string", "Expected eventName to be a string")
	assert(type(p10) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:SendEventDeferred(var11, p8, p9, p10)
end

function t:sendEventImmediately(p11, p12, p13)
	-- upvalues: var1 (write)
	local var13 = var1()
	p13 = p13 or {}
	assert(type(p11) == "string", "Expected eventContext to be a string")
	assert(type(p12) == "string", "Expected eventName to be a string")
	assert(type(p13) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:SendEventImmediately(var13, p11, p12, p13)
end

function t:updateHeartbeatObject(p14)
	p14 = p14 or {}
	assert(type(p14) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:UpdateHeartbeatObject(p14)
end

return t