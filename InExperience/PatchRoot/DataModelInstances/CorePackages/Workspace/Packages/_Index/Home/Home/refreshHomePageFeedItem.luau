local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local promiseModule = require(parent.Promise)
local _ = require(parent.SduiCoreSystem)
local sduiLoadTimer = require(parent.SduiSharedUtilities).SduiLoadTimer
local fetchHomePageModule = require(home.fetchHomePage)

return function(p1, p2, p3, p4, p5)
	-- upvalues: sduiLoadTimer (ref), appPage (ref), fetchHomePageModule (ref), promiseModule (ref)
	local var1 = sduiLoadTimer.createLoadTimer(appPage.Home)
	var1.start("feed-item-refresh")
	
	return fetchHomePageModule(var1, {
		requestIntent = p3,
		contextualFeatures = p5.contextFeatures,
		focusedRefresh = { topicId = p1, feedItemKey = p2, reportError = p4 }
	}):andThen(function(p6)
		-- upvalues: var1 (ref)
		var1.logRefreshComplete()
		
		return p6
	end, function(p6)
		-- upvalues: var1 (ref), promiseModule (copy)
		var1.logRefreshComplete()
		
		return promiseModule.reject(p6)
	end)
end