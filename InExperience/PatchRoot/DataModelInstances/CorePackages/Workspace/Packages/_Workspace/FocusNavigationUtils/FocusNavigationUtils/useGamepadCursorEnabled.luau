local GamepadService = game:GetService("GamepadService")
local UsePropertyFunction = require(script.Parent.Parent.GuiObjectUtils).useProperty

return function()
	-- upvalues: UsePropertyFunction (copy), GamepadService (copy)
	return (UsePropertyFunction(GamepadService, "GamepadCursorEnabled"))
end