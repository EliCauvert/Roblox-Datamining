local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local createProfileCompletionPromptsConfig = require(parent.ProfilePlatformCommon).Utils.createProfileCompletionPromptsConfig
local serverTriggeredModalsModule = require(parent.ServerTriggeredModals)
local fetchPrompts = serverTriggeredModalsModule.fetchPrompts
local reportPromptImpression = serverTriggeredModalsModule.reportPromptImpression
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), reportPromptImpression (ref), fetchPrompts (ref), createProfileCompletionPromptsConfig (ref), setCurrentToastMessage (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.HideProfileCompletion
		}, p2.appPage)
		
		return
	end
	local promptType = var1.promptType
	
	if promptType == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: promptType",
			propName = "promptType",
			name = sduiActionType.HideProfileCompletion
		}, p2.appPage)
		
		return
	end
	reportPromptImpression(promptType, var1.promptId):andThen(function()
		-- upvalues: fetchPrompts (copy), createProfileCompletionPromptsConfig (copy)
		fetchPrompts(createProfileCompletionPromptsConfig(), true)
	end):catch(function()
		-- upvalues: p2 (ref), setCurrentToastMessage (copy)
		p2.dependencies.dispatch(setCurrentToastMessage({
			toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
		}))
	end)
end