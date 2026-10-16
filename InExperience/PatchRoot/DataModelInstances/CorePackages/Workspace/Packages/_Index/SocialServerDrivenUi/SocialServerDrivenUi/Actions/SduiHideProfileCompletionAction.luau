local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local CreateProfileCompletionPromptsConfigFunction = require(Parent.ProfilePlatformCommon).Utils.createProfileCompletionPromptsConfig
local ServerTriggeredModalsModule = require(Parent.ServerTriggeredModals)
local FetchPromptsFunction = ServerTriggeredModalsModule.fetchPrompts
local ReportPromptImpressionFunction = ServerTriggeredModalsModule.reportPromptImpression
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage

return function(p1, _, p2, _) --[[ Line: 21 ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), ReportPromptImpressionFunction (copy), FetchPromptsFunction (copy), CreateProfileCompletionPromptsConfigFunction (copy), SetCurrentToastMessageFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.HideProfileCompletion
		}, p2.appPage)
		
		return
	end
	local PromptType = ActionParams.promptType
	
	if PromptType == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: promptType",
			propName = "promptType",
			name = SduiActionType.HideProfileCompletion
		}, p2.appPage)
		
		return
	else
		ReportPromptImpressionFunction(PromptType, ActionParams.promptId):andThen(function() --[[ Line: 49 ]]
			-- upvalues: FetchPromptsFunction (upval), CreateProfileCompletionPromptsConfigFunction (upval)
			FetchPromptsFunction(CreateProfileCompletionPromptsConfigFunction(), true)
		end):catch(function() --[[ Line: 52 ]]
			-- upvalues: p2 (copy), SetCurrentToastMessageFunction (upval)
			p2.dependencies.dispatch(SetCurrentToastMessageFunction({
				toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
			}))
		end)
	end
end