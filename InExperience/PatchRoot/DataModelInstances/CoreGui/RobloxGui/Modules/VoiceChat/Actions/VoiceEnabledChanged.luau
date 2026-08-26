local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local makeActionCreator = require(corePackagesService.Packages.Rodux).makeActionCreator
local tModule = require(corePackagesService.Packages.t)
local maybeAssertModule = require(robloxGui.Modules.VoiceChat.Helpers.maybeAssert)

return makeActionCreator(script.Name, function(p1)
	-- upvalues: maybeAssertModule (ref), tModule (ref)
	maybeAssertModule(tModule.boolean(p1))
	
	return { enabled = p1 }
end)