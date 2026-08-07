local legacyFriendsRodux = script:FindFirstAncestor("LegacyFriendsRodux")
local parent = legacyFriendsRodux.Parent
local usersGetFriendCount = require(legacyFriendsRodux.Requests).UsersGetFriendCount
local setFriendCount = require(legacyFriendsRodux.Actions).SetFriendCount
local isNewFriendsEndpointsEnabled = require(parent.SharedFlags).isNewFriendsEndpointsEnabled

return function(p0) --[[ line: 9 ]]
	-- upvalues: usersGetFriendCount (ref), isNewFriendsEndpointsEnabled (ref), setFriendCount (ref)
	return function(p1) --[[ line: 10 ]]
		-- upvalues: usersGetFriendCount (copy), p0 (ref), isNewFriendsEndpointsEnabled (copy), setFriendCount (copy)
		return usersGetFriendCount(p0):andThen(function(p2) --[[ line: 11 ]]
			-- upvalues: isNewFriendsEndpointsEnabled (copy), p1 (ref), setFriendCount (copy)
			local responseBody = p2.responseBody
			
			if isNewFriendsEndpointsEnabled() then
				if responseBody.count then
					p1:dispatch(setFriendCount(responseBody.count))
				end
			elseif responseBody.success and responseBody.count then
				p1:dispatch(setFriendCount(responseBody.count))
			end
			return responseBody.count
		end)
	end
end