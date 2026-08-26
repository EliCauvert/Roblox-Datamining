local appChat = script:FindFirstAncestor("AppChat")
local reactModule = require(appChat.Parent.React)
local getExternalChatMessageSenderStoreModule = require(appChat.Stores.GetExternalChatMessageSenderStore)
local useExternalChatMessageSenderModule = require(appChat.Hooks.useExternalChatMessageSender)

return function(p1)
	-- upvalues: useExternalChatMessageSenderModule (ref), getExternalChatMessageSenderStoreModule (ref), reactModule (ref)
	local var1 = useExternalChatMessageSenderModule(p1.isInExperience == true)
	local var2 = getExternalChatMessageSenderStoreModule()
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var1 (ref)
		var2.setSender(var1)
	end, { var1, var2 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		return var2.clearSender
	end, { var2 })
	
	return nil
end