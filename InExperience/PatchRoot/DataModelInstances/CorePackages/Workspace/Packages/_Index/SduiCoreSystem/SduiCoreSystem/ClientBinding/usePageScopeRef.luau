local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local reactModule = require(sduiCoreSystem.Parent.React)
local getSduiClientPageScopeModule = require(sduiCoreSystem.ClientBinding.getSduiClientPageScope)

return function(p1)
	-- upvalues: reactModule (ref), getSduiClientPageScopeModule (ref)
	local var1 = reactModule.useRef(nil)
	
	if p1 and var1.current == nil then
		var1.current = getSduiClientPageScopeModule(p1)
	end
	return var1.current
end