local parent = script.Parent.Parent
local parent_1 = parent.Parent
local constantsModule = require(parent.Common.Constants)
local dependenciesModule = require(parent.dependencies)
local llama = dependenciesModule.llama
local react = dependenciesModule.React
local useSelector = dependenciesModule.Hooks.useSelector
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue
local eventNamesModule = require(script.Parent.EventNames)
local getFriendStatusModule = require(script.Parent.getFriendStatus)
local recommendationContextType = dependenciesModule.RoduxFriends.Enums.RecommendationContextType
local getFFlagPYMKAddFriendsEntry = dependenciesModule.getFFlagPYMKAddFriendsEntry
local fFlagMigrateFriendshipStatusesPYMKModule = require(parent.Flags.FFlagMigrateFriendshipStatusesPYMK)
local fFlagLuaAppEnableSduiHomePage = require(parent_1.SharedFlags).FFlagLuaAppEnableSduiHomePage
local var1 = if fFlagMigrateFriendshipStatusesPYMKModule then require(parent_1.DataHydration).Friends.FriendsStore.get() else nil

local function _(p1)
	-- upvalues: var1 (ref)
	local friendshipStatus = var1.GetFriendshipStatus(p1, { skipFetch = true })
	
	return if friendshipStatus then friendshipStatus.data(false) else nil
end

return function(p1)
	-- upvalues: react (ref), fFlagMigrateFriendshipStatusesPYMKModule (ref), useSelector (ref), getDeepValue (ref), constantsModule (ref), fFlagLuaAppEnableSduiHomePage (ref), getFFlagPYMKAddFriendsEntry (ref), eventNamesModule (ref), recommendationContextType (ref), getFriendStatusModule (ref), var1 (ref), llama (ref)
	local var2 = react.useRef({})
	local var3 = if not fFlagMigrateFriendshipStatusesPYMKModule then useSelector(function(p2)
		-- upvalues: getDeepValue (copy), constantsModule (copy)
		return getDeepValue(p2, string.format("%s.Friends.friendshipStatus", constantsModule.RODUX_KEY)) or {}
	end) else nil
	local var4 = nil
	
	if not fFlagLuaAppEnableSduiHomePage then
		var4 = useSelector(function(p2)
			-- upvalues: getDeepValue (copy), constantsModule (copy)
			return getDeepValue(p2, string.format("%s.Friends.recommendations.hasIncomingFriendRequest", constantsModule.RODUX_KEY))
		end) or {}
	end
	local var5 = useSelector(function(p2)
		-- upvalues: getDeepValue (copy)
		return getDeepValue(p2, "PYMKCarousel.Presence.byUserId") or {}
	end)
	
	return react.useMemo(function()
		-- upvalues: var2 (ref), getFFlagPYMKAddFriendsEntry (copy), p1 (ref), eventNamesModule (copy), recommendationContextType (copy), getFriendStatusModule (copy), fFlagMigrateFriendshipStatusesPYMKModule (copy), var1 (copy), var3 (write), fFlagLuaAppEnableSduiHomePage (copy), var4 (write), var5 (ref), llama (copy)
		return {
			{
				viewabilityConfig = {
					itemVisiblePercentThreshold = 50,
					waitForInteraction = false
				},
				onViewableItemsChanged = function(p2)
					-- upvalues: var2 (copy), getFFlagPYMKAddFriendsEntry (copy), p1 (copy), eventNamesModule (copy), recommendationContextType (copy), getFriendStatusModule (copy), fFlagMigrateFriendshipStatusesPYMKModule (copy), var1 (copy), var3 (copy), fFlagLuaAppEnableSduiHomePage (copy), var4 (copy), var5 (copy), llama (copy)
					for i, v in pairs(p2.changed) do
						local item = v.item
						local current = var2.current or {}
						local var6 = not current[item.id]
						
						if getFFlagPYMKAddFriendsEntry() then
							var6 = not current[item.id] and (not item.isTooltip and not item.isButtonTile)
						end
						if var6 then
							local id
							local userSeen = eventNamesModule.UserSeen
							local t = {
								userId = item.id,
								contactId = if item.recommendationContextType == recommendationContextType.Contacts then item.id else nil
							}
							
							if fFlagMigrateFriendshipStatusesPYMKModule then
								local friendshipStatus = var1.GetFriendshipStatus(item.id, { skipFetch = true })
								id = if friendshipStatus then friendshipStatus.data(false) else nil
							else
								id = var3[item.id]
							end
							t.friendStatus = getFriendStatusModule(id, if fFlagLuaAppEnableSduiHomePage then item.hasIncomingFriendRequest else var4[item.id])
							t.recommendationContextType = item.recommendationContextType
							t.recommendationRank = item.recommendationRank
							t.absolutePosition = item.absolutePosition
							t.presence = (var5[item.id] or {}).userPresenceType
							p1(userSeen, t)
							var2.current = llama.Dictionary.join(var2.current, { [item.id] = true })
						end
					end
				end
			}
		}
	end, { var5 })
end