local legacyFriendsRodux = script:FindFirstAncestor("LegacyFriendsRodux")
local parent = legacyFriendsRodux.Parent
local usersGetFriendCount = require(legacyFriendsRodux.Requests).UsersGetFriendCount
local setFriendCount = require(legacyFriendsRodux.Actions).SetFriendCount
local isNewFriendsEndpointsEnabled = require(parent.SharedFlags).isNewFriendsEndpointsEnabled
local fFlagRemoveUnusedFriendCountRoduxSlice = require(parent.SharedFlags).FFlagRemoveUnusedFriendCountRoduxSlice

return function(p1)
	-- upvalues: usersGetFriendCount (ref), fFlagRemoveUnusedFriendCountRoduxSlice (ref), isNewFriendsEndpointsEnabled (ref), setFriendCount (ref)
	return function(p2)
		-- upvalues: usersGetFriendCount (copy), p1 (ref), fFlagRemoveUnusedFriendCountRoduxSlice (copy), isNewFriendsEndpointsEnabled (copy), setFriendCount (copy)
		return usersGetFriendCount(p1):andThen(function(p3)
			-- upvalues: fFlagRemoveUnusedFriendCountRoduxSlice (copy), isNewFriendsEndpointsEnabled (copy), p2 (ref), setFriendCount (copy)
			local responseBody = p3.responseBody
			
			if not fFlagRemoveUnusedFriendCountRoduxSlice then
				if isNewFriendsEndpointsEnabled() then
					if responseBody.count then
						p2:dispatch(setFriendCount(responseBody.count))
					end
				elseif responseBody.success and responseBody.count then
					p2:dispatch(setFriendCount(responseBody.count))
				end
			end
			return responseBody.count
		end)
	end
end