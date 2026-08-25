local gamepadService = game:GetService("GamepadService")
local focusOnChromeSignalModule = require(script.Parent.Parent.FocusUtils.FocusOnChromeSignal)

return function(p0, p1)
	-- upvalues: gamepadService (ref), focusOnChromeSignalModule (ref)
	if gamepadService.GamepadCursorEnabled then return end
	if p0 then
		p0()
	end
	focusOnChromeSignalModule:fire(p1)
end