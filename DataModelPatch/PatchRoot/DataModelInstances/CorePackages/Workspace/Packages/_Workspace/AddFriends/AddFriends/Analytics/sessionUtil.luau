local HttpService = game:GetService("HttpService")
local SessionService = game:GetService("SessionService")
local SessionType = require(script:FindFirstAncestor("AddFriends").Parent.RobloxAppSessionization).SessionType

return {
	initializeSession = function()
		-- upvalues: HttpService (copy), SessionService (copy), SessionType (copy)
		local Guid = HttpService:GenerateGUID(false)
		SessionService:SetSession(SessionType.StructuralIdentifier.Level2a, SessionType.StructuralIdentifier.AddFriendsPage, SessionType.StructuralIdentifier.AddFriendsPage)
		SessionService:SetMetadata(SessionType.StructuralIdentifier.AddFriendsPage, SessionType.Metadata.AddFriendsPage.AddFriendsSessionId, Guid)
		
		return Guid
	end,
	getSessionId = function()
		-- upvalues: SessionService (copy), SessionType (copy)
		return if SessionService:SessionExists(SessionType.StructuralIdentifier.AddFriendsPage) then SessionService:GetMetadata(SessionType.StructuralIdentifier.AddFriendsPage, SessionType.Metadata.AddFriendsPage.AddFriendsSessionId) else ""
	end,
	destroySession = function()
		-- upvalues: SessionService (copy), SessionType (copy)
		SessionService:RemoveSession(SessionType.StructuralIdentifier.AddFriendsPage)
	end
}