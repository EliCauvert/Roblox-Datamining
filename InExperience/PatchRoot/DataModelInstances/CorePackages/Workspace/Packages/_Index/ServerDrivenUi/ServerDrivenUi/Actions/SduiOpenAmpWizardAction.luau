local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local openAmpWizardContainer = require(parent.AmpUpsell).OpenAmpWizardContainer
local onAmpWizardCompletionModule = require(serverDrivenUi.Actions.onAmpWizardCompletion)
local fFlagLuaAppDismissUnlockUpsell = require(parent.SharedFlags).FFlagLuaAppDismissUnlockUpsell
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

local function noopCompletion(_, _) end

return function(p0, _, p1, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagLuaAppDismissUnlockUpsell (ref), onAmpWizardCompletionModule (ref), noopCompletion (ref), openAmpWizardContainer (ref)
	local var4 = if p0 then p0.actionParams else nil
	
	if var4 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenAmpWizard
		}, p1.appPage)
		
		return
	end
	assert(var4, "actionParams must exist")
	local featureName = var4.featureName
	
	if featureName == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: featureName",
			propName = "featureName",
			name = sduiActionType.OpenAmpWizard
		}, p1.appPage)
		
		return
	end
	p1.dependencies.dispatch(openAmpWizardContainer(featureName, if fFlagLuaAppDismissUnlockUpsell then onAmpWizardCompletionModule else noopCompletion, nil, var4.entryPointEventCtx, nil, var4.nameSpace, var4.skipFacialAgeEstimationWebLinkModal))
end