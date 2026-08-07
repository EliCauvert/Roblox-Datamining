local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local socialUpsellModule = require(parent.SocialUpsell)
local startFacialAgeEstimation = socialUpsellModule.Thunks.startFacialAgeEstimation
local socialUpsellType = socialUpsellModule.Enums.SocialUpsellType
local upsellEntrySurfaceType = socialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

return function(p0, _, p1, _) --[[ line: 19 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), appPage (ref), socialUpsellType (ref), upsellEntrySurfaceType (ref), startFacialAgeEstimation (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenFacialAgeEstimation
		}, p1.appPage)
		
		return
	end
	assert(var2, "actionParams must exist")
	local source = var2.source
	
	if source == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: source",
			propName = "source",
			name = sduiActionType.OpenFacialAgeEstimation
		}, p1.appPage)
	end
	p1.dependencies.dispatch(startFacialAgeEstimation(if source == appPage.ProfilePlatform then socialUpsellType.FacialAgeEstimation .. upsellEntrySurfaceType.ProfileCompletion else socialUpsellType.FacialAgeEstimation .. upsellEntrySurfaceType.Unknown, nil, nil, source, false))
end