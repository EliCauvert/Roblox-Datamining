local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local SignalsReactModule = require(SduiSharedUtilities.Parent.SignalsReact)
local GetSduiApiStoreModule = require(SduiSharedUtilities.getSduiApiStore)

return function()
	-- upvalues: SignalsReactModule (copy), GetSduiApiStoreModule (copy)
	return SignalsReactModule.useSignalState(GetSduiApiStoreModule().getAccountGeneration)
end