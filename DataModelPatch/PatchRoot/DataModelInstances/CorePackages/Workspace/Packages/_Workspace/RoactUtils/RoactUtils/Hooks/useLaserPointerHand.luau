local VRService = game:GetService("VRService")
local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local UseExternalEventModule = require(script.Parent.useExternalEvent)

return function()
	-- upvalues: ReactModule (copy), UseExternalEventModule (copy), VRService (copy)
	local Right, Right2 = ReactModule.useState("Right")
	UseExternalEventModule(VRService.LaserPointerTriggered, (ReactModule.useCallback(function(Input)
		-- upvalues: Right (copy), Right2 (copy)
		if (Input.KeyCode == Enum.KeyCode.ButtonR1 or Input.KeyCode == Enum.KeyCode.ButtonR2 or Input.KeyCode == Enum.KeyCode.ButtonR3 or Input.KeyCode == Enum.KeyCode.ButtonA or Input.KeyCode == Enum.KeyCode.ButtonB) and Right ~= "Right" then
			Right2("Right")
			
			return
		end
		if (Input.KeyCode == Enum.KeyCode.ButtonL1 or Input.KeyCode == Enum.KeyCode.ButtonL2 or Input.KeyCode == Enum.KeyCode.ButtonL3 or Input.KeyCode == Enum.KeyCode.ButtonX or Input.KeyCode == Enum.KeyCode.ButtonY) and Right ~= "Left" then
			Right2("Left")
		end
	end)))
	
	return Right
end