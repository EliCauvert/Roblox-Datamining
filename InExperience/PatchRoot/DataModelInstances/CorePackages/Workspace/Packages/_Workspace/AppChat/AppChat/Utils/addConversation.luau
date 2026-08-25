local appChat = script:FindFirstAncestor("AppChat")
local conversationModule = require(appChat.Models.Conversation)
local immutable = require(appChat.Parent.AppCommonLib).Immutable

return function(p0, p1)
	-- upvalues: conversationModule (ref), immutable (ref)
	if p1.conversationType == conversationModule.Type.ONE_TO_ONE_CONVERSATION then
		local var2 = conversationModule.IdForFakeOneOnOne(p1.participants)
		
		if p0[var2] ~= nil then
			p0 = immutable.Set(p0, var2, nil)
		end
	end
	return if p0[p1.id] then p0 else immutable.Set(p0, p1.id, p1)
end