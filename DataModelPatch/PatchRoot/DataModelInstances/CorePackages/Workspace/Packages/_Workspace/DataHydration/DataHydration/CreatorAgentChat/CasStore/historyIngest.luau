local AcpProtocolModule = require(script.Parent.Parent.Acp.AcpProtocol)
local _ = require(script.Parent.Parent.createTurnHandle)
local _ = require(script.Parent.Parent.types)
local config = {
	agent_message = true,
	agent_message_chunk = true,
	tool_call_update = true,
	tool_call_content_chunk = true,
	state_change = true
}

local function _(p1)
	local SequenceId = p1.sequenceId
	
	return if typeof(SequenceId) == "number" then SequenceId else nil
end

local _ = function(p1): boolean
	-- upvalues: config (copy)
	local SessionUpdate = p1.sessionUpdate
	
	return typeof(SessionUpdate) == "string" and config[SessionUpdate] == true
end

local function orderHistoryItems(List)
	local List1 = {}
	
	for OriginalIndex, Update in List do
		local SequenceId = Update.sequenceId
		table.insert(List1, {
			update = Update,
			originalIndex = OriginalIndex,
			sequenceId = if typeof(SequenceId) == "number" then SequenceId else nil
		})
	end
	table.sort(List1, function(A, B): boolean
		return if A.sequenceId == nil or B.sequenceId == nil then A.originalIndex < B.originalIndex else A.sequenceId < B.sequenceId
	end)
	
	return List1
end

return {
	ingestSessionHistory = function(p1, SessionId, p2, p3)
		-- upvalues: orderHistoryItems (copy), config (copy), AcpProtocolModule (copy)
		assert(typeof(SessionId) == "string" and SessionId ~= "", "sessionId is required")
		local ActiveTurnInternals = p1.getActiveTurnInternals(SessionId)
		
		if ActiveTurnInternals == nil then
			return false
		end
		local v1 = false
		
		for _, value in orderHistoryItems(p2) do
			local SequenceId = value.sequenceId
			
			if SequenceId ~= nil and (p3 == nil or p3 < SequenceId) then
				local SessionUpdate = value.update.sessionUpdate
				
				if typeof(SessionUpdate) == "string" and config[SessionUpdate] == true then
					local DispatchFrameResult = ActiveTurnInternals.dispatchFrame({
						kind = "notification",
						notification = {
							method = AcpProtocolModule.Notifications.SessionUpdate,
							params = { sessionId = SessionId, update = value.update }
						}
					}, { sequenceNumber = SequenceId }, false)
					v1 = v1 or DispatchFrameResult
					
					if ActiveTurnInternals.isDone() then
						p1.onTurnDone(ActiveTurnInternals)
						
						return v1
					end
				end
			end
		end
		return v1
	end
}