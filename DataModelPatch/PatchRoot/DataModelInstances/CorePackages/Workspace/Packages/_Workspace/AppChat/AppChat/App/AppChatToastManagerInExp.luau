local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatToastEventReceiverModule = require(AppChat.Components.EventReceivers.AppChatToastEventReceiver)
local EnteredChatFromEntryPointModule = require(AppChat.Actions.EnteredChatFromEntryPoint)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local SocialCommonModule = require(Parent.SocialCommon)
local GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction = require(Parent.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local config = { hideAllChatToasts = false, isAppChatVisible = false }

function AppChatToastManagerInExp(p1)
	-- upvalues: CryoModule (copy), config (copy), UseDispatchFunction (copy), ReactModule (copy), EnteredChatFromEntryPointModule (copy), SocialCommonModule (copy), AppChatToastEventReceiverModule (copy), GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.createElement(AppChatToastEventReceiverModule, {
		isInExperience = true,
		navigateToChat = ReactModule.useCallback(function(p2)
			-- upvalues: JoinResult (copy), UseDispatchResult (copy), EnteredChatFromEntryPointModule (upval), SocialCommonModule (upval)
			JoinResult.navigateToChat(p2)
			UseDispatchResult(EnteredChatFromEntryPointModule(SocialCommonModule.Enums.ChatEntryPointNames.ToastInExp))
		end, { UseDispatchResult, JoinResult.navigateToChat }),
		hideAllChatToasts = if GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction() then nil else JoinResult.hideAllChatToasts,
		isAppChatVisible = if GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction() then JoinResult.isAppChatVisible else nil
	})
end

return AppChatToastManagerInExp