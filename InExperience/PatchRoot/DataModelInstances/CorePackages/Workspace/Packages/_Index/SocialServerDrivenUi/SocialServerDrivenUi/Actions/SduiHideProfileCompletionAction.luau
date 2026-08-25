local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local createProfileCompletionPromptsConfig = require(parent.ProfilePlatformCommon).Utils.createProfileCompletionPromptsConfig
local serverTriggeredModalsModule = require(parent.ServerTriggeredModals)
local fetchPrompts = serverTriggeredModalsModule.fetchPrompts
local reportPromptImpression = serverTriggeredModalsModule.reportPromptImpression
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage

return function(p0, _, p1, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), reportPromptImpression (ref), fetchPrompts (ref), createProfileCompletionPromptsConfig (ref), setCurrentToastMessage (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.HideProfileCompletion
		}, p1.appPage)
		
		return
	end
	local promptType = var2.promptType
	
	if promptType == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: promptType",
			propName = "promptType",
			name = sduiActionType.HideProfileCompletion
		}, p1.appPage)
		
		return
	end
	reportPromptImpression(promptType, var2.promptId):andThen(function()
		-- upvalues: fetchPrompts (copy), createProfileCompletionPromptsConfig (copy)
		fetchPrompts(createProfileCompletionPromptsConfig(), true)
	end):catch(function()
		-- upvalues: p1 (ref), setCurrentToastMessage (copy)
		p1.dependencies.dispatch(setCurrentToastMessage({
			toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
		}))
	end)
end