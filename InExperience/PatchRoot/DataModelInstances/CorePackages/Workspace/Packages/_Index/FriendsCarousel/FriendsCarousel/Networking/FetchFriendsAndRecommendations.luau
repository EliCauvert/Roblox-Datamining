local userInputService = game:GetService("UserInputService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local dependenciesModule = require(parent.dependencies)
local thirdPartyUserService = game:GetService("ThirdPartyUserService")
local networkingFriends = dependenciesModule.NetworkingFriends
local networkingAliases = dependenciesModule.NetworkingAliases
local roduxFriends = dependenciesModule.RoduxFriends
local roduxAnalytics = dependenciesModule.RoduxAnalytics
local promise = dependenciesModule.Promise
local dash = dependenciesModule.Dash
local showRecommendationsModule = require(parent.Utils.showRecommendations)
local eventNames = require(parent.Analytics).EventNames
local analytics = require(parent.Analytics).Analytics
local fetchNamesModule = require(parent.Analytics.FetchNames)
local retrievalStatus = require(parent_1.UIBlox).App.Loading.Enum.RetrievalStatus
local userSortsModule = require(parent.Common.UserSorts)
local RECOMMENDATION_SESSION_ID_KEY = require(parent.Common.Constants).RECOMMENDATION_SESSION_ID_KEY
local socialCommon = dependenciesModule.SocialCommon
local recommendationSourceEnum = socialCommon.Enums.RecommendationSourceEnum
local contextualInfoTypes = socialCommon.Enums.ContextualInfoTypes
local timers = require(parent_1.SocialLuaAnalytics).Analytics.Timing.Timers
local var1 = dependenciesModule.logger:new("FriendsCarousel/" .. script.Name)
local isSubjectToDesktopPolicies = dependenciesModule.isSubjectToDesktopPolicies
local fFlagEnableRecommendationsForPCGDK = require(parent_1.SharedFlags).FFlagEnableRecommendationsForPCGDK
local fFlagFixIsConsoleCheckForSocialCarousel = require(parent_1.SharedFlags).FFlagFixIsConsoleCheckForSocialCarousel
local fFlagSocialCarouselMigrateRecommendations = require(parent_1.SharedFlags).FFlagSocialCarouselMigrateRecommendations

local var2 = function(_)
	-- upvalues: showRecommendationsModule (ref), isSubjectToDesktopPolicies (ref), fFlagEnableRecommendationsForPCGDK (ref), thirdPartyUserService (ref), fFlagFixIsConsoleCheckForSocialCarousel (ref), userInputService (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 3
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end

local var3 = 0

return function(p1)
	-- upvalues: analytics (ref), timers (ref), networkingFriends (ref), userSortsModule (ref), var3 (write), dash (ref), eventNames (ref), retrievalStatus (ref), fetchNamesModule (ref), networkingAliases (ref), promise (ref), var1 (ref), var2 (ref), fFlagSocialCarouselMigrateRecommendations (ref), contextualInfoTypes (ref), roduxFriends (ref), recommendationSourceEnum (ref), roduxAnalytics (ref), RECOMMENDATION_SESSION_ID_KEY (ref)
	return function(p2)
		-- upvalues: analytics (copy), timers (copy), networkingFriends (copy), userSortsModule (copy), var3 (copy), p1 (ref), dash (copy), eventNames (copy), retrievalStatus (copy), fetchNamesModule (copy), networkingAliases (copy), promise (copy), var1 (copy), var2 (copy), fFlagSocialCarouselMigrateRecommendations (copy), contextualInfoTypes (copy), roduxFriends (copy), recommendationSourceEnum (copy), roduxAnalytics (copy), RECOMMENDATION_SESSION_ID_KEY (copy)
		local var4 = tostring(p2:getState().LocalUserId)
		local fireAnalyticsEvent = analytics({ infoForAllEvents = { uid = var4 } }).fireAnalyticsEvent
		local var5 = timers()
		local var6 = var5.start()
		
		return p2:dispatch(networkingFriends.GetFriendsFromUserId.API(var4, { userSort = userSortsModule.StatusFrequents })):andThen(function(p3)
			-- upvalues: var3 (copy), p1 (copy), dash (copy), var5 (ref), var6 (ref), fireAnalyticsEvent (ref), eventNames (copy), retrievalStatus (copy), fetchNamesModule (copy), p2 (ref), networkingAliases (copy), promise (copy), var1 (copy), var2 (copy), fFlagSocialCarouselMigrateRecommendations (copy), networkingFriends (copy), var4 (ref), contextualInfoTypes (copy), roduxFriends (copy), recommendationSourceEnum (copy), roduxAnalytics (copy), RECOMMENDATION_SESSION_ID_KEY (copy)
			local data = p3.responseBody.data
			local var7 = if data then #data else 0
			var3 = if p1 and p1.refresh then var3 + 1 else var3
			local var8 = if data then dash.map(data, function(p4)
				return p4.id
			end) else {}
			fireAnalyticsEvent(eventNames.FriendsEndpointLoadingTime, {
				status = retrievalStatus.Done.rawValue(),
				loadingTime = var5.stop(var6),
				fetch = fetchNamesModule.OldAllFriends
			})
			p2:dispatch(networkingAliases.GetTagsFromUserIds.API(var8)):andThen(function()
				-- upvalues: promise (copy)
				return promise.resolve()
			end):catch(function(p4)
				-- upvalues: var1 (copy)
				var1:info(`GetTagsFromUserIds failed: {p4}`)
			end)
			
			if var2(var7) and not fFlagSocialCarouselMigrateRecommendations then
				p2:dispatch(networkingFriends.GetFriendRecommendationsFromUserId.API({ targetUserId = var4 })):andThen(function(p4)
					-- upvalues: dash (copy), contextualInfoTypes (copy), p2 (copy), roduxFriends (copy), recommendationSourceEnum (copy), roduxAnalytics (copy), RECOMMENDATION_SESSION_ID_KEY (copy), promise (copy), fireAnalyticsEvent (copy), eventNames (copy), var7 (ref), var3 (copy)
					p2:dispatch(roduxFriends.Actions.RecommendationSourceCreated({
						source = recommendationSourceEnum.HomepageFriendsCarousel,
						recommendationIds = dash.map(p4.responseBody.data, function(p5)
							-- upvalues: contextualInfoTypes (copy)
							return if p5.contextType == contextualInfoTypes.Contacts then p5.contactId else p5.id
						end)
					}))
					p2:dispatch(roduxAnalytics.Actions.SessionIdUpdated({
						sessionKey = RECOMMENDATION_SESSION_ID_KEY,
						sessionId = p4.responseBody.recommendationRequestId
					}))
					
					return promise.resolve(p4):andThen(function(p5)
						-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var7 (copy), var3 (copy)
						if fireAnalyticsEvent then
							local data = p5.responseBody.data
							fireAnalyticsEvent(eventNames.CarouselLoadedWithUsers, {
								recommendationLimit = true,
								fetchedRecommendations = true,
								friendCount = var7,
								recommendationCount = if data then #data else 0,
								refreshCount = var3,
								recommendationSessionId = p5.responseBody.recommendationRequestId
							})
						end
					end)
				end):catch(function(p4)
					-- upvalues: var1 (copy)
					var1:info(`GetFriendRecommendationsFromUserId failed: {p4}`)
				end)
			elseif fireAnalyticsEvent then
				fireAnalyticsEvent(eventNames.CarouselLoadedWithUsers, {
					recommendationCount = 0,
					recommendationLimit = true,
					fetchedRecommendations = false,
					friendCount = var7,
					refreshCount = var3
				})
			end
			return promise.resolve(data)
		end)
	end
end