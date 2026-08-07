local isNewInGameMenuEnabledModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.isNewInGameMenuEnabled)
local enabled = require(game:GetService("CorePackages").Workspace.Packages.Chrome).Enabled

return function() --[[ line: 7 ]]
	-- upvalues: enabled (ref), isNewInGameMenuEnabledModule (ref)
	return enabled() and not isNewInGameMenuEnabledModule()
end