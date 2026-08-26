local corePackagesService = game:GetService("CorePackages")

if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagPlatformLeaderboardRccEnabled then
	local platformLeaderboardsRccModule = require(corePackagesService.Workspace.Packages.PlatformLeaderboardsRcc)
	local var1 = assert(platformLeaderboardsRccModule.PlatformLeaderboardFetcher)
	assert(platformLeaderboardsRccModule.PlatformLeaderboardController).new(assert(platformLeaderboardsRccModule.PlatformLeaderboardConfigService).new(var1), var1):initialize()
	
	return
end