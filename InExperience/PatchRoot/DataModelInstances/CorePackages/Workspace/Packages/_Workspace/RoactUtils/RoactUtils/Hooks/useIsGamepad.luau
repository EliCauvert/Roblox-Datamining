local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local useExternalEventModule = require(script.Parent.useExternalEvent)
local isGamepadInputModule = require(script.Parent.Parent.isGamepadInput)

return function(p1)
	-- upvalues: userInputService (ref), isGamepadInputModule (ref), reactModule (ref), useExternalEventModule (ref)
	p1 = p1 or userInputService
	
	local function wasLastInputGamepad()
		-- upvalues: p1 (ref), isGamepadInputModule (copy)
		return isGamepadInputModule(p1:GetLastInputType())
	end
	
	local var1, var2 = reactModule.useState(wasLastInputGamepad)
	useExternalEventModule(p1.LastInputTypeChanged, reactModule.useCallback(function(p2)
		-- upvalues: isGamepadInputModule (copy), var2 (ref)
		local var3 = isGamepadInputModule(p2)
		
		if var3 ~= nil then
			var2(var3)
		end
	end))
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), wasLastInputGamepad (ref)
		var2(wasLastInputGamepad())
	end, {})
	
	return var1
end