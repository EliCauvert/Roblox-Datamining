local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local fetchHomePageModule = require(home.fetchHomePage)

return function(p0, p1) --[[ line: 10 | named "refreshHomePage" ]]
	-- upvalues: sduiSharedUtilitiesModule (ref), appPage (ref), fetchHomePageModule (ref)
	local var3 = sduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(appPage.Home)
	var3.start("refresh")
	
	return fetchHomePageModule(var3, {
		forceRefresh = true,
		requestIntent = p0,
		contextualFeatures = p1
	})
end