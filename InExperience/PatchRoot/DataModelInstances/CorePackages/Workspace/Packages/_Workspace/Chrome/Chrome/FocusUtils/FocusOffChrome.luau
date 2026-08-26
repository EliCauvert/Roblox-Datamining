local gamepadService = game:GetService("GamepadService")
local focusOffChromeSignalModule = require(script.Parent.Parent.FocusUtils.FocusOffChromeSignal)

return function(p1)
	-- upvalues: gamepadService (ref), focusOffChromeSignalModule (ref)
	if gamepadService.GamepadCursorEnabled then return end
	focusOffChromeSignalModule:fire()
	
	if p1 then
		p1()
	end
end