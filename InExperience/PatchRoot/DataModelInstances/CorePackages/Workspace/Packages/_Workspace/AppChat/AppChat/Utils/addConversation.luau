local AppChat = script:FindFirstAncestor("AppChat")
local ConversationModule = require(AppChat.Models.Conversation)
local Immutable = require(AppChat.Parent.AppCommonLib).Immutable

return function(p1, p2) --[[ Line: 8 ]]
	-- upvalues: ConversationModule (copy), Immutable (copy)
	if p2.conversationType == ConversationModule.Type.ONE_TO_ONE_CONVERSATION then
		local IdForFakeOneOnOneResult = ConversationModule.IdForFakeOneOnOne(p2.participants)
		
		if p1[IdForFakeOneOnOneResult] ~= nil then
			p1 = Immutable.Set(p1, IdForFakeOneOnOneResult, nil)
		end
	end
	return if p1[p2.id] then p1 else Immutable.Set(p1, p2.id, p2)
end