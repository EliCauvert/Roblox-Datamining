local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local dataHydrationModule = require(parent.DataHydration)
local signalsReactModule = require(parent.SignalsReact)
local getSduiApiStoreModule = require(sduiSharedUtilities.getSduiApiStore)
local uiStatus = require(sduiSharedUtilities.SduiIntegrationTypes).UiStatus
local dataHydrationTypes = dataHydrationModule.DataHydrationTypes

return function(p0) --[[ line: 14 | named "useUiStatus" ]]
	-- upvalues: signalsReactModule (ref), getSduiApiStoreModule (ref), dataHydrationTypes (ref), uiStatus (ref)
	local var4 = signalsReactModule.useSignalState(getSduiApiStoreModule().getData(p0).status)
	
	return if var4 == dataHydrationTypes.DataStatus.NotReady then uiStatus.Loading elseif var4 == dataHydrationTypes.DataStatus.Failed then uiStatus.Error else uiStatus.Resolved
end