local isConnectDropdownEnabledModule = require(script.Parent.isConnectDropdownEnabled)
local getFFlagIsSquadEnabled = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled

return function()
	-- upvalues: isConnectDropdownEnabledModule (ref), getFFlagIsSquadEnabled (ref)
	return isConnectDropdownEnabledModule() and getFFlagIsSquadEnabled()
end