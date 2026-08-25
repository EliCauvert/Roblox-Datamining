local constantsModule = require(script.Parent.Parent.TopBar.Constants)
local createLayoutValues = require(game:GetService("CorePackages").Workspace.Packages.PlayerList).Common.CreateLayoutValues

return function(p0)
	-- upvalues: createLayoutValues (ref), constantsModule (ref)
	return createLayoutValues(p0, constantsModule)
end