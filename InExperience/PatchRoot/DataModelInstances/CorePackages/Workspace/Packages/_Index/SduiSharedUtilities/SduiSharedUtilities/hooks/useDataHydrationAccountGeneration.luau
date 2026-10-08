local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local signalsReactModule = require(sduiSharedUtilities.Parent.SignalsReact)
local getSduiApiStoreModule = require(sduiSharedUtilities.getSduiApiStore)

return function()
	-- upvalues: signalsReactModule (ref), getSduiApiStoreModule (ref)
	return signalsReactModule.useSignalState(getSduiApiStoreModule().getAccountGeneration)
end