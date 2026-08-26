local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.Models.ConversationChannels)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local useGetOneToOneFriendIdFromConversationIdModule = require(appChat.Hooks.useGetOneToOneFriendIdFromConversationId)

return function(p1, p2)
	-- upvalues: useGetConversationFromIdModule (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), reactModule (ref), cryoModule (ref)
	local var1 = useGetConversationFromIdModule(p2)
	local var2 = var1 ~= nil
	local var3 = useGetOneToOneFriendIdFromConversationIdModule(p2)
	local var4 = var1 and (var1.source == "friends" and var3)
	local var5 = var1 and (var1.source ~= "friends" and p2)
	
	return reactModule.useCallback(function(p3)
		-- upvalues: p1 (ref), cryoModule (copy), var5 (ref), p2 (ref), var4 (ref), var3 (ref)
		return p1(cryoModule.Dictionary.union(p3 or {}, {
			conversationId = if var5 then p2 else nil,
			friendId = if var4 then var3 else nil
		}))
	end, {
		p1,
		p2,
		var4,
		var5,
		var3
	}), var2
end