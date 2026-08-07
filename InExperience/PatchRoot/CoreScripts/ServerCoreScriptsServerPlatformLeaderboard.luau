local corePackagesService = game:GetService("CorePackages")

if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagPlatformLeaderboardRccEnabled then
	local platformLeaderboardsRccModule = require(corePackagesService.Workspace.Packages.PlatformLeaderboardsRcc)
	local var2 = assert(platformLeaderboardsRccModule.PlatformLeaderboardFetcher)
	assert(platformLeaderboardsRccModule.PlatformLeaderboardController).new(assert(platformLeaderboardsRccModule.PlatformLeaderboardConfigService).new(var2), var2):initialize()
	
	return
end