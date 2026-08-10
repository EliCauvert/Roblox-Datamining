local friendsRodux = script:FindFirstAncestor("FriendsRodux")
local parent = friendsRodux.Parent
local _ = require(friendsRodux.roduxFriendsTypes)
local roduxModule = require(parent.Rodux)
local dashModule = require(parent.Dash)
local t = {}

return function(p0) --[[ line: 20 ]]
	-- upvalues: roduxModule (ref), t (ref), dashModule (ref)
	return roduxModule.createReducer(t, {
		[p0.friendsNetworking.GetFollowingExists.Succeeded.name] = function(p1, p2) --[[ line: 25 ]]
			-- upvalues: dashModule (copy)
			local t = {}
			dashModule.forEach(p2.responseBody.followings, function(p3) --[[ line: 27 ]]
				-- upvalues: t (ref)
				t[tostring(p3.userId)] = { isFollowed = p3.isFollowed, isFollowing = p3.isFollowing }
			end)
			
			return dashModule.join(p1, t)
		end,
		[p0.userBlockingNetworking.BlockUserById.Succeeded.name] = function(p4, p5) --[[ line: 36 ]]
			-- upvalues: dashModule (copy)
			return dashModule.join(p4, {
				[tostring(p5.namedIds.users)] = { isFollowed = false, isFollowing = false }
			})
		end
	})
end