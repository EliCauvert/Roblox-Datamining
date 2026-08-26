local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local messageContextMenuModule = require(script.Parent.MessageContextMenu)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local t = { messageId = "", conversationId = "", inputBoxRef = nil }

function MessageContextMenuContainer(p1)
	-- upvalues: cryoModule (ref), t (ref), useGetConversationFromIdModule (ref), useLocalUserId (ref), reactModule (ref), messageContextMenuModule (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = useGetConversationFromIdModule(var1.conversationId)
	local var3 = if var2 and var2.messages then var2.messages:Get(var1.messageId) else nil
	
	return if var3 then reactModule.createElement(messageContextMenuModule, cryoModule.Dictionary.union(var1, {
		message = var3,
		userOwnsMessage = var3.senderTargetId == useLocalUserId()
	})) else nil
end

return reactModule.memo(MessageContextMenuContainer)