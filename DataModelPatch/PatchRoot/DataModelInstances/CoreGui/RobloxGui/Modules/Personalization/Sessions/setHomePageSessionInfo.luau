local SessionType = require(game:GetService("CorePackages").Workspace.Packages.RobloxAppSessionization).SessionType

return function(SessionService, p1, p2)
	-- upvalues: SessionType (copy)
	if SessionService == nil then return end
	SessionService:SetSession(SessionType.StructuralIdentifier.Level1, SessionType.StructuralIdentifier.HomePageSessionInfo, SessionType.StructuralIdentifier.HomePageSessionInfo)
	
	if p1 then
		SessionService:SetMetadata(SessionType.StructuralIdentifier.HomePageSessionInfo, SessionType.Metadata.HomePageSessionInfo.RequestId, p1)
	end
	if p2 then
		SessionService:SetMetadata(SessionType.StructuralIdentifier.HomePageSessionInfo, SessionType.Metadata.HomePageSessionInfo.OmniSessionId, p2)
	end
end