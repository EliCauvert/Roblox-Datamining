local Parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local SignalsReactModule = require(Parent.SignalsReact)
local GetSduiClientPageScopeFunction = require(Parent.SduiCoreSystem).getSduiClientPageScope

local function v2()
	return nil
end

return function(p1, p2)
	-- upvalues: GetSduiClientPageScopeFunction (copy), v2 (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState(if p1 and p1.configKey then GetSduiClientPageScopeFunction(p1.configKey).getSignal(p2) else v2)
end