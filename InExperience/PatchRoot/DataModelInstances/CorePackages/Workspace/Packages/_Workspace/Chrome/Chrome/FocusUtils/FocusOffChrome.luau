local GamepadService = game:GetService("GamepadService")
local FocusOffChromeSignalModule = require(script.Parent.Parent.FocusUtils.FocusOffChromeSignal)

return function(Callback: () -> ()) --[[ Line: 8 | Named "focusOffChrome" ]]
	-- upvalues: GamepadService (copy), FocusOffChromeSignalModule (copy)
	if GamepadService.GamepadCursorEnabled then return end
	FocusOffChromeSignalModule:fire()
	
	if Callback then
		Callback()
	end
end