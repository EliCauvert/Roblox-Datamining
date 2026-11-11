local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local NetworkingFriends = DependenciesModule.NetworkingFriends
local NetworkingAliases = DependenciesModule.NetworkingAliases
local RoduxFriends = DependenciesModule.RoduxFriends
local RoduxAnalytics = DependenciesModule.RoduxAnalytics
local Promise = DependenciesModule.Promise
local Dash = DependenciesModule.Dash
local ShowRecommendationsModule = require(Parent.Utils.showRecommendations)
local EventNames = require(Parent.Analytics).EventNames
local AnalyticsFunction = require(Parent.Analytics).Analytics
local FetchNamesModule = require(Parent.Analytics.FetchNames)
local RetrievalStatus = require(Parent1.UIBlox).App.Loading.Enum.RetrievalStatus
local UserSortsModule = require(Parent.Common.UserSorts)
local RECOMMENDATIONSESSIONIDKEY = require(Parent.Common.Constants).RECOMMENDATION_SESSION_ID_KEY
local SocialCommon = DependenciesModule.SocialCommon
local RecommendationSourceEnum = SocialCommon.Enums.RecommendationSourceEnum
local ContextualInfoTypes = SocialCommon.Enums.ContextualInfoTypes
local TimersFunction = require(Parent1.SocialLuaAnalytics).Analytics.Timing.Timers
local NewResult = DependenciesModule.logger:new("FriendsCarousel/" .. script.Name)
local IsSubjectToDesktopPoliciesFunction = DependenciesModule.isSubjectToDesktopPolicies
local FFlagEnableRecommendationsForPCGDK = require(Parent1.SharedFlags).FFlagEnableRecommendationsForPCGDK
local FFlagFixIsConsoleCheckForSocialCarousel = require(Parent1.SharedFlags).FFlagFixIsConsoleCheckForSocialCarousel

local function v23(Count)
	-- upvalues: ShowRecommendationsModule (copy), IsSubjectToDesktopPoliciesFunction (copy), FFlagEnableRecommendationsForPCGDK (copy), ThirdPartyUserService (copy), FFlagFixIsConsoleCheckForSocialCarousel (copy), UserInputService (copy)
	return ShowRecommendationsModule(Count) and not IsSubjectToDesktopPoliciesFunction() or (ShowRecommendationsModule(Count) and FFlagEnableRecommendationsForPCGDK and ThirdPartyUserService and ThirdPartyUserService:HaveActiveUser() or ShowRecommendationsModule(Count) and (FFlagFixIsConsoleCheckForSocialCarousel and UserInputService.PreferredInput == Enum.PreferredInput.Gamepad))
end

local RefreshCount = 0

return function(p1)
	-- upvalues: AnalyticsFunction (copy), TimersFunction (copy), NetworkingFriends (copy), UserSortsModule (copy), RefreshCount (ref), Dash (copy), EventNames (copy), RetrievalStatus (copy), FetchNamesModule (copy), NetworkingAliases (copy), Promise (copy), NewResult (copy), v23 (copy), ContextualInfoTypes (copy), RoduxFriends (copy), RecommendationSourceEnum (copy), RoduxAnalytics (copy), RECOMMENDATIONSESSIONIDKEY (copy)
	return function(p2)
		-- upvalues: AnalyticsFunction (upval), TimersFunction (upval), NetworkingFriends (upval), UserSortsModule (upval), RefreshCount (upval), p1 (copy), Dash (upval), EventNames (upval), RetrievalStatus (upval), FetchNamesModule (upval), NetworkingAliases (upval), Promise (upval), NewResult (upval), v23 (upval), ContextualInfoTypes (upval), RoduxFriends (upval), RecommendationSourceEnum (upval), RoduxAnalytics (upval), RECOMMENDATIONSESSIONIDKEY (upval)
		local Text = tostring(p2:getState().LocalUserId)
		local FireAnalyticsEventFunction = AnalyticsFunction({ infoForAllEvents = { uid = Text } }).fireAnalyticsEvent
		local TimersResult = TimersFunction()
		local StartResult = TimersResult.start()
		
		return p2:dispatch(NetworkingFriends.GetFriendsFromUserId.API(Text, { userSort = UserSortsModule.StatusFrequents })):andThen(function(Result)
			-- upvalues: RefreshCount (upval), p1 (upval), Dash (upval), TimersResult (copy), StartResult (copy), FireAnalyticsEventFunction (copy), EventNames (upval), RetrievalStatus (upval), FetchNamesModule (upval), p2 (copy), NetworkingAliases (upval), Promise (upval), NewResult (upval), v23 (upval), NetworkingFriends (upval), Text (copy), ContextualInfoTypes (upval), RoduxFriends (upval), RecommendationSourceEnum (upval), RoduxAnalytics (upval), RECOMMENDATIONSESSIONIDKEY (upval)
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
			
			if v23(CountData) then
				p2:dispatch(NetworkingFriends.GetFriendRecommendationsFromUserId.API({ targetUserId = Text })):andThen(function(Result)
					-- upvalues: Dash (upval), ContextualInfoTypes (upval), p2 (upval), RoduxFriends (upval), RecommendationSourceEnum (upval), RoduxAnalytics (upval), RECOMMENDATIONSESSIONIDKEY (upval), Promise (upval), FireAnalyticsEventFunction (upval), EventNames (upval), CountData (copy), RefreshCount (upval)
					p2:dispatch(RoduxFriends.Actions.RecommendationSourceCreated({
						source = RecommendationSourceEnum.HomepageFriendsCarousel,
						recommendationIds = Dash.map(Result.responseBody.data, function(p3)
							-- upvalues: ContextualInfoTypes (upval)
							return if p3.contextType == ContextualInfoTypes.Contacts then p3.contactId else p3.id
						end)
					}))
					p2:dispatch(RoduxAnalytics.Actions.SessionIdUpdated({
						sessionKey = RECOMMENDATIONSESSIONIDKEY,
						sessionId = Result.responseBody.recommendationRequestId
					}))
					
					return Promise.resolve(Result):andThen(function(Result)
						-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), CountData (upval), RefreshCount (upval)
						if FireAnalyticsEventFunction then
							local Data = Result.responseBody.data
							FireAnalyticsEventFunction(EventNames.CarouselLoadedWithUsers, {
								recommendationLimit = true,
								fetchedRecommendations = true,
								friendCount = CountData,
								recommendationCount = Data and #Data or 0,
								refreshCount = RefreshCount,
								recommendationSessionId = Result.responseBody.recommendationRequestId
							})
						end
					end)
				end):catch(function(Err)
					-- upvalues: NewResult (upval)
					NewResult:info(`GetFriendRecommendationsFromUserId failed: {Err}`)
				end)
			elseif FireAnalyticsEventFunction then
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