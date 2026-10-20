local AppChat = script:FindFirstAncestor("AppChat")
local ReactModule = require(AppChat.Parent.React)
local GetExternalChatMessageSenderStoreModule = require(AppChat.Stores.GetExternalChatMessageSenderStore)
local UseExternalChatMessageSenderModule = require(AppChat.Hooks.useExternalChatMessageSender)

return function(p1)
	-- upvalues: UseExternalChatMessageSenderModule (copy), GetExternalChatMessageSenderStoreModule (copy), ReactModule (copy)
	local UseExternalChatMessageSenderModuleResult = UseExternalChatMessageSenderModule(p1.isInExperience == true)
	local ExternalChatMessageSenderStoreModule = GetExternalChatMessageSenderStoreModule()
	ReactModule.useEffect(function()
		-- upvalues: ExternalChatMessageSenderStoreModule (copy), UseExternalChatMessageSenderModuleResult (copy)
		ExternalChatMessageSenderStoreModule.setSender(UseExternalChatMessageSenderModuleResult)
	end, {
		UseExternalChatMessageSenderModuleResult,
		ExternalChatMessageSenderStoreModule
	})
	ReactModule.useEffect(function()
		-- upvalues: ExternalChatMessageSenderStoreModule (copy)
		return ExternalChatMessageSenderStoreModule.clearSender
	end, { ExternalChatMessageSenderStoreModule })
	
	return nil
end