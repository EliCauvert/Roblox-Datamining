local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local SignalsReactModule = require(Parent.SignalsReact)
local GetSduiApiStoreModule = require(SduiSharedUtilities.getSduiApiStore)
local UiStatus = require(SduiSharedUtilities.SduiIntegrationTypes).UiStatus
local DataHydrationTypes = require(Parent.DataHydration).DataHydrationTypes

return function(p1) --[[ Line: 14 | Named "useUiStatus" ]]
	-- upvalues: SignalsReactModule (copy), GetSduiApiStoreModule (copy), DataHydrationTypes (copy), UiStatus (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetSduiApiStoreModule().getData(p1).status)
	
	return if UseSignalStateResult == DataHydrationTypes.DataStatus.NotReady then UiStatus.Loading elseif UseSignalStateResult == DataHydrationTypes.DataStatus.Failed then UiStatus.Error else UiStatus.Resolved
end