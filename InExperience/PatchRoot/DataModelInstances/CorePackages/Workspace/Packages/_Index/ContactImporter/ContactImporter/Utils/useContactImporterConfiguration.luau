local parent = script.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local parent_1 = parent.Parent
local offPlatformFriendRequestsIXPModule = require(parent.Flags.OffPlatformFriendRequestsIXP)
local useSelector = dependenciesModule.useSelector
local useSignalState = require(parent_1.SignalsReact).useSignalState
local getContactImporterParamsModule = require(script.Parent.getContactImporterParams)
local useUiModeInfo = require(parent_1.RobloxAppHooks).useUiModeInfo
local uiMode = require(parent_1.RobloxAppEnums).UiMode
local fFlagContactImporterIXPCleanup = require(parent_1.SharedFlags).FFlagContactImporterIXPCleanup
local fFlagUseSignalsForIsLocalUserSoothsayer = require(parent_1.SharedFlags).FFlagUseSignalsForIsLocalUserSoothsayer
local var3 = if fFlagUseSignalsForIsLocalUserSoothsayer then require(parent_1.IsLocalUserSoothsayerStore).GetIsLocalUserSoothsayerStore else nil

return function(p0) --[[ line: 18 ]]
	-- upvalues: fFlagUseSignalsForIsLocalUserSoothsayer (ref), useSignalState (ref), var3 (ref), useSelector (ref), getContactImporterParamsModule (ref), fFlagContactImporterIXPCleanup (ref), offPlatformFriendRequestsIXPModule (ref), useUiModeInfo (ref), uiMode (ref)
	local var7, shouldShowContactImporterFeature
	local var4 = useSelector(getContactImporterParamsModule)
	local var5 = not (useUiModeInfo().uiMode == uiMode.TenFoot) and (if fFlagUseSignalsForIsLocalUserSoothsayer then useSignalState(var3(false).getIsLocalUserSoothsayer) else useSelector(function(p1) --[[ line: 21 ]]
		return p1.IsLocalUserSoothsayer
	end))
	local var6 = if fFlagContactImporterIXPCleanup then nil elseif fFlagContactImporterIXPCleanup then nil else offPlatformFriendRequestsIXPModule.useOffPlatformFriendRequestsEnabled()
	local _ = nil
	local _ = nil
	
	if var5 then
		var7 = true
		shouldShowContactImporterFeature = true
	else
		var7 = if fFlagContactImporterIXPCleanup then p0.policyIsEnabled else var6 and p0.policyIsEnabled
		shouldShowContactImporterFeature = var4.shouldShowContactImporterFeature
	end
	local shouldShowContactImporterFeature_1 = var7 and shouldShowContactImporterFeature
	
	return {
		shouldFetchContactImporterData = var7 or false,
		shouldShowContactImporter = shouldShowContactImporterFeature_1 or false,
		shouldShowContactImporterModal = shouldShowContactImporterFeature_1 and var4.shouldShowContactImporterUpsellModal or false
	}
end