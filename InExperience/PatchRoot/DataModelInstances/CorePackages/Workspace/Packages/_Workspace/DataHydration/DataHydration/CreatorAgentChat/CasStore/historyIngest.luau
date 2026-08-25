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

local function _(p0)
	local sequenceId = p0.sequenceId
	
	return if typeof(sequenceId) == "number" then sequenceId else nil
end

local _ = function(p1)
	-- upvalues: t (ref)
	local sessionUpdate = p1.sessionUpdate
	
	return typeof(sessionUpdate) == "string" and t[sessionUpdate] == true
end

local function orderHistoryItems(p2)
	local t = {}
	
	for i, v in p2 do
		local t_1 = { update = v, originalIndex = i }
		local sequenceId = v.sequenceId
		t_1.sequenceId = if typeof(sequenceId) == "number" then sequenceId else nil
		table.insert(t, t_1)
	end
	table.sort(t, function(p3, p4)
		return if p3.sequenceId == nil or p4.sequenceId == nil then p3.originalIndex < p4.originalIndex else p3.sequenceId < p4.sequenceId
	end)
	
	return t
end

return {
	ingestSessionHistory = function(p5, p6, p7, p8)
		-- upvalues: orderHistoryItems (ref), t (ref), acpProtocolModule (ref)
		assert(typeof(p6) == "string" and p6 ~= "", "sessionId is required")
		local activeTurnInternals = p5.getActiveTurnInternals(p6)
		
		if activeTurnInternals == nil then
			return {}
		end
		local t_1 = {}
		
		for i, v in orderHistoryItems(p7) do
			local sequenceId = v.sequenceId
			
			if sequenceId ~= nil and (p8 == nil or p8 < sequenceId) then
				local _ = false
				local sessionUpdate = v.update.sessionUpdate
				
				if if typeof(sessionUpdate) == "string" and t[sessionUpdate] == true then activeTurnInternals.dispatchFrame({
					kind = "notification",
					notification = {
						method = acpProtocolModule.Notifications.SessionUpdate,
						params = { sessionId = p6, update = v.update }
					}
				}, { sequenceNumber = sequenceId }, false) else activeTurnInternals.noteProcessedSequenceNumber(sequenceId) then
					table.insert(t_1, sequenceId)
				end
				if activeTurnInternals.isDone() then
					p5.onTurnDone(activeTurnInternals)
					
					return t_1
				end
			end
		end
		return t_1
	end
}