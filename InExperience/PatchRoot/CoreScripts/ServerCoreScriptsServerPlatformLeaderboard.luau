local CorePackages = game:GetService("CorePackages")

if require(CorePackages.Workspace.Packages.SharedFlags).FFlagPlatformLeaderboardRccEnabled then
	local PlatformLeaderboardsRccModule = require(CorePackages.Workspace.Packages.PlatformLeaderboardsRcc)
	local v1 = assert(PlatformLeaderboardsRccModule.PlatformLeaderboardFetcher)
	assert(PlatformLeaderboardsRccModule.PlatformLeaderboardController).new(assert(PlatformLeaderboardsRccModule.PlatformLeaderboardConfigService).new(v1), v1):initialize()
	
	return
end