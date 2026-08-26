local messageModule = require(script.Parent.Message)

return {
	mapTextChatMessage = function(p1, p2)
		-- upvalues: messageModule (ref)
		return if p1.TextSource then messageModule.createUserMessageFromTextChatMessage(p1, p2) else messageModule.createSystemMessageFromTextChatMessage(p1)
	end,
	mapSendingMessage = function(p1, p2)
		-- upvalues: messageModule (ref)
		return messageModule.createUserMessageFromTextChatMessage(p1, p2)
	end,
	applyMessage = function(p1, p2)
		for i, v in p1 do
			if v.messageId == p2.messageId then
				local cloned = table.clone(p1)
				
				if p2.content == "" then
					table.remove(cloned, i)
					
					return cloned
				end
				cloned[i] = p2
				
				return cloned
			end
		end
		if p2.content == "" then
			return p1
		end
		local cloned = table.clone(p1)
		table.insert(cloned, p2)
		
		return cloned
	end
}