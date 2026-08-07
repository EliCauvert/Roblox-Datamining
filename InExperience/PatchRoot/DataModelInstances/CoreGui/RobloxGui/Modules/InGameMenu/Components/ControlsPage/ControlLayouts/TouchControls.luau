local roact = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Roact
local keyboardControlsModule = require(script.Parent.KeyboardControls)

return function(p0) --[[ line: 8 | named "TouchControls" ]]
	-- upvalues: roact (ref), keyboardControlsModule (ref)
	return roact.createElement(keyboardControlsModule, p0)
end