local IsConnectDropdownEnabledModule = require(script.Parent.isConnectDropdownEnabled)
local GetFFlagIsSquadEnabledFunction = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled

return function() --[[ Line: 6 ]]
	-- upvalues: IsConnectDropdownEnabledModule (copy), GetFFlagIsSquadEnabledFunction (copy)
	return IsConnectDropdownEnabledModule() and GetFFlagIsSquadEnabledFunction()
end