local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MessageContextMenuModule = require(script.Parent.MessageContextMenu)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseGetConversationFromIdModule = require(AppChat.Hooks.useGetConversationFromId)
local config = { messageId = "", conversationId = "", inputBoxRef = nil }

function MessageContextMenuContainer(p1) --[[ Line: 32 ]]
	-- upvalues: CryoModule (copy), config (copy), UseGetConversationFromIdModule (copy), UseLocalUserIdFunction (copy), ReactModule (copy), MessageContextMenuModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseGetConversationFromIdModuleResult = UseGetConversationFromIdModule(UnionResult.conversationId)
	local GetResult = if UseGetConversationFromIdModuleResult and UseGetConversationFromIdModuleResult.messages then UseGetConversationFromIdModuleResult.messages:Get(UnionResult.messageId) else nil
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	
	return if GetResult then ReactModule.createElement(MessageContextMenuModule, CryoModule.Dictionary.union(UnionResult, {
		message = GetResult,
		userOwnsMessage = GetResult.senderTargetId == UseLocalUserIdResult
	})) else nil
end

return ReactModule.memo(MessageContextMenuContainer)