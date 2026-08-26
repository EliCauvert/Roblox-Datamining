local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.Parent.React)
local controlStateModule = require(parent_1.Core.Control.Enum.ControlState)
local useGuiControlStateModule = require(parent.Control.Hooks.useGuiControlState)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), controlStateModule (ref), useGuiControlStateModule (ref)
	local var1, var2 = reactModule.useBinding(controlStateModule.Initialize)
	local var3, _ = useGuiControlStateModule(p1, reactModule.useCallback(function(p4, p5)
		-- upvalues: var2 (ref), p2 (ref)
		var2(tostring(p5))
		
		if p2 then
			p2(p4, p5)
		end
	end, {}), p3)
	
	return var3, var1
end