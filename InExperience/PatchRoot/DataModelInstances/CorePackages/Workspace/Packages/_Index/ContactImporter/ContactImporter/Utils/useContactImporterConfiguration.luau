local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local OffPlatformFriendRequestsIXPModule = require(Parent.Flags.OffPlatformFriendRequestsIXP)
local UseSelectorFunction = require(Parent.dependencies).useSelector
local UseSignalStateFunction = require(Parent1.SignalsReact).useSignalState
local GetContactImporterParamsModule = require(script.Parent.getContactImporterParams)
local UseUiModeInfoFunction = require(Parent1.RobloxAppHooks).useUiModeInfo
local UiMode = require(Parent1.RobloxAppEnums).UiMode
local FFlagContactImporterIXPCleanup = require(Parent1.SharedFlags).FFlagContactImporterIXPCleanup
local FFlagUseSignalsForIsLocalUserSoothsayer = require(Parent1.SharedFlags).FFlagUseSignalsForIsLocalUserSoothsayer
local GetIsLocalUserSoothsayerStore = if FFlagUseSignalsForIsLocalUserSoothsayer then require(Parent1.IsLocalUserSoothsayerStore).GetIsLocalUserSoothsayerStore else nil

return function(p1) --[[ Line: 18 ]]
	-- upvalues: FFlagUseSignalsForIsLocalUserSoothsayer (copy), UseSignalStateFunction (copy), GetIsLocalUserSoothsayerStore (copy), UseSelectorFunction (copy), GetContactImporterParamsModule (copy), FFlagContactImporterIXPCleanup (copy), OffPlatformFriendRequestsIXPModule (copy), UseUiModeInfoFunction (copy), UiMode (copy)
	local UseSignalStateResult = if FFlagUseSignalsForIsLocalUserSoothsayer then UseSignalStateFunction(GetIsLocalUserSoothsayerStore(false).getIsLocalUserSoothsayer) else UseSelectorFunction(function(p2) --[[ Line: 21 ]]
		return p2.IsLocalUserSoothsayer
	end)
	local UseSelectorResult = UseSelectorFunction(GetContactImporterParamsModule)
	local UseOffPlatformFriendRequestsEnabledResult = if FFlagContactImporterIXPCleanup then nil else OffPlatformFriendRequestsIXPModule.useOffPlatformFriendRequestsEnabled()
	local UseOffPlatformFriendRequestsEnabledResult1 = if FFlagContactImporterIXPCleanup then nil else UseOffPlatformFriendRequestsEnabledResult
	local ShouldShowContactImporterFeature = nil
	local PolicyIsEnabled = nil
	
	if not (UseUiModeInfoFunction().uiMode == UiMode.TenFoot) and UseSignalStateResult then
		PolicyIsEnabled = true
		ShouldShowContactImporterFeature = true
	else
		PolicyIsEnabled = if FFlagContactImporterIXPCleanup then p1.policyIsEnabled else UseOffPlatformFriendRequestsEnabledResult1 and p1.policyIsEnabled
		ShouldShowContactImporterFeature = UseSelectorResult.shouldShowContactImporterFeature
	end
	local ShouldShowContactImporterFeature1: boolean = PolicyIsEnabled and ShouldShowContactImporterFeature
	
	return {
		shouldFetchContactImporterData = PolicyIsEnabled or false,
		shouldShowContactImporter = ShouldShowContactImporterFeature1 or false,
		shouldShowContactImporterModal = ShouldShowContactImporterFeature1 and UseSelectorResult.shouldShowContactImporterUpsellModal or false
	}
end