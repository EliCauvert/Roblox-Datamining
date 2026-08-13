local sessionType = require(script:FindFirstAncestor("Home").Parent.RobloxAppSessionization).SessionType

return function(value, p0, p1) --[[ line: 6 | named "setHomePageSessionInfo" ]]
	-- upvalues: sessionType (ref)
	if value == nil then return end
	value:SetSession(sessionType.StructuralIdentifier.Level1, sessionType.StructuralIdentifier.HomePageSessionInfo, sessionType.StructuralIdentifier.HomePageSessionInfo)
	
	if p0 then
		value:SetMetadata(sessionType.StructuralIdentifier.HomePageSessionInfo, sessionType.Metadata.HomePageSessionInfo.RequestId, p0)
	end
	if p1 then
		value:SetMetadata(sessionType.StructuralIdentifier.HomePageSessionInfo, sessionType.Metadata.HomePageSessionInfo.OmniSessionId, p1)
	end
end