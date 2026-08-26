local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local signalsReactModule = require(parent.SignalsReact)
local getSduiClientPageScope = require(parent.SduiCoreSystem).getSduiClientPageScope

local var1 = function()
	return nil
end

return function(p1, p2)
	-- upvalues: getSduiClientPageScope (ref), var1 (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(if p1 and p1.configKey then getSduiClientPageScope(p1.configKey).getSignal(p2) else var1)
end