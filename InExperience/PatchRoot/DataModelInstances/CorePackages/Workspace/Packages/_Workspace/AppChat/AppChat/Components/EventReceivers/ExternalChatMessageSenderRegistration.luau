local appChat = script:FindFirstAncestor("AppChat")
local reactModule = require(appChat.Parent.React)
local getExternalChatMessageSenderStoreModule = require(appChat.Stores.GetExternalChatMessageSenderStore)
local useExternalChatMessageSenderModule = require(appChat.Hooks.useExternalChatMessageSender)

return function(p0)
	-- upvalues: useExternalChatMessageSenderModule (ref), getExternalChatMessageSenderStoreModule (ref), reactModule (ref)
	local var4 = useExternalChatMessageSenderModule(p0.isInExperience == true)
	local var5 = getExternalChatMessageSenderStoreModule()
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var4 (ref)
		var5.setSender(var4)
	end, { var4, var5 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref)
		return var5.clearSender
	end, { var5 })
	
	return nil
end