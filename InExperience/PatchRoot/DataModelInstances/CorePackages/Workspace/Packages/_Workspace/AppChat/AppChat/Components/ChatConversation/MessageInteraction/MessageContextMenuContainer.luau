local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local messageContextMenuModule = require(script.Parent.MessageContextMenu)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local t = { messageId = "", conversationId = "", inputBoxRef = nil }

function MessageContextMenuContainer(p0)
	-- upvalues: cryoModule (ref), t (ref), useGetConversationFromIdModule (ref), useLocalUserId (ref), reactModule (ref), messageContextMenuModule (ref)
	local var6 = cryoModule.Dictionary.union(t, p0)
	local var7 = useGetConversationFromIdModule(var6.conversationId)
	local var8 = if var7 and var7.messages then var7.messages:Get(var6.messageId) else nil
	
	return if var8 then reactModule.createElement(messageContextMenuModule, cryoModule.Dictionary.union(var6, {
		message = var8,
		userOwnsMessage = var8.senderTargetId == useLocalUserId()
	})) else nil
end

return reactModule.memo(MessageContextMenuContainer)