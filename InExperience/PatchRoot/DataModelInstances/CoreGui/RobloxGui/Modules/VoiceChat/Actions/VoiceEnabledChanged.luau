local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local makeActionCreator = require(corePackagesService.Packages.Rodux).makeActionCreator
local tModule = require(corePackagesService.Packages.t)
local maybeAssertModule = require(robloxGui.Modules.VoiceChat.Helpers.maybeAssert)

return makeActionCreator(script.Name, function(p0) --[[ line: 9 ]]
	-- upvalues: maybeAssertModule (ref), tModule (ref)
	maybeAssertModule(tModule.boolean(p0))
	
	return { enabled = p0 }
end)