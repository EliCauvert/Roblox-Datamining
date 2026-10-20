local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SocialUpsellModule = require(Parent.SocialUpsell)
local StartFacialAgeEstimationFunction = SocialUpsellModule.Thunks.startFacialAgeEstimation
local SocialUpsellType = SocialUpsellModule.Enums.SocialUpsellType
local UpsellEntrySurfaceType = SocialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType

local function _(Home)
	-- upvalues: AppPage (copy), UpsellEntrySurfaceType (copy)
	return if Home == AppPage.Home then UpsellEntrySurfaceType.Homepage elseif Home == AppPage.ProfilePlatform then UpsellEntrySurfaceType.ProfileCompletion else UpsellEntrySurfaceType.Unknown
end

local SduiActionParams = SduiCoreSystemModule.SduiActionParams
local GetStringParamFunction = SduiActionParams.getStringParam
local GetBooleanParamFunction = SduiActionParams.getBooleanParam
local GetCallbackParamFunction = SduiActionParams.getCallbackParam

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), GetStringParamFunction (copy), SocialUpsellType (copy), AppPage (copy), UpsellEntrySurfaceType (copy), GetBooleanParamFunction (copy), GetCallbackParamFunction (copy), StartFacialAgeEstimationFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenFacialAgeEstimation
		}, p2.appPage)
		
		return
	end
	local Source = ActionParams.source
	
	if Source == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: source",
			propName = "source",
			name = SduiActionType.OpenFacialAgeEstimation
		}, p2.appPage)
		
		return
	else
		p2.dependencies.dispatch(StartFacialAgeEstimationFunction(GetStringParamFunction(ActionParams, "context", SocialUpsellType.FacialAgeEstimation .. (if Source == AppPage.Home then UpsellEntrySurfaceType.Homepage elseif Source == AppPage.ProfilePlatform then UpsellEntrySurfaceType.ProfileCompletion else UpsellEntrySurfaceType.Unknown)), GetCallbackParamFunction(ActionParams, "onSuccess"), GetCallbackParamFunction(ActionParams, "onFailure"), Source, (GetBooleanParamFunction(ActionParams, "isInExperience", false))))
	end
end