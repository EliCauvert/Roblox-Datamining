local AcpProtocolModule = require(script.Parent.Parent.Acp.AcpProtocol)
local _ = require(script.Parent.Parent.createTurnHandle)
local _ = require(script.Parent.Parent.types)

return {
	ingestFrame = function(p1, p2, p3) --[[ Line: 22 ]]
		-- upvalues: AcpProtocolModule (copy)
		assert(p2 and (p2.kind == "notification" or p2.kind == "response"), "ingestFrame requires an IncomingFrame")
		local ActiveTurnBySession = nil
		
		if p2.kind == "notification" then
			local SessionId = p2.notification.params and p2.notification.params.sessionId
			
			if typeof(SessionId) ~= "string" or SessionId == "" then
				warn(("[CAS] dropped notification without sessionId: %s"):format(p2.notification.method))
				
				return
			end
			if p2.notification.method == AcpProtocolModule.Notifications.SessionUpdate then
				local Update = p2.notification.params and p2.notification.params.update
				local SequenceNumber = if p3 == nil then nil else p3.sequenceNumber
				
				if Update ~= nil and typeof(SequenceNumber) == "number" then
					local SessionByCasSessionId = p1.getSessionByCasSessionId(SessionId)
					
					if SessionByCasSessionId == nil then
						local UniverseId = p2.notification.params and p2.notification.params.universeId
						
						if typeof(UniverseId) == "number" then
							SessionByCasSessionId = p1.getSessionForProject(UniverseId, nil, SessionId)
						end
					end
					if SessionByCasSessionId ~= nil then
						SessionByCasSessionId.ingestRealtimeUpdate(Update, SequenceNumber)
					end
				end
			end
			ActiveTurnBySession = p1.getActiveTurnBySession(SessionId)
			
			if ActiveTurnBySession == nil then return end
		else
			local Id = p2.response.id
			
			if Id == nil then
				warn("[CAS] dropped response frame with no id")
				
				return
			end
			local Text = tostring(Id)
			ActiveTurnBySession = p1.getActiveTurnByRequestId(Text)
			
			if ActiveTurnBySession == nil then
				p1.logger:debug(`[CAS] no active handle for response id={Text}`)
				
				return
			end
		end
		local ActiveTurnBySession1 = ActiveTurnBySession
		
		if ActiveTurnBySession1 == nil then return end
		ActiveTurnBySession1.dispatchFrame(p2, p3)
		
		if ActiveTurnBySession1.isDone() then
			p1.onTurnDone(ActiveTurnBySession1)
		end
	end
}