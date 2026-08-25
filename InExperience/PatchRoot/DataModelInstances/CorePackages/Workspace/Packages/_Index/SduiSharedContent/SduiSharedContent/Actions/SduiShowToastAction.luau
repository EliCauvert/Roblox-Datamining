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

return function(p0, p1, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), getStringParam (ref), toastType (ref), setCurrentToastMessage (ref), fFlagSduiDismissPromptAction (ref), getBooleanParam (ref), sduiDismissPromptActionModule (ref)
	local var4 = if p0 then p0.actionParams else nil
	
	if var4 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.ShowToast
		}, p2.appPage)
		
		return
	end
	local var5 = getStringParam(var4, "toastMessage")
	
	if var5 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: toastMessage",
			propName = "toastMessage",
			name = sduiActionType.ShowToast
		}, p2.appPage)
		
		return
	end
	local var6 = getStringParam(var4, "toastType")
	p2.dependencies.dispatch(setCurrentToastMessage({
		isLocalized = true,
		toastMessage = var5,
		toastType = if var6 and toastType[var6] then toastType[var6] else toastType.SuccessConfirmation
	}))
	
	if fFlagSduiDismissPromptAction and getBooleanParam(var4, "dismissPrompt", false) then
		sduiDismissPromptActionModule({
			actionType = sduiActionType.DismissPrompt,
			actionParams = { promptType = var4.promptType, promptId = var4.promptId }
		}, p1, p2)
	end
end