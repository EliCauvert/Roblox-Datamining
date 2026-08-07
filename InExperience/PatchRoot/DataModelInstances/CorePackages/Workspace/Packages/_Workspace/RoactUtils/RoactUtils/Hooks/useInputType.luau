local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactModule = require(parent.React)
local useExternalEventModule = require(script.Parent.useExternalEvent)
local getInputGroup = require(parent.InputType).getInputGroup

return function(p0) --[[ line: 13 | named "useInputType" ]]
	-- upvalues: userInputService (ref), getInputGroup (ref), reactModule (ref), useExternalEventModule (ref)
	p0 = p0 or userInputService
	
	local function getLastInputType() --[[ line: 16 ]]
		-- upvalues: p0 (ref), getInputGroup (copy)
		return getInputGroup(p0:GetLastInputType())
	end
	
	local var5, var6 = reactModule.useState(getLastInputType)
	useExternalEventModule(p0.LastInputTypeChanged, reactModule.useCallback(function(p1) --[[ line: 23 ]]
		-- upvalues: getInputGroup (copy), var6 (ref)
		local var7 = getInputGroup(p1)
		
		if var7 ~= nil then
			var6(var7)
		end
	end))
	reactModule.useEffect(function() --[[ line: 34 ]]
		-- upvalues: var6 (ref), getLastInputType (ref)
		var6(getLastInputType())
	end, {})
	
	return var5
end