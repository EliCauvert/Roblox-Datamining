local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local UseExternalEventModule = require(script.Parent.useExternalEvent)
local IsGamepadInputModule = require(script.Parent.Parent.isGamepadInput)

return function(p1) --[[ Line: 13 | Named "useIsGamepad" ]]
	-- upvalues: UserInputService (copy), IsGamepadInputModule (copy), ReactModule (copy), UseExternalEventModule (copy)
	local P0 = p1 or UserInputService
	
	local function wasLastInputGamepad() --[[ Line: 16 ]]
		-- upvalues: P0 (copy), IsGamepadInputModule (upval)
		return IsGamepadInputModule((P0:GetLastInputType()))
	end
	
	local UseStateResult, UseStateResult2 = ReactModule.useState(wasLastInputGamepad)
	UseExternalEventModule(P0.LastInputTypeChanged, (ReactModule.useCallback(function(p2) --[[ Line: 23 ]]
		-- upvalues: IsGamepadInputModule (upval), UseStateResult2 (copy)
		local IsGamepadInputModule1 = IsGamepadInputModule(p2)
		
		if IsGamepadInputModule1 ~= nil then
			UseStateResult2(IsGamepadInputModule1)
		end
	end)))
	ReactModule.useEffect(function() --[[ Line: 34 ]]
		-- upvalues: UseStateResult2 (copy), wasLastInputGamepad (copy)
		UseStateResult2(wasLastInputGamepad())
	end, {})
	
	return UseStateResult
end