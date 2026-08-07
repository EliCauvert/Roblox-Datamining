local sessionTypeModule = require(script.Parent.SessionType)

return function(p0, p1, p2) --[[ line: 8 ]]
	-- upvalues: sessionTypeModule (ref)
	assert(p0, "sessionManager can't be nil")
	p0:RemoveSessionsWithMetadataKey(sessionTypeModule.Metadata.GamePlay.GamePlaySession)
	p0:SetSession(sessionTypeModule.StructuralIdentifier.Level1, p1, p1)
	p0:SetMetadata(p1, sessionTypeModule.Metadata.GamePlay.GamePlaySession, "True")
	
	if p2 then
		p0:SetMetadata(p1, sessionTypeModule.Metadata.GamePlay.DeleteOnGameLeave, "True")
	end
end