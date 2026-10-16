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

local function _(p1) --[[ Line: 18 | Named "getHistorySequenceId" ]]
	local SequenceId = p1.sequenceId
	
	return if typeof(SequenceId) == "number" then SequenceId else nil
end

local _ = function(p1): boolean --[[ Line: 23 | Named "isAssistantSessionUpdate" ]]
	-- upvalues: config (copy)
	local SessionUpdate = p1.sessionUpdate
	
	return typeof(SessionUpdate) == "string" and config[SessionUpdate] == true
end

local function orderHistoryItems(List) --[[ Line: 34 ]]
	local List1 = {}
	
	for OriginalIndex, Update in List do
		local SequenceId = Update.sequenceId
		table.insert(List1, {
			update = Update,
			originalIndex = OriginalIndex,
			sequenceId = if typeof(SequenceId) == "number" then SequenceId else nil
		})
	end
	table.sort(List1, function(A, B): boolean --[[ Line: 44 ]]
		return if A.sequenceId == nil or B.sequenceId == nil then A.originalIndex < B.originalIndex else A.sequenceId < B.sequenceId
	end)
	
	return List1
end

return {
	ingestSessionHistory = function(p1, SessionId, p2, p3) --[[ Line: 59 ]]
		-- upvalues: orderHistoryItems (copy), config (copy), AcpProtocolModule (copy)
		assert(typeof(SessionId) == "string" and SessionId ~= "", "sessionId is required")
		local ActiveTurnInternals = p1.getActiveTurnInternals(SessionId)
		
		if ActiveTurnInternals == nil then
			return {}
		end
		local List = {}
		
		for _, value in orderHistoryItems(p2) do
			local SequenceId = value.sequenceId
			
			if SequenceId ~= nil and (p3 == nil or p3 < SequenceId) then
				local SessionUpdate = value.update.sessionUpdate
				local IsEntry: boolean = typeof(SessionUpdate) == "string" and config[SessionUpdate] == true
				
				if if IsEntry then ActiveTurnInternals.dispatchFrame({
					kind = "notification",
					notification = {
						method = AcpProtocolModule.Notifications.SessionUpdate,
						params = { sessionId = SessionId, update = value.update }
					}
				}, { sequenceNumber = SequenceId }, false) else ActiveTurnInternals.noteProcessedSequenceNumber(SequenceId) then
					table.insert(List, SequenceId)
				end
				if ActiveTurnInternals.isDone() then
					p1.onTurnDone(ActiveTurnInternals)
					
					return List
				end
			end
		end
		return List
	end
}