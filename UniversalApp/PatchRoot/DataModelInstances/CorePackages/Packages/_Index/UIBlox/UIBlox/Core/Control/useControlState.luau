local parent = script.Parent.Parent
local reactModule = require(parent.Parent.Parent.React)
local controlStateModule = require(parent.Control.Enum.ControlState)

return function()
	-- upvalues: reactModule (ref), controlStateModule (ref)
	local var2, var3 = reactModule.useState(controlStateModule.Initialize)
	
	return var2, reactModule.useCallback(function(_, p0)
		-- upvalues: var3 (ref)
		var3(p0)
	end, {})
end