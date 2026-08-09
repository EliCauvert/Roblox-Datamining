local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local socialUpsellModule = require(parent.SocialUpsell)
local startFacialAgeEstimation = socialUpsellModule.Thunks.startFacialAgeEstimation
local socialUpsellType = socialUpsellModule.Enums.SocialUpsellType
local upsellEntrySurfaceType = socialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

local function _(p0) --[[ line: 19 | named "getEntrySurface" ]]
	-- upvalues: appPage (ref), upsellEntrySurfaceType (ref)
	return if p0 == appPage.Home then upsellEntrySurfaceType.Homepage elseif p0 == appPage.ProfilePlatform then upsellEntrySurfaceType.ProfileCompletion else upsellEntrySurfaceType.Unknown
end

local sduiActionParams = sduiCoreSystemModule.SduiActionParams
local getStringParam = sduiActionParams.getStringParam
local getBooleanParam = sduiActionParams.getBooleanParam
local getCallbackParam = sduiActionParams.getCallbackParam

return function(p1, _, p2, _) --[[ line: 36 | named "SduiOpenFacialAgeEstimationAction" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), getStringParam (ref), socialUpsellType (ref), appPage (ref), upsellEntrySurfaceType (ref), getBooleanParam (ref), getCallbackParam (ref), startFacialAgeEstimation (ref)
	local var2 = if p1 then p1.actionParams else nil
	
	if var2 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenFacialAgeEstimation
		}, p2.appPage)
		
		return
	end
	local source = var2.source
	
	if source == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: source",
			propName = "source",
			name = sduiActionType.OpenFacialAgeEstimation
		}, p2.appPage)
		
		return
	end
	p2.dependencies.dispatch(startFacialAgeEstimation(getStringParam(var2, "context", socialUpsellType.FacialAgeEstimation .. (if source == appPage.Home then upsellEntrySurfaceType.Homepage elseif source == appPage.ProfilePlatform then upsellEntrySurfaceType.ProfileCompletion else upsellEntrySurfaceType.Unknown)), getCallbackParam(var2, "onSuccess"), getCallbackParam(var2, "onFailure"), source, getBooleanParam(var2, "isInExperience", false)))
end