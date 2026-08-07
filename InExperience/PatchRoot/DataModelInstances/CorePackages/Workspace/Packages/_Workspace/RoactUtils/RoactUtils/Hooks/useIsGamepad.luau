local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local useExternalEventModule = require(script.Parent.useExternalEvent)
local isGamepadInputModule = require(script.Parent.Parent.isGamepadInput)

return function(p0) --[[ line: 13 | named "useIsGamepad" ]]
	-- upvalues: userInputService (ref), isGamepadInputModule (ref), reactModule (ref), useExternalEventModule (ref)
	p0 = p0 or userInputService
	
	local function wasLastInputGamepad() --[[ line: 16 ]]
		-- upvalues: p0 (ref), isGamepadInputModule (copy)
		return isGamepadInputModule(p0:GetLastInputType())
	end
	
	local var6, var7 = reactModule.useState(wasLastInputGamepad)
	useExternalEventModule(p0.LastInputTypeChanged, reactModule.useCallback(function(p1) --[[ line: 23 ]]
		-- upvalues: isGamepadInputModule (copy), var7 (ref)
		local var8 = isGamepadInputModule(p1)
		
		if var8 ~= nil then
			var7(var8)
		end
	end))
	reactModule.useEffect(function() --[[ line: 34 ]]
		-- upvalues: var7 (ref), wasLastInputGamepad (ref)
		var7(wasLastInputGamepad())
	end, {})
	
	return var6
end