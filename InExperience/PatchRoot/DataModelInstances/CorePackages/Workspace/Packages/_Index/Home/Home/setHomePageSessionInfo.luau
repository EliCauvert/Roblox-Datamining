local sessionType = require(script:FindFirstAncestor("Home").Parent.RobloxAppSessionization).SessionType

return function(value, p1, p2)
	-- upvalues: sessionType (ref)
	if value == nil then return end
	value:SetSession(sessionType.StructuralIdentifier.Level1, sessionType.StructuralIdentifier.HomePageSessionInfo, sessionType.StructuralIdentifier.HomePageSessionInfo)
	
	if p1 then
		value:SetMetadata(sessionType.StructuralIdentifier.HomePageSessionInfo, sessionType.Metadata.HomePageSessionInfo.RequestId, p1)
	end
	if p2 then
		value:SetMetadata(sessionType.StructuralIdentifier.HomePageSessionInfo, sessionType.Metadata.HomePageSessionInfo.OmniSessionId, p2)
	end
end