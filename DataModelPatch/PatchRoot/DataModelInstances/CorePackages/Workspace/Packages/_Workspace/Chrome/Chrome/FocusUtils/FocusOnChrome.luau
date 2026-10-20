local GamepadService = game:GetService("GamepadService")
local FocusOnChromeSignalModule = require(script.Parent.Parent.FocusUtils.FocusOnChromeSignal)

return function(Callback: () -> (), p1)
	-- upvalues: GamepadService (copy), FocusOnChromeSignalModule (copy)
	if GamepadService.GamepadCursorEnabled then return end
	if Callback then
		Callback()
	end
	FocusOnChromeSignalModule:fire(p1)
end