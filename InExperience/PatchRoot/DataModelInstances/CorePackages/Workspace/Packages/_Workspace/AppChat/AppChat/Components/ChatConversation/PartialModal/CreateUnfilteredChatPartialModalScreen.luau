local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local enumScreensModule = require(appChat.EnumScreens)
local reactModule = require(parent.React)
local useCallback = reactModule.useCallback
local useEffectOnMount = require(parent.RoactUtils).Hooks.useEffectOnMount
local createUnfilteredChatPartialModalContainerModule = require(script.Parent.CreateUnfilteredChatPartialModalContainer)
local loggerModule = require(script.Parent.Logger)
local t = {}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useEffectOnMount (ref), loggerModule (ref), useCallback (ref), enumScreensModule (ref), reactModule (ref), createUnfilteredChatPartialModalContainerModule (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local navigation = var1.navigation
	assert(type(navigation) ~= "nil", "CreateUnfilteredChatPartialModalScreen should be wrapped with React Navigation")
	local conversationId = navigation and (navigation.getParam and navigation.getParam("conversationId", nil))
	useEffectOnMount(function()
		-- upvalues: loggerModule (copy)
		loggerModule:info("LearnMorePartialModalScreen mounted")
	end)
	local var2 = useCallback(function()
		-- upvalues: navigation (ref)
		navigation.goBack()
	end, { navigation })
	local var3 = useCallback(function(p2)
		-- upvalues: navigation (ref), enumScreensModule (copy)
		navigation.navigate(enumScreensModule.ChatConversation, { conversationId = p2 })
	end, { navigation })
	local var4 = useCallback(function(p2)
		-- upvalues: var1 (ref), enumScreensModule (copy)
		var1.navigation.navigate(enumScreensModule.RoactChatToast, { toastProps = { toastContent = { toastTitle = p2 } } })
	end, { navigation })
	
	if conversationId == nil then
		loggerModule:warning("ConversationId is required to open CreateUnfilteredChatPartialModalScreen")
		
		return nil
	end
	return reactModule.createElement(createUnfilteredChatPartialModalContainerModule, {
		conversationId = conversationId,
		onDismissed = var2,
		navigateToConversation = var3,
		navigateToToast = var4
	})
end