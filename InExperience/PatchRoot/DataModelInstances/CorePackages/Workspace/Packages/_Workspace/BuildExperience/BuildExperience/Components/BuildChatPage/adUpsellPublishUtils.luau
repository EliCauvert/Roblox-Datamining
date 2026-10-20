local ChatTypesModule = require(script:FindFirstAncestor("BuildExperience").Chat.chatTypes)

return {
	getMessageKey = function(p1)
		-- upvalues: ChatTypesModule (copy)
		if p1.kind == "assistant_turn" then
			local AssistantTurnAnchorKey = ChatTypesModule.makeAssistantTurnAnchorKey(p1.sessionId, p1.endSequenceId)
			
			if AssistantTurnAnchorKey ~= nil then
				return AssistantTurnAnchorKey
			elseif p1.turnKey ~= nil then
				return `turn:{p1.turnKey}`
			end
		end
		return if p1.id == nil then nil else `message:{p1.id}`
	end,
	getMessageIndexByKey = function(List)
		-- upvalues: ChatTypesModule (copy)
		local t = {}
		
		for i, value in List do
			local MessageName = nil
			if value.kind == "assistant_turn" then
				local AssistantTurnAnchorKey = ChatTypesModule.makeAssistantTurnAnchorKey(value.sessionId, value.endSequenceId)
				
				if AssistantTurnAnchorKey ~= nil then
					MessageName = AssistantTurnAnchorKey
				else
					if value.turnKey ~= nil then
						MessageName = `turn:{value.turnKey}`
					end
				end
				if MessageName ~= nil then
					t[MessageName] = i
				end
				continue
			end
			MessageName = if value.id == nil then nil else `message:{value.id}`
		end
		return t
	end,
	getLastMessageKey = function(p1)
		-- upvalues: ChatTypesModule (copy)
		local v1 = nil
		local AssistantTurnAnchorKey = nil
		for i = #p1, 1, -1 do
			v1 = p1[i]
			local MessageName = nil
			repeat
				if if v1.kind == "assistant_turn" then not v1.isDone or v1.isOptimisticallyCancelled == true else v1.id ~= nil and string.sub(v1.id, -#ChatTypesModule.PENDING_USER_MESSAGE_ID_SUFFIX) == ChatTypesModule.PENDING_USER_MESSAGE_ID_SUFFIX then
					MessageName = nil
					break
				end
				if v1.kind == "assistant_turn" then
					AssistantTurnAnchorKey = ChatTypesModule.makeAssistantTurnAnchorKey(v1.sessionId, v1.endSequenceId)
					
					if AssistantTurnAnchorKey ~= nil then
						MessageName = AssistantTurnAnchorKey
						break
					end
					if v1.turnKey ~= nil then
						MessageName = `turn:{v1.turnKey}`
						break
					end
				end
				MessageName = if v1.id == nil then nil else `message:{v1.id}`
			until true
			if MessageName ~= nil then
				return MessageName
			end
		end
		return nil
	end
}