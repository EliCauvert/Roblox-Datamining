local appChat = script:FindFirstAncestor("AppChat")
local conversationModule = require(appChat.Models.Conversation)
local immutable = require(appChat.Parent.AppCommonLib).Immutable

return function(p1, p2)
	-- upvalues: conversationModule (ref), immutable (ref)
	if p2.conversationType == conversationModule.Type.ONE_TO_ONE_CONVERSATION then
		local var1 = conversationModule.IdForFakeOneOnOne(p2.participants)
		
		if p1[var1] ~= nil then
			p1 = immutable.Set(p1, var1, nil)
		end
	end
	return if p1[p2.id] then p1 else immutable.Set(p1, p2.id, p2)
end