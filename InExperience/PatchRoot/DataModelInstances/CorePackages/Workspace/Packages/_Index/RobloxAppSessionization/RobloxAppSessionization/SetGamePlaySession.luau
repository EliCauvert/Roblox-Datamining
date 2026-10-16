local SessionTypeModule = require(script.Parent.SessionType)

return function(SessionService, ChildSid, p1) --[[ Line: 8 ]]
	-- upvalues: SessionTypeModule (copy)
	assert(SessionService, "sessionManager can't be nil")
	SessionService:RemoveSessionsWithMetadataKey(SessionTypeModule.Metadata.GamePlay.GamePlaySession)
	SessionService:SetSession(SessionTypeModule.StructuralIdentifier.Level1, ChildSid, ChildSid)
	SessionService:SetMetadata(ChildSid, SessionTypeModule.Metadata.GamePlay.GamePlaySession, "True")
	
	if p1 then
		SessionService:SetMetadata(ChildSid, SessionTypeModule.Metadata.GamePlay.DeleteOnGameLeave, "True")
	end
end