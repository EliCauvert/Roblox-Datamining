local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local reactModule = require(parent.React)
local getSduiClientPageScopeModule = require(sduiCoreSystem.ClientBinding.getSduiClientPageScope)
local fFlagSduiClientPageScope = require(parent.SharedFlags).FFlagSduiClientPageScope

return function(p1)
	-- upvalues: reactModule (ref), fFlagSduiClientPageScope (ref), getSduiClientPageScopeModule (ref)
	local var1 = reactModule.useRef(nil)
	
	if fFlagSduiClientPageScope and p1 and var1.current == nil then
		var1.current = getSduiClientPageScopeModule(p1)
	end
	return var1.current
end