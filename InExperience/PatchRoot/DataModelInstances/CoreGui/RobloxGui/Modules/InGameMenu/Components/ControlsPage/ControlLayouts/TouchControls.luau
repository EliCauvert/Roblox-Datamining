local Roact = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Roact
local KeyboardControlsModule = require(script.Parent.KeyboardControls)

return function(p1) --[[ Line: 8 | Named "TouchControls" ]]
	-- upvalues: Roact (copy), KeyboardControlsModule (copy)
	return Roact.createElement(KeyboardControlsModule, p1)
end