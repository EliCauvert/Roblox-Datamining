local friendsRodux = script:FindFirstAncestor("FriendsRodux")
local parent = friendsRodux.Parent
local _ = require(friendsRodux.roduxFriendsTypes)
local roduxModule = require(parent.Rodux)
local dashModule = require(parent.Dash)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), dashModule (ref)
	return roduxModule.createReducer(t, {
		[p1.friendsNetworking.GetFollowingExists.Succeeded.name] = function(p2, p3)
			-- upvalues: dashModule (copy)
			local t = {}
			dashModule.forEach(p3.responseBody.followings, function(p4)
				-- upvalues: t (ref)
				t[tostring(p4.userId)] = { isFollowed = p4.isFollowed, isFollowing = p4.isFollowing }
			end)
			
			return dashModule.join(p2, t)
		end,
		[p1.userBlockingNetworking.BlockUserById.Succeeded.name] = function(p2, p3)
			-- upvalues: dashModule (copy)
			return dashModule.join(p2, {
				[tostring(p3.namedIds.users)] = { isFollowed = false, isFollowing = false }
			})
		end
	})
end