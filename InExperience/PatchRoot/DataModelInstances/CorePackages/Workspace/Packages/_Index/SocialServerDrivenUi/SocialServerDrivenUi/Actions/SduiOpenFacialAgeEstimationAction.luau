local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local socialUpsellModule = require(parent.SocialUpsell)
local startFacialAgeEstimation = socialUpsellModule.Thunks.startFacialAgeEstimation
local socialUpsellType = socialUpsellModule.Enums.SocialUpsellType
local upsellEntrySurfaceType = socialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), appPage (ref), socialUpsellType (ref), upsellEntrySurfaceType (ref), startFacialAgeEstimation (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenFacialAgeEstimation
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local source = var1.source
	
	if source == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: source",
			propName = "source",
			name = sduiActionType.OpenFacialAgeEstimation
		}, p2.appPage)
	end
	p2.dependencies.dispatch(startFacialAgeEstimation(if source == appPage.ProfilePlatform then socialUpsellType.FacialAgeEstimation .. upsellEntrySurfaceType.ProfileCompletion else socialUpsellType.FacialAgeEstimation .. upsellEntrySurfaceType.Unknown, nil, nil, source, false))
end