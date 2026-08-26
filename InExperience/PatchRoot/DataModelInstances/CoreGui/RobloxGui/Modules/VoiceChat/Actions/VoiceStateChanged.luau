local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local makeActionCreator = require(corePackagesService.Packages.Rodux).makeActionCreator
local tModule = require(corePackagesService.Packages.t)
local maybeAssertModule = require(robloxGui.Modules.VoiceChat.Helpers.maybeAssert)

return makeActionCreator(script.Name, function(p1, p2)
	-- upvalues: maybeAssertModule (ref), tModule (ref)
	maybeAssertModule(tonumber(p1) ~= nil)
	maybeAssertModule(tModule.string(p2))
	
	return { userId = tostring(p1), newState = p2 }
end)