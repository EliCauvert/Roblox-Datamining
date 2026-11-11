local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Common.Constants)
local DependenciesModule = require(Parent.dependencies)
local Llama = DependenciesModule.llama
local React = DependenciesModule.React
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local EventNamesModule = require(script.Parent.EventNames)
local GetFriendStatusModule = require(script.Parent.getFriendStatus)
local RecommendationContextType = DependenciesModule.RoduxFriends.Enums.RecommendationContextType
local GetFFlagPYMKAddFriendsEntryFunction = DependenciesModule.getFFlagPYMKAddFriendsEntry
local FFlagHomepagePYMKPresenceAnalytics = require(Parent.Parent.SharedFlags).FFlagHomepagePYMKPresenceAnalytics

return function(Callback)
	-- upvalues: React (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), ConstantsModule (copy), FFlagHomepagePYMKPresenceAnalytics (copy), GetFFlagPYMKAddFriendsEntryFunction (copy), EventNamesModule (copy), RecommendationContextType (copy), GetFriendStatusModule (copy), Llama (copy)
	local UseRefResult = React.useRef({})
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueFunction (upval), ConstantsModule (upval)
		return GetDeepValueFunction(p1, string.format("%s.Friends.friendshipStatus", ConstantsModule.RODUX_KEY)) or {}
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueFunction (upval), ConstantsModule (upval)
		return GetDeepValueFunction(p1, string.format("%s.Friends.recommendations.hasIncomingFriendRequest", ConstantsModule.RODUX_KEY))
	end) or {}
	local UseSelectorResult2 = if FFlagHomepagePYMKPresenceAnalytics then UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueFunction (upval)
		return GetDeepValueFunction(p1, "PYMKCarousel.Presence.byUserId") or {}
	end) else nil
	
	return React.useMemo(function()
		-- upvalues: UseRefResult (copy), GetFFlagPYMKAddFriendsEntryFunction (upval), Callback (copy), EventNamesModule (upval), RecommendationContextType (upval), GetFriendStatusModule (upval), UseSelectorResult (copy), UseSelectorResult1 (copy), FFlagHomepagePYMKPresenceAnalytics (upval), UseSelectorResult2 (copy), Llama (upval)
		return {
			{
				viewabilityConfig = {
					itemVisiblePercentThreshold = 50,
					waitForInteraction = false
				},
				onViewableItemsChanged = function(p1)
					-- upvalues: UseRefResult (upval), GetFFlagPYMKAddFriendsEntryFunction (upval), Callback (upval), EventNamesModule (upval), RecommendationContextType (upval), GetFriendStatusModule (upval), UseSelectorResult (upval), UseSelectorResult1 (upval), FFlagHomepagePYMKPresenceAnalytics (upval), UseSelectorResult2 (upval), Llama (upval)
					for _, value in pairs(p1.changed) do
						local Item = value.item
						local Current = UseRefResult.current or {}
						
						if if GetFFlagPYMKAddFriendsEntryFunction() then not Current[Item.id] and (not Item.isTooltip and not Item.isButtonTile) else not Current[Item.id] then
							Callback(EventNamesModule.UserSeen, {
								userId = Item.id,
								contactId = if Item.recommendationContextType == RecommendationContextType.Contacts then Item.id else nil,
								friendStatus = GetFriendStatusModule(UseSelectorResult[Item.id], UseSelectorResult1[Item.id]),
								recommendationContextType = Item.recommendationContextType,
								recommendationRank = Item.recommendationRank,
								absolutePosition = Item.absolutePosition,
								presence = if FFlagHomepagePYMKPresenceAnalytics then (UseSelectorResult2[Item.id] or {}).userPresenceType else nil
							})
							UseRefResult.current = Llama.Dictionary.join(UseRefResult.current, { [Item.id] = true })
						end
					end
				end
			}
		}
	end, {
		if FFlagHomepagePYMKPresenceAnalytics then UseSelectorResult2 else nil
	})
end