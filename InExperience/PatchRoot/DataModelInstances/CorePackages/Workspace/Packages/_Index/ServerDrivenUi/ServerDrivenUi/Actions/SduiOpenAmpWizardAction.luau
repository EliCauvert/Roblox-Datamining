local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local OpenAmpWizardContainerFunction = require(Parent.AmpUpsell).OpenAmpWizardContainer
local OnAmpWizardCompletionModule = require(ServerDrivenUi.Actions.onAmpWizardCompletion)
local FFlagLuaAppDismissUnlockUpsell = require(Parent.SharedFlags).FFlagLuaAppDismissUnlockUpsell
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType

local function noopCompletion(_, _) --[[ Line: 15 ]] end

return function(p1, _, p2, _) --[[ Line: 30 ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), FFlagLuaAppDismissUnlockUpsell (copy), OnAmpWizardCompletionModule (copy), noopCompletion (copy), OpenAmpWizardContainerFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenAmpWizard
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local FeatureName = ActionParams.featureName
	
	if FeatureName == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: featureName",
			propName = "featureName",
			name = SduiActionType.OpenAmpWizard
		}, p2.appPage)
		
		return
	else
		p2.dependencies.dispatch(OpenAmpWizardContainerFunction(FeatureName, if FFlagLuaAppDismissUnlockUpsell then OnAmpWizardCompletionModule else noopCompletion, nil, ActionParams.entryPointEventCtx, nil, ActionParams.nameSpace, ActionParams.skipFacialAgeEstimationWebLinkModal))
	end
end