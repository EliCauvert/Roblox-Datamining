local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local EnumScreensModule = require(AppChat.EnumScreens)
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectOnMountFunction = require(Parent.RoactUtils).Hooks.useEffectOnMount
local CreateUnfilteredChatPartialModalContainerModule = require(script.Parent.CreateUnfilteredChatPartialModalContainer)
local LoggerModule = require(script.Parent.Logger)
local t = {}

return function(p1)
	-- upvalues: CryoModule (copy), t (copy), UseEffectOnMountFunction (copy), LoggerModule (copy), UseCallbackFunction (copy), EnumScreensModule (copy), ReactModule (copy), CreateUnfilteredChatPartialModalContainerModule (copy)
	local UnionResult = CryoModule.Dictionary.union(t, p1)
	local Navigation = UnionResult.navigation
	assert(type(Navigation) ~= "nil", "CreateUnfilteredChatPartialModalScreen should be wrapped with React Navigation")
	local ConversationIdParam = Navigation and (Navigation.getParam and Navigation.getParam("conversationId", nil))
	UseEffectOnMountFunction(function()
		-- upvalues: LoggerModule (upval)
		LoggerModule:info("LearnMorePartialModalScreen mounted")
	end)
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: Navigation (copy)
		Navigation.goBack()
	end, { Navigation })
	local UseCallbackResult1 = UseCallbackFunction(function(ConversationId)
		-- upvalues: Navigation (copy), EnumScreensModule (upval)
		Navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = ConversationId })
	end, { Navigation })
	local UseCallbackResult2 = UseCallbackFunction(function(ToastTitle)
		-- upvalues: UnionResult (copy), EnumScreensModule (upval)
		UnionResult.navigation.navigate(EnumScreensModule.RoactChatToast, {
			toastProps = { toastContent = { toastTitle = ToastTitle } }
		})
	end, { Navigation })
	
	if ConversationIdParam == nil then
		LoggerModule:warning("ConversationId is required to open CreateUnfilteredChatPartialModalScreen")
		
		return nil
	else
		return ReactModule.createElement(CreateUnfilteredChatPartialModalContainerModule, {
			conversationId = ConversationIdParam,
			onDismissed = UseCallbackResult,
			navigateToConversation = UseCallbackResult1,
			navigateToToast = UseCallbackResult2
		})
	end
end