local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.Models.ConversationChannels)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseGetConversationFromIdModule = require(AppChat.Hooks.useGetConversationFromId)
local UseGetOneToOneFriendIdFromConversationIdModule = require(AppChat.Hooks.useGetOneToOneFriendIdFromConversationId)

return function(Callback, p1) --[[ Line: 25 | Named "useCallbackWithDynamicConversationId" ]]
	-- upvalues: UseGetConversationFromIdModule (copy), UseGetOneToOneFriendIdFromConversationIdModule (copy), ReactModule (copy), CryoModule (copy)
	local UseGetConversationFromIdModuleResult = UseGetConversationFromIdModule(p1)
	local HasUseGetConversationFromIdModuleResult = UseGetConversationFromIdModuleResult ~= nil
	local UseGetOneToOneFriendIdFromConversationIdModuleResult = UseGetOneToOneFriendIdFromConversationIdModule(p1)
	local UseGetOneToOneFriendIdFromConversationIdModuleResult1 = UseGetConversationFromIdModuleResult and (UseGetConversationFromIdModuleResult.source == "friends" and UseGetOneToOneFriendIdFromConversationIdModuleResult)
	local P0 = UseGetConversationFromIdModuleResult and (UseGetConversationFromIdModuleResult.source ~= "friends" and p1)
	
	return ReactModule.useCallback(function(p2) --[[ Line: 35 ]]
		-- upvalues: Callback (copy), CryoModule (upval), P0 (copy), p1 (copy), UseGetOneToOneFriendIdFromConversationIdModuleResult1 (copy), UseGetOneToOneFriendIdFromConversationIdModuleResult (copy)
		return Callback((CryoModule.Dictionary.union(p2 or {}, {
			conversationId = if P0 then p1 else nil,
			friendId = if UseGetOneToOneFriendIdFromConversationIdModuleResult1 then UseGetOneToOneFriendIdFromConversationIdModuleResult else nil
		})))
	end, {
		Callback,
		p1,
		UseGetOneToOneFriendIdFromConversationIdModuleResult1,
		P0,
		UseGetOneToOneFriendIdFromConversationIdModuleResult
	}), HasUseGetConversationFromIdModuleResult
end