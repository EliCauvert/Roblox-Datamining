local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local MaybeAssertModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.Helpers.maybeAssert)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(p1, NewState)
	-- upvalues: MaybeAssertModule (copy), TModule (copy)
	MaybeAssertModule(tonumber(p1) ~= nil)
	MaybeAssertModule(TModule.string(NewState))
	
	return { userId = tostring(p1), newState = NewState }
end)