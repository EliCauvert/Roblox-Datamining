local SessionType = require(script:FindFirstAncestor("Home").Parent.RobloxAppSessionization).SessionType

return function(SessionService, p1, p2) --[[ Line: 6 | Named "setHomePageSessionInfo" ]]
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