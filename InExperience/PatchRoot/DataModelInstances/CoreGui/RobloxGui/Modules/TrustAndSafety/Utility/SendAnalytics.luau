local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local eventIngestService = game:GetService("EventIngestService")
local var3 = if require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagShareGetPlatformTargetImpl() then require(corePackagesService.Workspace.Packages.Analytics).getPlatformTarget else function() --[[ line: 12 | named "getPlatformTarget" ]]
	-- upvalues: userInputService (ref)
	local var4 = "unknownLua"
	local none = Enum.Platform.None
	pcall(function() --[[ line: 18 ]]
		-- upvalues: none (write), userInputService (copy)
		none = userInputService:GetPlatform()
	end)
	local var5 = if none ~= Enum.Platform.XBox360 then none == Enum.Platform.XBoxOne else true
	
	return if if none ~= Enum.Platform.Windows then none == Enum.Platform.OSX else true then "client" elseif (if none ~= Enum.Platform.IOS then none == Enum.Platform.Android else true) or none == Enum.Platform.UWP then "mobile" elseif (var5 or (if none ~= Enum.Platform.PS3 then none == Enum.Platform.PS4 else true)) or none == Enum.Platform.WiiU then "console" else var4 .. tostring(none)
end

return function(p0, p1, p2) --[[ line: 49 ]]
	-- upvalues: var3 (write), eventIngestService (ref)
	assert(type(p0) == "string", "Expected eventContext to be a string")
	assert(type(p1) == "string", "Expected eventName to be a string")
	assert(type(p2) == "table", "Expected eventTable to be a table")
	local var6 = var3()
	
	if not p2 then
		p2 = {}
	end
	p2.universeId = tostring(game.GameId)
	eventIngestService:sendEventDeferred(var6, p0, p1, p2)
end