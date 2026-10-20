local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SocialUpsellModule = require(Parent.SocialUpsell)
local StartFacialAgeEstimationFunction = SocialUpsellModule.Thunks.startFacialAgeEstimation
local SocialUpsellType = SocialUpsellModule.Enums.SocialUpsellType
local UpsellEntrySurfaceType = SocialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), AppPage (copy), SocialUpsellType (copy), UpsellEntrySurfaceType (copy), StartFacialAgeEstimationFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenFacialAgeEstimation
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local Source = ActionParams.source
	
	if Source == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: source",
			propName = "source",
			name = SduiActionType.OpenFacialAgeEstimation
		}, p2.appPage)
	end
	p2.dependencies.dispatch(StartFacialAgeEstimationFunction(if Source == AppPage.ProfilePlatform then SocialUpsellType.FacialAgeEstimation .. UpsellEntrySurfaceType.ProfileCompletion else SocialUpsellType.FacialAgeEstimation .. UpsellEntrySurfaceType.Unknown, nil, nil, Source, false))
end