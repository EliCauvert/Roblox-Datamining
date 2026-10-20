local Roact = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Roact
local KeyboardControlsModule = require(script.Parent.KeyboardControls)

return function(p1)
	-- upvalues: Roact (copy), KeyboardControlsModule (copy)
	return Roact.createElement(KeyboardControlsModule, p1)
end