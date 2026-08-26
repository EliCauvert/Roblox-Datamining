local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactModule = require(parent.React)
local useExternalEventModule = require(script.Parent.useExternalEvent)
local getInputGroup = require(parent.InputType).getInputGroup

return function(p1)
	-- upvalues: userInputService (ref), getInputGroup (ref), reactModule (ref), useExternalEventModule (ref)
	p1 = p1 or userInputService
	
	local function getLastInputType()
		-- upvalues: p1 (ref), getInputGroup (copy)
		return getInputGroup(p1:GetLastInputType())
	end
	
	local var1, var2 = reactModule.useState(getLastInputType)
	useExternalEventModule(p1.LastInputTypeChanged, reactModule.useCallback(function(p2)
		-- upvalues: getInputGroup (copy), var2 (ref)
		local var3 = getInputGroup(p2)
		
		if var3 ~= nil then
			var2(var3)
		end
	end))
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), getLastInputType (ref)
		var2(getLastInputType())
	end, {})
	
	return var1
end