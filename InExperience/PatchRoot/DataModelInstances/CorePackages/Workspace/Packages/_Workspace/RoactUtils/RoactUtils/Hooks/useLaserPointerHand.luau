local VRService = game:GetService("VRService")
local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local useExternalEventModule = require(script.Parent.useExternalEvent)
local _ = { Right = "Right", Left = "Left" }

return function()
	-- upvalues: reactModule (ref), useExternalEventModule (ref), VRService (ref)
	local right, right_1 = reactModule.useState("Right")
	useExternalEventModule(VRService.LaserPointerTriggered, reactModule.useCallback(function(p0)
		-- upvalues: right (ref), right_1 (ref)
		if (p0.KeyCode == Enum.KeyCode.ButtonR1 or p0.KeyCode == Enum.KeyCode.ButtonR2 or (p0.KeyCode == Enum.KeyCode.ButtonR3 or p0.KeyCode == Enum.KeyCode.ButtonA) or p0.KeyCode == Enum.KeyCode.ButtonB) and right ~= "Right" then
			right_1("Right")
			
			return
		elseif (p0.KeyCode == Enum.KeyCode.ButtonL1 or p0.KeyCode == Enum.KeyCode.ButtonL2 or (p0.KeyCode == Enum.KeyCode.ButtonL3 or p0.KeyCode == Enum.KeyCode.ButtonX) or p0.KeyCode == Enum.KeyCode.ButtonY) and right ~= "Left" then
			right_1("Left")
		end
	end))
	
	return right
end