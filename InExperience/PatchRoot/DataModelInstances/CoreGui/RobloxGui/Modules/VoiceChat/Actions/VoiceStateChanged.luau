local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local makeActionCreator = require(corePackagesService.Packages.Rodux).makeActionCreator
local tModule = require(corePackagesService.Packages.t)
local maybeAssertModule = require(robloxGui.Modules.VoiceChat.Helpers.maybeAssert)

return makeActionCreator(script.Name, function(p0, p1)
	-- upvalues: maybeAssertModule (ref), tModule (ref)
	maybeAssertModule(tonumber(p0) ~= nil)
	maybeAssertModule(tModule.string(p1))
	
	return { userId = tostring(p0), newState = p1 }
end)