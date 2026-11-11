local Players = game:GetService("Players")
local UsePropertyFunction = require(game:GetService("CorePackages").Workspace.Packages.GuiObjectUtils).useProperty

return function()
	-- upvalues: UsePropertyFunction (copy), Players (copy)
	return UsePropertyFunction(Players, "LocalPlayer")
end