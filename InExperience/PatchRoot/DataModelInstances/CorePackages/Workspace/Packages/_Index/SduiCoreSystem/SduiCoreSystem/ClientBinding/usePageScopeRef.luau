local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local reactModule = require(parent.React)
local getSduiClientPageScopeModule = require(sduiCoreSystem.ClientBinding.getSduiClientPageScope)
local fFlagSduiClientPageScope = require(parent.SharedFlags).FFlagSduiClientPageScope

return function(p0) --[[ line: 20 | named "usePageScopeRef" ]]
	-- upvalues: reactModule (ref), fFlagSduiClientPageScope (ref), getSduiClientPageScopeModule (ref)
	local var3 = reactModule.useRef(nil)
	
	if fFlagSduiClientPageScope and p0 and var3.current == nil then
		var3.current = getSduiClientPageScopeModule(p0)
	end
	return var3.current
end