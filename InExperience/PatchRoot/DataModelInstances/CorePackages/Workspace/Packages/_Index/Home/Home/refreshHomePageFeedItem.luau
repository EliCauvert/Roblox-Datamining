local Home = script:FindFirstAncestor("Home")
local Parent = Home.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.SduiCoreSystem)
local SduiLoadTimer = require(Parent.SduiSharedUtilities).SduiLoadTimer
local FetchHomePageModule = require(Home.fetchHomePage)

return function(TopicId, FeedItemKey, RequestIntent, ReportError, p1)
	-- upvalues: SduiLoadTimer (copy), AppPage (copy), FetchHomePageModule (copy), PromiseModule (copy)
	local LoadTimer = SduiLoadTimer.createLoadTimer(AppPage.Home)
	LoadTimer.start("feed-item-refresh")
	
	return FetchHomePageModule(LoadTimer, {
		requestIntent = RequestIntent,
		contextualFeatures = p1.contextFeatures,
		focusedRefresh = {
			topicId = TopicId,
			feedItemKey = FeedItemKey,
			reportError = ReportError
		}
	}):andThen(function(Result)
		-- upvalues: LoadTimer (copy)
		LoadTimer.logRefreshComplete()
		
		return Result
	end, function(p2)
		-- upvalues: LoadTimer (copy), PromiseModule (upval)
		LoadTimer.logRefreshComplete()
		
		return PromiseModule.reject(p2)
	end)
end