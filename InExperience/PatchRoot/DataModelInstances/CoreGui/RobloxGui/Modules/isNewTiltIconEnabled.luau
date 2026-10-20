local IsNewInGameMenuEnabledModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.isNewInGameMenuEnabled)
local EnabledFunction = require(game:GetService("CorePackages").Workspace.Packages.Chrome).Enabled

return function(): boolean
	-- upvalues: EnabledFunction (copy), IsNewInGameMenuEnabledModule (copy)
	return EnabledFunction() and not IsNewInGameMenuEnabledModule()
end