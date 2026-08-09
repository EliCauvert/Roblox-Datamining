local parent = script.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local parent_1 = parent.Parent
local offPlatformFriendRequestsIXPModule = require(parent.Flags.OffPlatformFriendRequestsIXP)
local useSelector = dependenciesModule.useSelector
local getContactImporterParamsModule = require(script.Parent.getContactImporterParams)
local useUiModeInfo = require(parent_1.RobloxAppHooks).useUiModeInfo
local uiMode = require(parent_1.RobloxAppEnums).UiMode
local fFlagContactImporterIXPCleanup = require(parent_1.SharedFlags).FFlagContactImporterIXPCleanup

return function(p0) --[[ line: 13 ]]
	-- upvalues: useSelector (ref), getContactImporterParamsModule (ref), fFlagContactImporterIXPCleanup (ref), offPlatformFriendRequestsIXPModule (ref), useUiModeInfo (ref), uiMode (ref)
	local var6, shouldShowContactImporterFeature
	local var3 = useSelector(getContactImporterParamsModule)
	local var4 = not (useUiModeInfo().uiMode == uiMode.TenFoot) and useSelector(function(p1) --[[ line: 14 ]]
		return p1.IsLocalUserSoothsayer
	end)
	local var5 = if fFlagContactImporterIXPCleanup then nil elseif fFlagContactImporterIXPCleanup then nil else offPlatformFriendRequestsIXPModule.useOffPlatformFriendRequestsEnabled()
	local _ = nil
	local _ = nil
	
	if var4 then
		var6 = true
		shouldShowContactImporterFeature = true
	else
		var6 = if fFlagContactImporterIXPCleanup then p0.policyIsEnabled else var5 and p0.policyIsEnabled
		shouldShowContactImporterFeature = var3.shouldShowContactImporterFeature
	end
	local shouldShowContactImporterFeature_1 = var6 and shouldShowContactImporterFeature
	
	return {
		shouldFetchContactImporterData = var6 or false,
		shouldShowContactImporter = shouldShowContactImporterFeature_1 or false,
		shouldShowContactImporterModal = shouldShowContactImporterFeature_1 and var3.shouldShowContactImporterUpsellModal or false
	}
end