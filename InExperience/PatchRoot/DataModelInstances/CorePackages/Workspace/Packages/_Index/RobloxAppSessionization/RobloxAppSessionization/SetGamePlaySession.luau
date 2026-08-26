local sessionTypeModule = require(script.Parent.SessionType)

return function(p1, p2, p3)
	-- upvalues: sessionTypeModule (ref)
	assert(p1, "sessionManager can't be nil")
	p1:RemoveSessionsWithMetadataKey(sessionTypeModule.Metadata.GamePlay.GamePlaySession)
	p1:SetSession(sessionTypeModule.StructuralIdentifier.Level1, p2, p2)
	p1:SetMetadata(p2, sessionTypeModule.Metadata.GamePlay.GamePlaySession, "True")
	
	if p3 then
		p1:SetMetadata(p2, sessionTypeModule.Metadata.GamePlay.DeleteOnGameLeave, "True")
	end
end