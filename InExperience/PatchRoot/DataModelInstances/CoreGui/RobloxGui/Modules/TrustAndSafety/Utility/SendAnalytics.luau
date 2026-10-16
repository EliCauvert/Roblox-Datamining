local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local EventIngestService = game:GetService("EventIngestService")
local GetPlatformTarget = nil
GetPlatformTarget = if require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagShareGetPlatformTargetImpl() then require(CorePackages.Workspace.Packages.Analytics).getPlatformTarget else function(): string --[[ Line: 12 | Named "getPlatformTarget" ]]
	-- upvalues: UserInputService (copy)
	local v1 = "unknownLua"
	local None = Enum.Platform.None
	pcall(function() --[[ Line: 18 ]]
		-- upvalues: None (ref), UserInputService (upval)
		None = UserInputService:GetPlatform()
	end)
	local IsNoneMatch: boolean = None == Enum.Platform.Windows or None == Enum.Platform.OSX
	local IsNoneMatch1: boolean = None == Enum.Platform.IOS or None == Enum.Platform.Android or None == Enum.Platform.UWP
	local IsNoneMatch2: boolean = None == Enum.Platform.XBox360 or None == Enum.Platform.XBoxOne or (None == Enum.Platform.PS3 or None == Enum.Platform.PS4) or None == Enum.Platform.WiiU
	
	return if IsNoneMatch then "client" elseif IsNoneMatch1 then "mobile" elseif IsNoneMatch2 then "console" else v1 .. tostring(None)
end

return function(p1, p2, p3) --[[ Line: 49 ]]
	-- upvalues: GetPlatformTarget (ref), EventIngestService (copy)
	assert(type(p1) == "string", "Expected eventContext to be a string")
	assert(type(p2) == "string", "Expected eventName to be a string")
	assert(type(p3) == "table", "Expected eventTable to be a table")
	local PlatformTarget = GetPlatformTarget()
	
	if not p3 then
		p3 = {}
	end
	p3.universeId = tostring(game.GameId)
	EventIngestService:sendEventDeferred(PlatformTarget, p1, p2, p3)
end