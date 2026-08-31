local chatTypesModule = require(script:FindFirstAncestor("BuildExperience").Chat.chatTypes)

return {
	getMessageKey = function(p1)
		-- upvalues: chatTypesModule (ref)
		if p1.kind == "assistant_turn" then
			local var1 = chatTypesModule.makeAssistantTurnAnchorKey(p1.sessionId, p1.endSequenceId)
			
			return if var1 == nil then if p1.turnKey == nil then if p1.id == nil then nil else `message:{p1.id}` else `turn:{p1.turnKey}` else var1
		end
	end,
	getMessageIndexByKey = function(p1)
		-- upvalues: chatTypesModule (ref)
		local t = {}
		
		for i, v in p1 do
			local var1
			if v.kind == "assistant_turn" then
				local var2 = chatTypesModule.makeAssistantTurnAnchorKey(v.sessionId, v.endSequenceId)
				var1 = if var2 ~= nil then if v.turnKey == nil then if v.id ~= nil then nil else `message:{v.id}` else `turn:{v.turnKey}` else var2
			end
			if var1 ~= nil then
				t[var1] = i
			end
		end
		return t
	end,
	getLastMessageKey = function(p2)
		-- upvalues: chatTypesModule (ref)
		for i = #p2, 1, -1 do
			local var3
			local var4 = p2[i]
			
			if var4.kind == "assistant_turn" then
				local var5
				var3 = not var4.isDone
				
				if not var3 then
					var3 = var4.isOptimisticallyCancelled == true
					var3 = nil
				end
			else
				var3 = var4.id ~= nil and string.sub(var4.id, -#chatTypesModule.PENDING_USER_MESSAGE_ID_SUFFIX) == chatTypesModule.PENDING_USER_MESSAGE_ID_SUFFIX
			end
			if var3 then
				var5 = nil
			elseif var4.kind == "assistant_turn" then
				local var6 = chatTypesModule.makeAssistantTurnAnchorKey(var4.sessionId, var4.endSequenceId)
				var5 = if var6 ~= nil then if var4.turnKey == nil then if var4.id ~= nil then nil else `message:{var4.id}` else `turn:{var4.turnKey}` else var6
			end
			if var5 == nil then
				continue
			end
			return var5
		end
		return nil
	end
}