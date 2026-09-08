local gamepadService = game:GetService("GamepadService")
local useProperty = require(script.Parent.Parent.GuiObjectUtils).useProperty

return function()
	-- upvalues: useProperty (ref), gamepadService (ref)
	return useProperty(gamepadService, "GamepadCursorEnabled")
end