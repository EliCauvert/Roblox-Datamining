local gamepadService = game:GetService("GamepadService")
local focusOnChromeSignalModule = require(script.Parent.Parent.FocusUtils.FocusOnChromeSignal)

return function(p1, p2)
	-- upvalues: gamepadService (ref), focusOnChromeSignalModule (ref)
	if gamepadService.GamepadCursorEnabled then return end
	if p1 then
		p1()
	end
	focusOnChromeSignalModule:fire(p2)
end