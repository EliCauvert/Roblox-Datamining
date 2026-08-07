local playersService = game:GetService("Players")
local useProperty = require(game:GetService("CorePackages").Workspace.Packages.GuiObjectUtils).useProperty

return function() --[[ line: 5 | named "useLocalPlayer" ]]
	-- upvalues: useProperty (ref), playersService (ref)
	return useProperty(playersService, "LocalPlayer")
end