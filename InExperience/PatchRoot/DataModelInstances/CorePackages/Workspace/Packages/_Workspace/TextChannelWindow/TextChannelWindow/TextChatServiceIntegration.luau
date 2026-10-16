local MessageModule = require(script.Parent.Message)

return {
	mapTextChatMessage = function(p1, p2) --[[ Line: 14 ]]
		-- upvalues: MessageModule (copy)
		return if p1.TextSource then MessageModule.createUserMessageFromTextChatMessage(p1, p2) else MessageModule.createSystemMessageFromTextChatMessage(p1)
	end,
	mapSendingMessage = function(p1, p2) --[[ Line: 24 ]]
		-- upvalues: MessageModule (copy)
		return MessageModule.createUserMessageFromTextChatMessage(p1, p2)
	end,
	applyMessage = function(Tbl, p1) --[[ Line: 33 ]]
		for i, value in Tbl do
			if value.messageId == p1.messageId then
				local Copy = table.clone(Tbl)
				
				if p1.content == "" then
					table.remove(Copy, i)
					
					return Copy
				else
					Copy[i] = p1
					
					return Copy
				end
			end
		end
		if p1.content == "" then
			return Tbl
		else
			local Copy = table.clone(Tbl)
			table.insert(Copy, p1)
			
			return Copy
		end
	end
}