local ConstantsModule = require(script.Parent.Parent.TopBar.Constants)
local CreateLayoutValuesFunction = require(game:GetService("CorePackages").Workspace.Packages.PlayerList).Common.CreateLayoutValues

return function(p1)
	-- upvalues: CreateLayoutValuesFunction (copy), ConstantsModule (copy)
	return CreateLayoutValuesFunction(p1, ConstantsModule)
end