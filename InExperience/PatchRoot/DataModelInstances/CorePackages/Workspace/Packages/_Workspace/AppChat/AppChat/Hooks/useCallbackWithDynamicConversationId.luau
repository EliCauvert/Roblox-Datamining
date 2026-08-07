local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.Models.ConversationChannels)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local useGetOneToOneFriendIdFromConversationIdModule = require(appChat.Hooks.useGetOneToOneFriendIdFromConversationId)

return function(p0, p1) --[[ line: 25 | named "useCallbackWithDynamicConversationId" ]]
	-- upvalues: useGetConversationFromIdModule (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), reactModule (ref), cryoModule (ref)
	local var5 = useGetConversationFromIdModule(p1)
	local var6 = var5 ~= nil
	local var7 = useGetOneToOneFriendIdFromConversationIdModule(p1)
	local var8 = var5 and (var5.source == "friends" and var7)
	local var9 = var5 and (var5.source ~= "friends" and p1)
	
	return reactModule.useCallback(function(p2) --[[ line: 35 ]]
		-- upvalues: p0 (ref), cryoModule (copy), var9 (ref), p1 (ref), var8 (ref), var7 (ref)
		return p0(cryoModule.Dictionary.union(p2 or {}, {
			conversationId = if var9 then p1 else nil,
			friendId = if var8 then var7 else nil
		}))
	end, {
		p0,
		p1,
		var8,
		var9,
		var7
	}), var6
end