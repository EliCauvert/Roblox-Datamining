local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local fetchHomePageModule = require(home.fetchHomePage)

return function(p1, p2)
	-- upvalues: sduiSharedUtilitiesModule (ref), appPage (ref), fetchHomePageModule (ref)
	local var1 = sduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(appPage.Home)
	var1.start("refresh")
	local var2 = fetchHomePageModule(var1, {
		forceRefresh = true,
		requestIntent = p1,
		contextualFeatures = p2
	})
	
	return if var2 then var2:finally(function()
		-- upvalues: var1 (ref)
		var1.logRefreshComplete()
	end) else nil
end