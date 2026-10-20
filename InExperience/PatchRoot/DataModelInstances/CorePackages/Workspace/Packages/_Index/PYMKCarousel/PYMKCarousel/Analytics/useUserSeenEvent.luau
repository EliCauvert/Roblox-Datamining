local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
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
local FFlagMigrateFriendshipStatusesPYMKModule = require(Parent.Flags.FFlagMigrateFriendshipStatusesPYMK)
local FFlagLuaAppEnableSduiHomePage = require(Parent1.SharedFlags).FFlagLuaAppEnableSduiHomePage
local GetResult = if FFlagMigrateFriendshipStatusesPYMKModule then require(Parent1.DataHydration).Friends.FriendsStore.get() else nil

local function _(p1)
	-- upvalues: GetResult (copy)
	local FriendshipStatus = GetResult.GetFriendshipStatus(p1, { skipFetch = true })
	
	return if FriendshipStatus then FriendshipStatus.data(false) else nil
end

return function(Callback)
	-- upvalues: React (copy), FFlagMigrateFriendshipStatusesPYMKModule (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), ConstantsModule (copy), FFlagLuaAppEnableSduiHomePage (copy), GetFFlagPYMKAddFriendsEntryFunction (copy), EventNamesModule (copy), RecommendationContextType (copy), GetFriendStatusModule (copy), GetResult (copy), Llama (copy)
	local UseRefResult = React.useRef({})
	local UseSelectorResult = if FFlagMigrateFriendshipStatusesPYMKModule then nil else UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueFunction (upval), ConstantsModule (upval)
		return GetDeepValueFunction(p1, string.format("%s.Friends.friendshipStatus", ConstantsModule.RODUX_KEY)) or {}
	end)
	local UseSelectorResult1 = if FFlagLuaAppEnableSduiHomePage then nil else UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueFunction (upval), ConstantsModule (upval)
		return GetDeepValueFunction(p1, string.format("%s.Friends.recommendations.hasIncomingFriendRequest", ConstantsModule.RODUX_KEY))
	end) or {}
	local UseSelectorResult2 = UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueFunction (upval)
		return GetDeepValueFunction(p1, "PYMKCarousel.Presence.byUserId") or {}
	end)
	
	return React.useMemo(function()
		-- upvalues: UseRefResult (copy), GetFFlagPYMKAddFriendsEntryFunction (upval), Callback (copy), EventNamesModule (upval), RecommendationContextType (upval), GetFriendStatusModule (upval), FFlagMigrateFriendshipStatusesPYMKModule (upval), GetResult (upval), UseSelectorResult (ref), FFlagLuaAppEnableSduiHomePage (upval), UseSelectorResult1 (ref), UseSelectorResult2 (copy), Llama (upval)
		return {
			{
				viewabilityConfig = {
					itemVisiblePercentThreshold = 50,
					waitForInteraction = false
				},
				onViewableItemsChanged = function(p1)
					-- upvalues: UseRefResult (upval), GetFFlagPYMKAddFriendsEntryFunction (upval), Callback (upval), EventNamesModule (upval), RecommendationContextType (upval), GetFriendStatusModule (upval), FFlagMigrateFriendshipStatusesPYMKModule (upval), GetResult (upval), UseSelectorResult (upval), FFlagLuaAppEnableSduiHomePage (upval), UseSelectorResult1 (upval), UseSelectorResult2 (upval), Llama (upval)
					for _, value in pairs(p1.changed) do
						local Item = value.item
						local Current = UseRefResult.current or {}
						
						if if GetFFlagPYMKAddFriendsEntryFunction() then not Current[Item.id] and (not Item.isTooltip and not Item.isButtonTile) else not Current[Item.id] then
							local UserSeen = EventNamesModule.UserSeen
							local config = {
								userId = Item.id,
								contactId = if Item.recommendationContextType == RecommendationContextType.Contacts then Item.id else nil
							}
							local DataResult = nil
							
							if FFlagMigrateFriendshipStatusesPYMKModule then
								local FriendshipStatus = GetResult.GetFriendshipStatus(Item.id, { skipFetch = true })
								DataResult = if FriendshipStatus then FriendshipStatus.data(false) else nil
							else
								DataResult = UseSelectorResult[Item.id]
							end
							config.friendStatus = GetFriendStatusModule(DataResult, if FFlagLuaAppEnableSduiHomePage then Item.hasIncomingFriendRequest else UseSelectorResult1[Item.id])
							config.recommendationContextType = Item.recommendationContextType
							config.recommendationRank = Item.recommendationRank
							config.absolutePosition = Item.absolutePosition
							config.presence = (UseSelectorResult2[Item.id] or {}).userPresenceType
							Callback(UserSeen, config)
							UseRefResult.current = Llama.Dictionary.join(UseRefResult.current, { [Item.id] = true })
						end
					end
				end
			}
		}
	end, { UseSelectorResult2 })
end