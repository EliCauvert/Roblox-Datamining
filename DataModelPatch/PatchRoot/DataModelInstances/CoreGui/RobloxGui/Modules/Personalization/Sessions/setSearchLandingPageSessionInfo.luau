local CorePackages = game:GetService("CorePackages")
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local SearchLandingPageSession = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.Sessions.SearchLandingPageSession

return function(SessionService, p1)
	-- upvalues: SessionType (copy), SearchLandingPageSession (copy)
	if SessionService:SessionExists(SessionType.StructuralIdentifier.SearchLandingPage) then
		if p1 then
			SearchLandingPageSession:Refresh()
		end
	else
		SearchLandingPageSession:Refresh()
		SessionService:SetSession(SessionType.StructuralIdentifier.Level1, SessionType.StructuralIdentifier.SearchLandingPage, SessionType.StructuralIdentifier.SearchLandingPage)
	end
	SessionService:SetMetadata(SessionType.StructuralIdentifier.SearchLandingPage, SessionType.Metadata.SearchLandingPage.SearchLandingPageSessionId, SearchLandingPageSession:Get())
end