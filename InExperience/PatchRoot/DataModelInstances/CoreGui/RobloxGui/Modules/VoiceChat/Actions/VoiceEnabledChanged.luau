local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local MaybeAssertModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.Helpers.maybeAssert)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(Enabled) --[[ Line: 9 ]]
	-- upvalues: MaybeAssertModule (copy), TModule (copy)
	MaybeAssertModule(TModule.boolean(Enabled))
	
	return { enabled = Enabled }
end)