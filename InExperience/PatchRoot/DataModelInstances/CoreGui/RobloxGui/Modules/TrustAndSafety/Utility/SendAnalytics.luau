local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local eventIngestService = game:GetService("EventIngestService")
local var1 = if require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagShareGetPlatformTargetImpl() then require(corePackagesService.Workspace.Packages.Analytics).getPlatformTarget else function()
	-- upvalues: userInputService (ref)
	local var2 = "unknownLua"
	local none = Enum.Platform.None
	pcall(function()
		-- upvalues: none (write), userInputService (copy)
		none = userInputService:GetPlatform()
	end)
	local var3 = if none ~= Enum.Platform.XBox360 then none == Enum.Platform.XBoxOne else true
	
	return if if none ~= Enum.Platform.Windows then none == Enum.Platform.OSX else true then "client" elseif (if none ~= Enum.Platform.IOS then none == Enum.Platform.Android else true) or none == Enum.Platform.UWP then "mobile" elseif (var3 or (if none ~= Enum.Platform.PS3 then none == Enum.Platform.PS4 else true)) or none == Enum.Platform.WiiU then "console" else var2 .. tostring(none)
end

return function(p1, p2, p3)
	-- upvalues: var1 (write), eventIngestService (ref)
	assert(type(p1) == "string", "Expected eventContext to be a string")
	assert(type(p2) == "string", "Expected eventName to be a string")
	assert(type(p3) == "table", "Expected eventTable to be a table")
	local var2 = var1()
	
	if not p3 then
		p3 = {}
	end
	p3.universeId = tostring(game.GameId)
	eventIngestService:sendEventDeferred(var2, p1, p2, p3)
end