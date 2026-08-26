local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local parent = sduiSharedContent.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local toastRoduxModule = require(parent.ToastRodux)
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local toastType = toastRoduxModule.Enums.ToastType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiActionParams = sduiCoreSystemModule.SduiActionParams
local getStringParam = sduiActionParams.getStringParam
local getBooleanParam = sduiActionParams.getBooleanParam
local fFlagSduiDismissPromptAction = require(parent.SharedFlags).FFlagSduiDismissPromptAction
local sduiDismissPromptActionModule = require(sduiSharedContent.Actions.SduiDismissPromptAction)

return function(p1, p2, p3, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), getStringParam (ref), toastType (ref), setCurrentToastMessage (ref), fFlagSduiDismissPromptAction (ref), getBooleanParam (ref), sduiDismissPromptActionModule (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.ShowToast
		}, p3.appPage)
		
		return
	end
	local var2 = getStringParam(var1, "toastMessage")
	
	if var2 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: toastMessage",
			propName = "toastMessage",
			name = sduiActionType.ShowToast
		}, p3.appPage)
		
		return
	end
	local var3 = getStringParam(var1, "toastType")
	p3.dependencies.dispatch(setCurrentToastMessage({
		isLocalized = true,
		toastMessage = var2,
		toastType = if var3 and toastType[var3] then toastType[var3] else toastType.SuccessConfirmation
	}))
	
	if fFlagSduiDismissPromptAction and getBooleanParam(var1, "dismissPrompt", false) then
		sduiDismissPromptActionModule({
			actionType = sduiActionType.DismissPrompt,
			actionParams = { promptType = var1.promptType, promptId = var1.promptId }
		}, p2, p3)
	end
end