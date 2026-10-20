local Parent = script:FindFirstAncestor("AppChat").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UserProfilesModule = require(Parent.UserProfiles)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseFriendsListOrderedByPresenceFunction = require(Parent.FriendsCommon).Hooks.useFriendsListOrderedByPresence

function useFetchPaginatedFriendIds()
	-- upvalues: UseLocalUserIdFunction (copy), ReactModule (copy), UseFriendsListOrderedByPresenceFunction (copy), CryoModule (copy), UserProfilesModule (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseFriendsListOrderedByPresenceResult = UseFriendsListOrderedByPresenceFunction({ pageSize = 50, userId = UseLocalUserIdFunction() })
	local MapResult = CryoModule.List.map(CryoModule.List.join(UseFriendsListOrderedByPresenceResult.onlineFriends, UseFriendsListOrderedByPresenceResult.offlineFriends), function(p1)
		return p1.id
	end)
	local Set = CryoModule.List.toSet(UseRefResult.current)
	local FilterResult = CryoModule.List.filter(MapResult, function(p1): boolean
		-- upvalues: Set (copy)
		return not Set[p1]
	end)
	
	if #FilterResult > 0 then
		UserProfilesModule.Stores.UserProfileStore.get().fetchNamesByUserIds(FilterResult)
	end
	UseRefResult.current = MapResult
	
	return UseRefResult.current, UseFriendsListOrderedByPresenceResult.fetchMoreFriends, UseFriendsListOrderedByPresenceResult.isEndOfList, UseFriendsListOrderedByPresenceResult
end

return useFetchPaginatedFriendIds