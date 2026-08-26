local parent = script.Parent.Parent
local reactModule = require(parent.Parent.Parent.React)
local controlStateModule = require(parent.Control.Enum.ControlState)

return function()
	-- upvalues: reactModule (ref), controlStateModule (ref)
	local var1, var2 = reactModule.useState(controlStateModule.Initialize)
	
	return var1, reactModule.useCallback(function(_, p1)
		-- upvalues: var2 (ref)
		var2(p1)
	end, {})
end