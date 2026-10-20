local Home = script:FindFirstAncestor("Home")
local Parent = Home.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local FetchHomePageModule = require(Home.fetchHomePage)
local GetSiteMessageStoreFunction = require(Parent.SiteMessageStore).GetSiteMessageStore

return function(RequestIntent, ContextualFeatures, Enabled)
	-- upvalues: GetSiteMessageStoreFunction (copy), SduiSharedUtilitiesModule (copy), AppPage (copy), FetchHomePageModule (copy)
	if Enabled ~= false then
		GetSiteMessageStoreFunction(false).refreshSiteAlertInfo()
	end
	local LoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(AppPage.Home)
	LoadTimer.start("refresh")
	local HomePageModule = FetchHomePageModule(LoadTimer, {
		forceRefresh = true,
		requestIntent = RequestIntent,
		contextualFeatures = ContextualFeatures
	})
	
	return if HomePageModule then HomePageModule:finally(function()
		-- upvalues: LoadTimer (copy)
		LoadTimer.logRefreshComplete()
	end) else nil
end