local AppChat = script:FindFirstAncestor("AppChat")
local EnumMessageTypesModule = require(AppChat.Components.ChatConversation.EnumMessageTypes)
local MessageModelModule = require(AppChat.Models.MessageModel)

return function(p1, p2)
	-- upvalues: EnumMessageTypesModule (copy), MessageModelModule (copy)
	local List = {}
	
	for i = 1, p2 do
		local Text = p1.messageIdPrefix .. tostring(i)
		table.insert(List, {
			messageId = Text,
			content = p1.content or "Message " .. Text,
			isIncoming = p1.isIncoming or false,
			messageType = p1.type or EnumMessageTypesModule.PlainText,
			sender = i == p2 and p1.sender or {},
			gameLink = p1.gameLink or nil,
			sent = p1.sent or nil,
			read = p1.read or nil,
			senderType = p1.senderType or MessageModelModule.SenderTypes.User
		})
	end
	return List
end