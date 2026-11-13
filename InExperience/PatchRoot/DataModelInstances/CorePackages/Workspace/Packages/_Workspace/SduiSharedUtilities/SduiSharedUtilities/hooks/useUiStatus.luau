local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local DataHydrationModule = require(Parent.DataHydration)
local SignalsReactModule = require(Parent.SignalsReact)
local GetSduiApiStoreModule = require(SduiSharedUtilities.getSduiApiStore)
local UiStatus = require(SduiSharedUtilities.SduiIntegrationTypes).UiStatus
local DataHydrationTypes = DataHydrationModule.DataHydrationTypes

return function(p1)
	-- upvalues: SignalsReactModule (copy), GetSduiApiStoreModule (copy), DataHydrationTypes (copy), UiStatus (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetSduiApiStoreModule().getData(p1).status)
	
	return if UseSignalStateResult == DataHydrationTypes.DataStatus.NotReady then UiStatus.Loading elseif UseSignalStateResult == DataHydrationTypes.DataStatus.Failed then UiStatus.Error else UiStatus.Resolved
end