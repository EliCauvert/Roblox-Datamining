local analytics = script:FindFirstAncestor("Analytics")
local userInputService = game:GetService("UserInputService")
local var2 = if require(analytics.Parent.SharedFlags).GetFFlagShareGetPlatformTargetImpl() then require(analytics.getPlatformTarget) else function()
	-- upvalues: userInputService (ref)
	local var4 = "unknownLua"
	local none = Enum.Platform.None
	pcall(function()
		-- upvalues: none (write), userInputService (copy)
		none = userInputService:GetPlatform()
	end)
	local var5 = if none ~= Enum.Platform.XBox360 then none == Enum.Platform.XBoxOne else true
	
	return if if none ~= Enum.Platform.Windows then none == Enum.Platform.OSX else true then "client" elseif (if none ~= Enum.Platform.IOS then none == Enum.Platform.Android else true) or none == Enum.Platform.UWP then "mobile" elseif (var5 or (if none ~= Enum.Platform.PS3 then if none ~= Enum.Platform.PS4 then game:GetEngineFeature("PlatformEnumPS5") and none == Enum.Platform.PS5 else true else true)) or none == Enum.Platform.WiiU then "console" else var4 .. tostring(none)
end
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref)
	local var6 = type(p0)
	assert(if var6 ~= "table" then var6 == "userdata" else true, "Unexpected value for eventIngestService")
	local t_1 = { _eventIngest = p0 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:setRBXEvent(p1, p2, p3)
	-- upvalues: var2 (write)
	local var8 = var2()
	p3 = p3 or {}
	assert(type(p1) == "string", "Expected eventContext to be a string")
	assert(type(p2) == "string", "Expected eventName to be a string")
	assert(type(p3) == "table", "Expected additionalArgs to be a table")
	self._eventIngest:SetRBXEvent(var8, p1, p2, p3)
end

function t:setRBXEventStream(p4, p5, p6)
	-- upvalues: var2 (write)
	local var10 = var2()
	p6 = p6 or {}
	assert(type(p4) == "string", "Expected eventContext to be a string")
	assert(type(p5) == "string", "Expected eventName to be a string")
	assert(type(p6) == "table", "Expected additionalArgs to be a table")
	self._eventIngest:SetRBXEventStream(var10, p4, p5, p6)
end

function t:sendEventDeferred(p7, p8, p9)
	-- upvalues: var2 (write)
	local var12 = var2()
	p9 = p9 or {}
	assert(type(p7) == "string", "Expected eventContext to be a string")
	assert(type(p8) == "string", "Expected eventName to be a string")
	assert(type(p9) == "table", "Expected additionalArgs to be a table")
	self._eventIngest:SendEventDeferred(var12, p7, p8, p9)
end

function t:sendEventImmediately(p10, p11, p12)
	-- upvalues: var2 (write)
	local var14 = var2()
	p12 = p12 or {}
	assert(type(p10) == "string", "Expected eventContext to be a string")
	assert(type(p11) == "string", "Expected eventName to be a string")
	assert(type(p12) == "table", "Expected additionalArgs to be a table")
	self._eventIngest:SendEventImmediately(var14, p10, p11, p12)
end

return t