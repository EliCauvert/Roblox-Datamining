local appChat = script:FindFirstAncestor("AppChat")
local useLocalUserId = require(appChat.Parent.RobloxAppHooks).useLocalUserId
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local getOtherParticipantsModule = require(appChat.Conversations.getOtherParticipants)

return function(p1)
	-- upvalues: useLocalUserId (ref), useGetConversationFromIdModule (ref), getOtherParticipantsModule (ref)
	local var1 = useLocalUserId()
	local var2 = useGetConversationFromIdModule(p1)
	
	if not p1 or not var1 then
		return nil
	elseif not var2 then
		return nil
	elseif var2.type ~= "one_to_one" then
		return nil
	end
	local var3 = getOtherParticipantsModule(var2, var1)
	
	return if #var3 == 1 then var3[1] else nil
end