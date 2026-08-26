local roact = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Roact
local keyboardControlsModule = require(script.Parent.KeyboardControls)

return function(p1)
	-- upvalues: roact (ref), keyboardControlsModule (ref)
	return roact.createElement(keyboardControlsModule, p1)
end