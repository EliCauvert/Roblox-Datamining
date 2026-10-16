local Parent = script.Parent.Parent
local _ = require(Parent.networkingChatTypes)
local CHATURLModule = require(Parent.CHAT_URL)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: CHATURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "StartGroupConversation" }, function(Callback, ParticipantUserIds, Title) --[[ Line: 9 ]]
		-- upvalues: CHATURLModule (upval)
		return Callback(CHATURLModule):path("v2"):path("start-group-conversation"):body({ participantUserIds = ParticipantUserIds, title = Title }):setStatusIds(ParticipantUserIds)
	end)
end