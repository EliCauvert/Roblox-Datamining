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
local var6 = dependenciesModule.logger:new("FriendsCarousel/" .. script.Name)
local isSubjectToDesktopPolicies = dependenciesModule.isSubjectToDesktopPolicies
local fFlagEnableRecommendationsForPCGDK = require(parent_1.SharedFlags).FFlagEnableRecommendationsForPCGDK
local fFlagFixIsConsoleCheckForSocialCarousel = require(parent_1.SharedFlags).FFlagFixIsConsoleCheckForSocialCarousel
local fFlagSocialCarouselMigrateRecommendations = require(parent_1.SharedFlags).FFlagSocialCarouselMigrateRecommendations

local var7 = function(_)
	-- upvalues: showRecommendationsModule (ref), isSubjectToDesktopPolicies (ref), fFlagEnableRecommendationsForPCGDK (ref), thirdPartyUserService (ref), fFlagFixIsConsoleCheckForSocialCarousel (ref), userInputService (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 3
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end

local var8 = 0

return function(p0)
	-- upvalues: analytics (ref), timers (ref), networkingFriends (ref), userSortsModule (ref), var8 (write), dash (ref), eventNames (ref), retrievalStatus (ref), fetchNamesModule (ref), networkingAliases (ref), promise (ref), var6 (ref), var7 (ref), fFlagSocialCarouselMigrateRecommendations (ref), contextualInfoTypes (ref), roduxFriends (ref), recommendationSourceEnum (ref), roduxAnalytics (ref), RECOMMENDATION_SESSION_ID_KEY (ref)
	return function(p1)
		-- upvalues: analytics (copy), timers (copy), networkingFriends (copy), userSortsModule (copy), var8 (copy), p0 (ref), dash (copy), eventNames (copy), retrievalStatus (copy), fetchNamesModule (copy), networkingAliases (copy), promise (copy), var6 (copy), var7 (copy), fFlagSocialCarouselMigrateRecommendations (copy), contextualInfoTypes (copy), roduxFriends (copy), recommendationSourceEnum (copy), roduxAnalytics (copy), RECOMMENDATION_SESSION_ID_KEY (copy)
		local var9 = tostring(p1:getState().LocalUserId)
		local fireAnalyticsEvent = analytics({ infoForAllEvents = { uid = var9 } }).fireAnalyticsEvent
		local var10 = timers()
		local var11 = var10.start()
		
		return p1:dispatch(networkingFriends.GetFriendsFromUserId.API(var9, { userSort = userSortsModule.StatusFrequents })):andThen(function(p2)
			-- upvalues: var8 (copy), p0 (copy), dash (copy), var10 (ref), var11 (ref), fireAnalyticsEvent (ref), eventNames (copy), retrievalStatus (copy), fetchNamesModule (copy), p1 (ref), networkingAliases (copy), promise (copy), var6 (copy), var7 (copy), fFlagSocialCarouselMigrateRecommendations (copy), networkingFriends (copy), var9 (ref), contextualInfoTypes (copy), roduxFriends (copy), recommendationSourceEnum (copy), roduxAnalytics (copy), RECOMMENDATION_SESSION_ID_KEY (copy)
			local data = p2.responseBody.data
			local var12 = if data then #data else 0
			var8 = if p0 and p0.refresh then var8 + 1 else var8
			local var13 = if data then dash.map(data, function(p3)
				return p3.id
			end) else {}
			fireAnalyticsEvent(eventNames.FriendsEndpointLoadingTime, {
				status = retrievalStatus.Done.rawValue(),
				loadingTime = var10.stop(var11),
				fetch = fetchNamesModule.OldAllFriends
			})
			p1:dispatch(networkingAliases.GetTagsFromUserIds.API(var13)):andThen(function()
				-- upvalues: promise (copy)
				return promise.resolve()
			end):catch(function(p4)
				-- upvalues: var6 (copy)
				var6:info(`GetTagsFromUserIds failed: {p4}`)
			end)
			
			if var7(var12) and not fFlagSocialCarouselMigrateRecommendations then
				p1:dispatch(networkingFriends.GetFriendRecommendationsFromUserId.API({ targetUserId = var9 })):andThen(function(p6)
					-- upvalues: dash (copy), contextualInfoTypes (copy), p1 (copy), roduxFriends (copy), recommendationSourceEnum (copy), roduxAnalytics (copy), RECOMMENDATION_SESSION_ID_KEY (copy), promise (copy), fireAnalyticsEvent (copy), eventNames (copy), var12 (ref), var8 (copy)
					p1:dispatch(roduxFriends.Actions.RecommendationSourceCreated({
						source = recommendationSourceEnum.HomepageFriendsCarousel,
						recommendationIds = dash.map(p6.responseBody.data, function(p7)
							-- upvalues: contextualInfoTypes (copy)
							return if p7.contextType == contextualInfoTypes.Contacts then p7.contactId else p7.id
						end)
					}))
					p1:dispatch(roduxAnalytics.Actions.SessionIdUpdated({
						sessionKey = RECOMMENDATION_SESSION_ID_KEY,
						sessionId = p6.responseBody.recommendationRequestId
					}))
					
					return promise.resolve(p6):andThen(function(p8)
						-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var12 (copy), var8 (copy)
						if fireAnalyticsEvent then
							local data = p8.responseBody.data
							fireAnalyticsEvent(eventNames.CarouselLoadedWithUsers, {
								recommendationLimit = true,
								fetchedRecommendations = true,
								friendCount = var12,
								recommendationCount = if data then #data else 0,
								refreshCount = var8,
								recommendationSessionId = p8.responseBody.recommendationRequestId
							})
						end
					end)
				end):catch(function(p5)
					-- upvalues: var6 (copy)
					var6:info(`GetFriendRecommendationsFromUserId failed: {p5}`)
				end)
			elseif fireAnalyticsEvent then
				fireAnalyticsEvent(eventNames.CarouselLoadedWithUsers, {
					recommendationCount = 0,
					recommendationLimit = true,
					fetchedRecommendations = false,
					friendCount = var12,
					refreshCount = var8
				})
			end
			return promise.resolve(data)
		end)
	end
end