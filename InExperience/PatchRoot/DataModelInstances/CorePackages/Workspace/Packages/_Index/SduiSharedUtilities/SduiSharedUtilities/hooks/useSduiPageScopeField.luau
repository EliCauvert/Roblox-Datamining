local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local signalsReactModule = require(parent.SignalsReact)
local getSduiClientPageScope = require(parent.SduiCoreSystem).getSduiClientPageScope

local var1 = function() --[[ line: 7 ]]
	return nil
end

return function(p0, p1) --[[ line: 11 | named "useSduiPageScopeField" ]]
	-- upvalues: getSduiClientPageScope (ref), var1 (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(if p0 and p0.configKey then getSduiClientPageScope(p0.configKey).getSignal(p1) else var1)
end