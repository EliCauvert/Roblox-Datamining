local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Packages.t)
local MaybeAssertModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.Helpers.maybeAssert)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(p1) --[[ Line: 9 ]]
	-- upvalues: MaybeAssertModule (copy)
	MaybeAssertModule(tonumber(p1) ~= nil)
	
	return { userId = tostring(p1) }
end)