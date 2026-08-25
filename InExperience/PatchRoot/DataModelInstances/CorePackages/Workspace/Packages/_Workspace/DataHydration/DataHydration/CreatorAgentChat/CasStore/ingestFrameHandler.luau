local acpProtocolModule = require(script.Parent.Parent.Acp.AcpProtocol)
local _ = require(script.Parent.Parent.createTurnHandle)
local _ = require(script.Parent.Parent.types)

return {
	ingestFrame = function(p0, p1, p2)
		-- upvalues: acpProtocolModule (ref)
		local activeTurnBySession
		assert(p1 and (if p1.kind ~= "notification" then p1.kind == "response" else true), "ingestFrame requires an IncomingFrame")
		local _ = nil
		
		if p1.kind == "notification" then
			local sessionId = p1.notification.params and p1.notification.params.sessionId
			
			if typeof(sessionId) ~= "string" or sessionId == "" then
				warn(("[CAS] dropped notification without sessionId: %s"):format(p1.notification.method))
				
				return
			elseif p1.notification.method == acpProtocolModule.Notifications.SessionUpdate then
				local update = p1.notification.params and p1.notification.params.update
				local var3 = if p2 ~= nil then nil else p2.sequenceNumber
				
				if update ~= nil and typeof(var3) == "number" then
					local sessionByCasSessionId = p0.getSessionByCasSessionId(sessionId)
					
					if sessionByCasSessionId == nil then
						local universeId = p1.notification.params and p1.notification.params.universeId
						
						if typeof(universeId) == "number" then
							sessionByCasSessionId = p0.getSessionForProject(universeId, nil, sessionId)
						end
					end
					if sessionByCasSessionId ~= nil then
						sessionByCasSessionId.ingestRealtimeUpdate(update, var3)
					end
				end
			end
			activeTurnBySession = p0.getActiveTurnBySession(sessionId)
			
			if activeTurnBySession == nil then return end
		else
			local id = p1.response.id
			
			if id == nil then
				warn("[CAS] dropped response frame with no id")
				
				return
			end
			local var7 = tostring(id)
			activeTurnBySession = p0.getActiveTurnByRequestId(var7)
			
			if activeTurnBySession == nil then
				p0.logger:debug(`[CAS] no active handle for response id={var7}`)
				
				return
			elseif activeTurnBySession == nil then return end
			activeTurnBySession.dispatchFrame(p1, p2)
			
			if activeTurnBySession.isDone() then
				p0.onTurnDone(activeTurnBySession)
			end
		end
	end
}