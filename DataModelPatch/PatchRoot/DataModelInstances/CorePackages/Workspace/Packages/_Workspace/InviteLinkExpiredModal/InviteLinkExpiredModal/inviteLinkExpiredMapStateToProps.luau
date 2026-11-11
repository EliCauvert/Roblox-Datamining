local DependenciesModule = require(script:FindFirstAncestor("InviteLinkExpiredModal").dependencies)
local NetworkingGames = DependenciesModule.NetworkingGames
local NetworkStatus = DependenciesModule.RoduxNetworking.Enum.NetworkStatus
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue

return function(p1, p2)
	-- upvalues: GetDeepValueFunction (copy), NetworkingGames (copy), NetworkStatus (copy)
	local UniverseId = p2.universeId
	
	return {
		experienceName = GetDeepValueFunction(p1, string.format("InviteLinkExpiredModal.Games.byGameId.%s.name", UniverseId)),
		isLoading = #UniverseId > 0 and NetworkingGames.GetExperiencesDetails.getStatus(p1, UniverseId) == NetworkStatus.Fetching,
		screenSize = p1.ScreenSize
	}
end