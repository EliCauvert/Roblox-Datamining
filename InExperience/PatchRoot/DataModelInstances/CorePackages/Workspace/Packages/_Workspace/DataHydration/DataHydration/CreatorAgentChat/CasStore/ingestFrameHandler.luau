local acpProtocolModule = require(script.Parent.Parent.Acp.AcpProtocol)
local _ = require(script.Parent.Parent.createTurnHandle)
local _ = require(script.Parent.Parent.types)

return {
	ingestFrame = function(p1, p2, p3)
		-- upvalues: acpProtocolModule (ref)
		local activeTurnBySession
		assert(p2 and (if p2.kind ~= "notification" then p2.kind == "response" else true), "ingestFrame requires an IncomingFrame")
		local _ = nil
		
		if p2.kind == "notification" then
			local sessionId = p2.notification.params and p2.notification.params.sessionId
			
			if typeof(sessionId) ~= "string" or sessionId == "" then
				warn(("[CAS] dropped notification without sessionId: %s"):format(p2.notification.method))
				
				return
			elseif p2.notification.method == acpProtocolModule.Notifications.SessionUpdate then
				local update = p2.notification.params and p2.notification.params.update
				local var1 = if p3 ~= nil then nil else p3.sequenceNumber
				
				if update ~= nil and typeof(var1) == "number" then
					local sessionByCasSessionId = p1.getSessionByCasSessionId(sessionId)
					
					if sessionByCasSessionId == nil then
						local universeId = p2.notification.params and p2.notification.params.universeId
						
						if typeof(universeId) == "number" then
							sessionByCasSessionId = p1.getSessionForProject(universeId, nil, sessionId)
						end
					end
					if sessionByCasSessionId ~= nil then
						sessionByCasSessionId.ingestRealtimeUpdate(update, var1)
					end
				end
			end
			activeTurnBySession = p1.getActiveTurnBySession(sessionId)
			
			if activeTurnBySession == nil then return end
		else
			local id = p2.response.id
			
			if id == nil then
				warn("[CAS] dropped response frame with no id")
				
				return
			end
			local var2 = tostring(id)
			activeTurnBySession = p1.getActiveTurnByRequestId(var2)
			
			if activeTurnBySession == nil then
				p1.logger:debug(`[CAS] no active handle for response id={var2}`)
				
				return
			elseif activeTurnBySession == nil then return end
			activeTurnBySession.dispatchFrame(p2, p3)
			
			if activeTurnBySession.isDone() then
				p1.onTurnDone(activeTurnBySession)
			end
		end
	end
}