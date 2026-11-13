local CorePackages = game:GetService("CorePackages")
local MakeActionCreatorFunction = require(CorePackages.Packages.Rodux).makeActionCreator
local TModule = require(CorePackages.Packages.t)
local MaybeAssertModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.Helpers.maybeAssert)

return MakeActionCreatorFunction(script.Name, function(Enabled)
	-- upvalues: MaybeAssertModule (copy), TModule (copy)
	MaybeAssertModule(TModule.boolean(Enabled))
	
	return { enabled = Enabled }
end)