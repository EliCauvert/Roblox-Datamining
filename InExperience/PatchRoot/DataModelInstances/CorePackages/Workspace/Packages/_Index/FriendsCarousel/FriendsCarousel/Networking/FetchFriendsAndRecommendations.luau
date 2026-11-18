local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local NetworkingFriends = DependenciesModule.NetworkingFriends
local NetworkingAliases = DependenciesModule.NetworkingAliases
local Promise = DependenciesModule.Promise
local Dash = DependenciesModule.Dash
local EventNames = require(Parent.Analytics).EventNames
local AnalyticsFunction = require(Parent.Analytics).Analytics
local FetchNamesModule = require(Parent.Analytics.FetchNames)
local RetrievalStatus = require(Parent1.UIBlox).App.Loading.Enum.RetrievalStatus
local UserSortsModule = require(Parent.Common.UserSorts)
local TimersFunction = require(Parent1.SocialLuaAnalytics).Analytics.Timing.Timers
local NewResult = DependenciesModule.logger:new("FriendsCarousel/" .. script.Name)
local RefreshCount = 0

return function(p1)
	-- upvalues: AnalyticsFunction (copy), TimersFunction (copy), NetworkingFriends (copy), UserSortsModule (copy), RefreshCount (ref), Dash (copy), EventNames (copy), RetrievalStatus (copy), FetchNamesModule (copy), NetworkingAliases (copy), Promise (copy), NewResult (copy)
	return function(p2)
		-- upvalues: AnalyticsFunction (upval), TimersFunction (upval), NetworkingFriends (upval), UserSortsModule (upval), RefreshCount (upval), p1 (copy), Dash (upval), EventNames (upval), RetrievalStatus (upval), FetchNamesModule (upval), NetworkingAliases (upval), Promise (upval), NewResult (upval)
		local Text = tostring(p2:getState().LocalUserId)
		local FireAnalyticsEventFunction = AnalyticsFunction({ infoForAllEvents = { uid = Text } }).fireAnalyticsEvent
		local TimersResult = TimersFunction()
		local StartResult = TimersResult.start()
		
		return p2:dispatch(NetworkingFriends.GetFriendsFromUserId.API(Text, { userSort = UserSortsModule.StatusFrequents })):andThen(function(Result)
			-- upvalues: RefreshCount (upval), p1 (upval), Dash (upval), TimersResult (copy), StartResult (copy), FireAnalyticsEventFunction (copy), EventNames (upval), RetrievalStatus (upval), FetchNamesModule (upval), p2 (copy), NetworkingAliases (upval), Promise (upval), NewResult (upval)
			local Data = Result.responseBody.data
			local CountData: number = Data and #Data or 0
			RefreshCount = if p1 and p1.refresh then RefreshCount + 1 else RefreshCount
			local MapResult = if Data then Dash.map(Data, function(p3)
				return p3.id
			end) else {}
			FireAnalyticsEventFunction(EventNames.FriendsEndpointLoadingTime, {
				status = RetrievalStatus.Done.rawValue(),
				loadingTime = TimersResult.stop(StartResult),
				fetch = FetchNamesModule.OldAllFriends
			})
			p2:dispatch(NetworkingAliases.GetTagsFromUserIds.API(MapResult)):andThen(function()
				-- upvalues: Promise (upval)
				return Promise.resolve()
			end):catch(function(Err)
				-- upvalues: NewResult (upval)
				NewResult:info(`GetTagsFromUserIds failed: {Err}`)
			end)
			
			if FireAnalyticsEventFunction then
				FireAnalyticsEventFunction(EventNames.CarouselLoadedWithUsers, {
					recommendationCount = 0,
					recommendationLimit = true,
					fetchedRecommendations = false,
					friendCount = CountData,
					refreshCount = RefreshCount
				})
			end
			return Promise.resolve(Data)
		end)
	end
end