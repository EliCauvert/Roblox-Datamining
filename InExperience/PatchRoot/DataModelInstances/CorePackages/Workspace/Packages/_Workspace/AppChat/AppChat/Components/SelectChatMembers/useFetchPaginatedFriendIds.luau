local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local userProfilesModule = require(parent.UserProfiles)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useFriendsListOrderedByPresence = require(parent.FriendsCommon).Hooks.useFriendsListOrderedByPresence

function useFetchPaginatedFriendIds()
	-- upvalues: useLocalUserId (ref), reactModule (ref), useFriendsListOrderedByPresence (ref), cryoModule (ref), userProfilesModule (ref)
	local var3 = reactModule.useRef({})
	local var4 = useFriendsListOrderedByPresence({ pageSize = 50, userId = useLocalUserId() })
	local var5 = cryoModule.List.map(cryoModule.List.join(var4.onlineFriends, var4.offlineFriends), function(p0)
		return p0.id
	end)
	local var6 = cryoModule.List.toSet(var3.current)
	local var7 = cryoModule.List.filter(var5, function(p1)
		-- upvalues: var6 (ref)
		return not var6[p1]
	end)
	
	if #var7 > 0 then
		userProfilesModule.Stores.UserProfileStore.get().fetchNamesByUserIds(var7)
	end
	var3.current = var5
	
	return var3.current, var4.fetchMoreFriends, var4.isEndOfList, var4
end

return useFetchPaginatedFriendIds