local gamepadService = game:GetService("GamepadService")
local focusOffChromeSignalModule = require(script.Parent.Parent.FocusUtils.FocusOffChromeSignal)

return function(p0) --[[ line: 8 | named "focusOffChrome" ]]
	-- upvalues: gamepadService (ref), focusOffChromeSignalModule (ref)
	if gamepadService.GamepadCursorEnabled then return end
	focusOffChromeSignalModule:fire()
	
	if p0 then
		p0()
	end
end