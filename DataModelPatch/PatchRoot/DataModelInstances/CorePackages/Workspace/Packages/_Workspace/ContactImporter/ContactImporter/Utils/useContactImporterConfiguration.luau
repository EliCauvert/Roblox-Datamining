local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local OffPlatformFriendRequestsIXPModule = require(Parent.Flags.OffPlatformFriendRequestsIXP)
local UseSelectorFunction = require(Parent.dependencies).useSelector
local GetContactImporterParamsModule = require(script.Parent.getContactImporterParams)
local UseUiModeInfoFunction = require(Parent1.RobloxAppHooks).useUiModeInfo
local UiMode = require(Parent1.RobloxAppEnums).UiMode
local FFlagContactImporterIXPCleanup = require(Parent1.SharedFlags).FFlagContactImporterIXPCleanup

return function(p1)
	-- upvalues: UseSelectorFunction (copy), GetContactImporterParamsModule (copy), FFlagContactImporterIXPCleanup (copy), OffPlatformFriendRequestsIXPModule (copy), UseUiModeInfoFunction (copy), UiMode (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.IsLocalUserSoothsayer
	end)
	local UseSelectorResult1 = UseSelectorFunction(GetContactImporterParamsModule)
	local UseOffPlatformFriendRequestsEnabledResult = if FFlagContactImporterIXPCleanup then nil else OffPlatformFriendRequestsIXPModule.useOffPlatformFriendRequestsEnabled()
	local UseOffPlatformFriendRequestsEnabledResult1 = if FFlagContactImporterIXPCleanup then nil else UseOffPlatformFriendRequestsEnabledResult
	local ShouldShowContactImporterFeature = nil
	local PolicyIsEnabled = nil
	
	if not (UseUiModeInfoFunction().uiMode == UiMode.TenFoot) and UseSelectorResult then
		PolicyIsEnabled = true
		ShouldShowContactImporterFeature = true
	else
		PolicyIsEnabled = if FFlagContactImporterIXPCleanup then p1.policyIsEnabled else UseOffPlatformFriendRequestsEnabledResult1 and p1.policyIsEnabled
		ShouldShowContactImporterFeature = UseSelectorResult1.shouldShowContactImporterFeature
	end
	local ShouldShowContactImporterFeature1: boolean = PolicyIsEnabled and ShouldShowContactImporterFeature
	
	return {
		shouldFetchContactImporterData = PolicyIsEnabled or false,
		shouldShowContactImporter = ShouldShowContactImporterFeature1 or false,
		shouldShowContactImporterModal = ShouldShowContactImporterFeature1 and UseSelectorResult1.shouldShowContactImporterUpsellModal or false
	}
end