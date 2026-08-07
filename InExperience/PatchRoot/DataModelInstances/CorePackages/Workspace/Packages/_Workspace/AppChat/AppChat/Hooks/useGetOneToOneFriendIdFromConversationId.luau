local appChat = script:FindFirstAncestor("AppChat")
local useLocalUserId = require(appChat.Parent.RobloxAppHooks).useLocalUserId
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local getOtherParticipantsModule = require(appChat.Conversations.getOtherParticipants)

return function(p0) --[[ line: 8 ]]
	-- upvalues: useLocalUserId (ref), useGetConversationFromIdModule (ref), getOtherParticipantsModule (ref)
	local var3 = useLocalUserId()
	local var4 = useGetConversationFromIdModule(p0)
	
	if not p0 or not var3 then
		return nil
	elseif not var4 then
		return nil
	elseif var4.type ~= "one_to_one" then
		return nil
	end
	local var5 = getOtherParticipantsModule(var4, var3)
	
	return if #var5 == 1 then var5[1] else nil
end