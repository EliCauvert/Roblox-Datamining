local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local fetchHomePageModule = require(home.fetchHomePage)

return function(p1, p2)
	-- upvalues: sduiSharedUtilitiesModule (ref), appPage (ref), fetchHomePageModule (ref)
	local var1 = sduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(appPage.Home)
	var1.start("refresh")
	
	return fetchHomePageModule(var1, {
		forceRefresh = true,
		requestIntent = p1,
		contextualFeatures = p2
	})
end