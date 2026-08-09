local acpProtocolModule = require(script.Parent.Parent.Acp.AcpProtocol)
local _ = require(script.Parent.Parent.createTurnHandle)
local _ = require(script.Parent.Parent.types)
local t = {
	agent_message = true,
	agent_message_chunk = true,
	agent_thought = true,
	agent_thought_chunk = true,
	tool_call_update = true,
	tool_call_content_chunk = true,
	state_change = true
}

local function _(p0) --[[ line: 21 | named "getHistorySequenceId" ]]
	local sequenceId = p0.sequenceId
	
	return if typeof(sequenceId) == "number" then sequenceId else nil
end

local _ = function(p1) --[[ line: 26 | named "isAssistantSessionUpdate" ]]
	-- upvalues: t (ref)
	local sessionUpdate = p1.sessionUpdate
	
	return typeof(sessionUpdate) == "string" and t[sessionUpdate] == true
end

local function orderHistoryItems(p2) --[[ line: 37 ]]
	local t = {}
	
	for i, v in p2 do
		local t_1 = { update = v, originalIndex = i }
		local sequenceId = v.sequenceId
		t_1.sequenceId = if typeof(sequenceId) == "number" then sequenceId else nil
		table.insert(t, t_1)
	end
	table.sort(t, function(p3, p4) --[[ line: 47 ]]
		return if p3.sequenceId == nil or p4.sequenceId == nil then p3.originalIndex < p4.originalIndex else p3.sequenceId < p4.sequenceId
	end)
	
	return t
end

return {
	ingestSessionHistory = function(p5, p6, p7, p8) --[[ line: 63 ]]
		-- upvalues: orderHistoryItems (ref), t (ref), acpProtocolModule (ref)
		assert(typeof(p6) == "string" and p6 ~= "", "sessionId is required")
		local activeTurnInternals = p5.getActiveTurnInternals(p6)
		
		if activeTurnInternals == nil then
			return false
		end
		local var6 = false
		
		for i, v in orderHistoryItems(p7) do
			local sequenceId = v.sequenceId
			
			if sequenceId ~= nil and (p8 == nil or p8 < sequenceId) then
				local sessionUpdate = v.update.sessionUpdate
				
				if typeof(sessionUpdate) == "string" and t[sessionUpdate] == true then
					if p5.onCanonicalSessionUpdate ~= nil then
						local var7 = if typeof(v.update._meta) == "table" then v.update._meta._roblox else nil
						local var8 = if typeof(var7) == "table" then var7.turnId else nil
						
						if typeof(var8) == "number" and var8 > 0 and var8 % 1 == 0 then
							p5.onCanonicalSessionUpdate({
								source = "history",
								sessionId = p6,
								sequenceId = sequenceId,
								turnId = var8,
								update = v.update
							})
						end
					end
					var6 = var6 or activeTurnInternals.dispatchFrame({
						kind = "notification",
						notification = {
							method = acpProtocolModule.Notifications.SessionUpdate,
							params = { sessionId = p6, update = v.update }
						}
					}, { sequenceNumber = sequenceId }, false)
					
					if activeTurnInternals.isDone() then
						p5.onTurnDone(activeTurnInternals)
						
						return var6
					end
				end
			end
		end
		return var6
	end
}