local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local openAmpWizardContainer = require(parent.AmpUpsell).OpenAmpWizardContainer
local onAmpWizardCompletionModule = require(serverDrivenUi.Actions.onAmpWizardCompletion)
local fFlagLuaAppDismissUnlockUpsell = require(parent.SharedFlags).FFlagLuaAppDismissUnlockUpsell
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

local function noopCompletion(_, _) end

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagLuaAppDismissUnlockUpsell (ref), onAmpWizardCompletionModule (ref), noopCompletion (ref), openAmpWizardContainer (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenAmpWizard
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local featureName = var1.featureName
	
	if featureName == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: featureName",
			propName = "featureName",
			name = sduiActionType.OpenAmpWizard
		}, p2.appPage)
		
		return
	end
	p2.dependencies.dispatch(openAmpWizardContainer(featureName, if fFlagLuaAppDismissUnlockUpsell then onAmpWizardCompletionModule else noopCompletion, nil, var1.entryPointEventCtx, nil, var1.nameSpace, var1.skipFacialAgeEstimationWebLinkModal))
end