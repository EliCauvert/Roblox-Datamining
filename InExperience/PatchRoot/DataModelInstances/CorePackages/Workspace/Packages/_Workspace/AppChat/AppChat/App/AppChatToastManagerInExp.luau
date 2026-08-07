local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatToastEventReceiverModule = require(appChat.Components.EventReceivers.AppChatToastEventReceiver)
local enteredChatFromEntryPointModule = require(appChat.Actions.EnteredChatFromEntryPoint)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local socialCommonModule = require(parent.SocialCommon)
local getFFlagAppChatInExpToastSnoozeMenuDismissFix = require(parent.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local t = { hideAllChatToasts = false, isAppChatVisible = false }

function AppChatToastManagerInExp(p0) --[[ line: 28 ]]
	-- upvalues: cryoModule (ref), t (ref), useDispatch (ref), reactModule (ref), enteredChatFromEntryPointModule (ref), socialCommonModule (ref), appChatToastEventReceiverModule (ref), getFFlagAppChatInExpToastSnoozeMenuDismissFix (ref)
	local var8 = cryoModule.Dictionary.join(t, p0)
	local var9 = useDispatch()
	
	return reactModule.createElement(appChatToastEventReceiverModule, {
		isInExperience = true,
		navigateToChat = reactModule.useCallback(function(p1) --[[ line: 33 ]]
			-- upvalues: var8 (ref), var9 (ref), enteredChatFromEntryPointModule (copy), socialCommonModule (copy)
			var8.navigateToChat(p1)
			var9(enteredChatFromEntryPointModule(socialCommonModule.Enums.ChatEntryPointNames.ToastInExp))
		end, { var9, var8.navigateToChat }),
		hideAllChatToasts = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then nil else var8.hideAllChatToasts,
		isAppChatVisible = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then var8.isAppChatVisible else nil
	})
end

return AppChatToastManagerInExp