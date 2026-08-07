local messageModule = require(script.Parent.Message)

return {
	mapTextChatMessage = function(p0, p1) --[[ line: 14 ]]
		-- upvalues: messageModule (ref)
		return if p0.TextSource then messageModule.createUserMessageFromTextChatMessage(p0, p1) else messageModule.createSystemMessageFromTextChatMessage(p0)
	end,
	mapSendingMessage = function(p2, p3) --[[ line: 24 ]]
		-- upvalues: messageModule (ref)
		return messageModule.createUserMessageFromTextChatMessage(p2, p3)
	end,
	applyMessage = function(p4, p5) --[[ line: 33 ]]
		for i, v in p4 do
			if v.messageId == p5.messageId then
				local cloned = table.clone(p4)
				
				if p5.content == "" then
					table.remove(cloned, i)
					
					return cloned
				end
				cloned[i] = p5
				
				return cloned
			end
		end
		if p5.content == "" then
			return p4
		end
		local cloned = table.clone(p4)
		table.insert(cloned, p5)
		
		return cloned
	end
}