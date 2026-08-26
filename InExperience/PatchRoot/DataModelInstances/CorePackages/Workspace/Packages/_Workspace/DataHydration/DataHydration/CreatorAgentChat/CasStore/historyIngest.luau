local acpProtocolModule = require(script.Parent.Parent.Acp.AcpProtocol)
local _ = require(script.Parent.Parent.createTurnHandle)
local _ = require(script.Parent.Parent.types)
local t = {
	agent_message = true,
	agent_message_chunk = true,
	tool_call_update = true,
	tool_call_content_chunk = true,
	state_change = true
}

local function _(p1)
	local sequenceId = p1.sequenceId
	
	return if typeof(sequenceId) == "number" then sequenceId else nil
end

local _ = function(p1)
	-- upvalues: t (ref)
	local sessionUpdate = p1.sessionUpdate
	
	return typeof(sessionUpdate) == "string" and t[sessionUpdate] == true
end

local function orderHistoryItems(p1)
	local t = {}
	
	for i, v in p1 do
		local t_1 = { update = v, originalIndex = i }
		local sequenceId = v.sequenceId
		t_1.sequenceId = if typeof(sequenceId) == "number" then sequenceId else nil
		table.insert(t, t_1)
	end
	table.sort(t, function(p2, p3)
		return if p2.sequenceId == nil or p3.sequenceId == nil then p2.originalIndex < p3.originalIndex else p2.sequenceId < p3.sequenceId
	end)
	
	return t
end

return {
	ingestSessionHistory = function(p2, p3, p4, p5)
		-- upvalues: orderHistoryItems (ref), t (ref), acpProtocolModule (ref)
		assert(typeof(p3) == "string" and p3 ~= "", "sessionId is required")
		local activeTurnInternals = p2.getActiveTurnInternals(p3)
		
		if activeTurnInternals == nil then
			return {}
		end
		local t_1 = {}
		
		for i, v in orderHistoryItems(p4) do
			local sequenceId = v.sequenceId
			
			if sequenceId ~= nil and (p5 == nil or p5 < sequenceId) then
				local _ = false
				local sessionUpdate = v.update.sessionUpdate
				
				if if typeof(sessionUpdate) == "string" and t[sessionUpdate] == true then activeTurnInternals.dispatchFrame({
					kind = "notification",
					notification = {
						method = acpProtocolModule.Notifications.SessionUpdate,
						params = { sessionId = p3, update = v.update }
					}
				}, { sequenceNumber = sequenceId }, false) else activeTurnInternals.noteProcessedSequenceNumber(sequenceId) then
					table.insert(t_1, sequenceId)
				end
				if activeTurnInternals.isDone() then
					p2.onTurnDone(activeTurnInternals)
					
					return t_1
				end
			end
		end
		return t_1
	end
}