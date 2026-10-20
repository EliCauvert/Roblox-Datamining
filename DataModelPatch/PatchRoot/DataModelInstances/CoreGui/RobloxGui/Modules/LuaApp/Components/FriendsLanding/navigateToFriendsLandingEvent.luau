local CorePackages = game:GetService("CorePackages")
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local Analytics = require(CorePackages.Workspace.Packages.Analytics).Analytics
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local TModule = require(CorePackages.Packages.t)
local config = {
	homePage = game:DefineFastString("HomePageNavigationFriendsLandingCounter", "HomePageNavigationFriendsLanding"),
	morePage = game:DefineFastString("MorePageNavigationFriendsLandingCounter", "MorePageNavigationFriendsLanding")
}
local StrictInterfaceResult = TModule.strictInterface({
	localUserId = TModule.string,
	context = TModule.string,
	analytics = TModule.optional(TModule.table)
})

return function(p1)
	-- upvalues: StrictInterfaceResult (copy), Analytics (copy), RbxAnalyticsService (copy), config (copy), Logger (copy)
	assert(StrictInterfaceResult(p1))
	local Analytics1 = p1.analytics or Analytics.new(RbxAnalyticsService)
	
	if config[p1.context] then
		Analytics1.EventStream:setRBXEventStream(p1.context, "buttonClick", { btn = "friendsLanding", uid = p1.localUserId })
		Analytics1.Diag:reportCounter(config[p1.context], 1)
		
		return
	else
		Logger:error("Error from navigate: Invalid destination '{}'", p1.context)
	end
end