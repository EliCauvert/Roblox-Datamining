local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatToastEventReceiverModule = require(AppChat.Components.EventReceivers.AppChatToastEventReceiver)
local EnteredChatFromEntryPointModule = require(AppChat.Actions.EnteredChatFromEntryPoint)
local NavigateIntoChatModule = require(AppChat.Conversations.Thunks.NavigateIntoChat)
local ReactModule = require(Parent.React)
local SocialCommonModule = require(Parent.SocialCommon)
local OverlayHostModule = require(AppChat.Components.OSA.OverlayHost)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch

function AppChatToastManagerUA()
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), NavigateIntoChatModule (copy), EnteredChatFromEntryPointModule (copy), SocialCommonModule (copy), AppChatToastEventReceiverModule (copy), OverlayHostModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		ToastEventReceiver = ReactModule.createElement(AppChatToastEventReceiverModule, {
			navigateToChat = ReactModule.useCallback(function(ConversationId)
				-- upvalues: UseDispatchResult (copy), NavigateIntoChatModule (upval), EnteredChatFromEntryPointModule (upval), SocialCommonModule (upval)
				UseDispatchResult(NavigateIntoChatModule({ conversationId = ConversationId }, true))
				UseDispatchResult(EnteredChatFromEntryPointModule(SocialCommonModule.Enums.ChatEntryPointNames.ToastUniversalApp))
			end, { UseDispatchResult })
		}),
		OverlayHost = ReactModule.createElement(OverlayHostModule)
	})
end

return AppChatToastManagerUA