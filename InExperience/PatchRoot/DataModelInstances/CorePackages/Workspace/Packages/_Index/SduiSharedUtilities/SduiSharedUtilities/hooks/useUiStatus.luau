local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local dataHydrationModule = require(parent.DataHydration)
local signalsReactModule = require(parent.SignalsReact)
local getSduiApiStoreModule = require(sduiSharedUtilities.getSduiApiStore)
local uiStatus = require(sduiSharedUtilities.SduiIntegrationTypes).UiStatus
local dataHydrationTypes = dataHydrationModule.DataHydrationTypes

return function(p1)
	-- upvalues: signalsReactModule (ref), getSduiApiStoreModule (ref), dataHydrationTypes (ref), uiStatus (ref)
	local var1 = signalsReactModule.useSignalState(getSduiApiStoreModule().getData(p1).status)
	
	return if var1 == dataHydrationTypes.DataStatus.NotReady then uiStatus.Loading elseif var1 == dataHydrationTypes.DataStatus.Failed then uiStatus.Error else uiStatus.Resolved
end