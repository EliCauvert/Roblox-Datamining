local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local makeActionCreator = require(corePackagesService.Packages.Rodux).makeActionCreator
local _ = require(corePackagesService.Packages.t)
local maybeAssertModule = require(robloxGui.Modules.VoiceChat.Helpers.maybeAssert)

return makeActionCreator(script.Name, function(p0)
	-- upvalues: maybeAssertModule (ref)
	maybeAssertModule(tonumber(p0) ~= nil)
	
	return { userId = tostring(p0) }
end)