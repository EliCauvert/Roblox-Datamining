local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatToastEventReceiverModule = require(appChat.Components.EventReceivers.AppChatToastEventReceiver)
local enteredChatFromEntryPointModule = require(appChat.Actions.EnteredChatFromEntryPoint)
local navigateIntoChatModule = require(appChat.Conversations.Thunks.NavigateIntoChat)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local socialCommonModule = require(parent.SocialCommon)
local overlayHostModule = require(appChat.Components.OSA.OverlayHost)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch

function AppChatToastManagerUA() --[[ line: 16 ]]
	-- upvalues: useDispatch (ref), reactModule (ref), navigateIntoChatModule (ref), enteredChatFromEntryPointModule (ref), socialCommonModule (ref), appChatToastEventReceiverModule (ref), overlayHostModule (ref)
	local var8 = useDispatch()
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		ToastEventReceiver = reactModule.createElement(appChatToastEventReceiverModule, {
			navigateToChat = reactModule.useCallback(function(p0) --[[ line: 19 ]]
				-- upvalues: var8 (ref), navigateIntoChatModule (copy), enteredChatFromEntryPointModule (copy), socialCommonModule (copy)
				var8(navigateIntoChatModule({ conversationId = p0 }, true))
				var8(enteredChatFromEntryPointModule(socialCommonModule.Enums.ChatEntryPointNames.ToastUniversalApp))
			end, { var8 })
		}),
		OverlayHost = reactModule.createElement(overlayHostModule)
	})
end

return AppChatToastManagerUA