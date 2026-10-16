local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local ToastRoduxModule = require(Parent.ToastRodux)
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local ToastType = ToastRoduxModule.Enums.ToastType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry
local SduiActionParams = SduiCoreSystemModule.SduiActionParams
local GetStringParamFunction = SduiActionParams.getStringParam
local GetBooleanParamFunction = SduiActionParams.getBooleanParam
local SduiDismissPromptActionModule = require(SduiSharedContent.Actions.SduiDismissPromptAction)
local FFlagSduiDismissPromptAction = require(Parent.SharedFlags).FFlagSduiDismissPromptAction
local FFlagLuaAppSduiMovePromptsActions = require(Parent.SharedFlags).FFlagLuaAppSduiMovePromptsActions

return function(p1, p2, p3, _) --[[ Line: 27 | Named "SduiShowToastAction" ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), GetStringParamFunction (copy), ToastType (copy), SetCurrentToastMessageFunction (copy), FFlagSduiDismissPromptAction (copy), GetBooleanParamFunction (copy), FFlagLuaAppSduiMovePromptsActions (copy), GetSduiActionHandlerRegistryFunction (copy), SduiDismissPromptActionModule (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.ShowToast
		}, p3.appPage)
		
		return
	end
	local ToastMessage = GetStringParamFunction(ActionParams, "toastMessage")
	
	if ToastMessage == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: toastMessage",
			propName = "toastMessage",
			name = SduiActionType.ShowToast
		}, p3.appPage)
		
		return
	end
	local ToastType1 = GetStringParamFunction(ActionParams, "toastType")
	p3.dependencies.dispatch(SetCurrentToastMessageFunction({
		isLocalized = true,
		toastMessage = ToastMessage,
		toastType = if ToastType1 and ToastType[ToastType1] then ToastType[ToastType1] else ToastType.SuccessConfirmation
	}))
	
	if FFlagSduiDismissPromptAction and GetBooleanParamFunction(ActionParams, "dismissPrompt", false) then
		local config = {
			actionType = SduiActionType.DismissPrompt,
			actionParams = {
				promptType = ActionParams.promptType,
				promptId = ActionParams.promptId
			}
		}
		
		if FFlagLuaAppSduiMovePromptsActions then
			local ActionHandlerConfig = GetSduiActionHandlerRegistryFunction().getActionHandlerConfig(SduiActionType.DismissPrompt)
			
			if ActionHandlerConfig and ActionHandlerConfig.handler then
				ActionHandlerConfig.handler(config, p2, p3)
				
				return
			else
				p3.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
					message = "DismissPrompt handler is not registered",
					propName = "dismissPrompt",
					name = SduiActionType.ShowToast
				}, p3.appPage)
				
				return
			end
		else
			SduiDismissPromptActionModule(config, p2, p3)
		end
	end
end