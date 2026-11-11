local FriendsRodux = script:FindFirstAncestor("FriendsRodux")
local Parent = FriendsRodux.Parent
local _ = require(FriendsRodux.roduxFriendsTypes)
local RoduxModule = require(Parent.Rodux)
local DashModule = require(Parent.Dash)
local t = {}

return function(p1)
	-- upvalues: RoduxModule (copy), t (copy), DashModule (copy)
	return RoduxModule.createReducer(t, {
		[p1.friendsNetworking.GetFollowingExists.Succeeded.name] = function(p2, p3)
			-- upvalues: DashModule (upval)
			local t = {}
			DashModule.forEach(p3.responseBody.followings, function(p4)
				-- upvalues: t (copy)
				t[tostring(p4.userId)] = { isFollowed = p4.isFollowed, isFollowing = p4.isFollowing }
			end)
			
			return DashModule.join(p2, t)
		end,
		[p1.userBlockingNetworking.BlockUserById.Succeeded.name] = function(p2, p3)
			-- upvalues: DashModule (upval)
			return DashModule.join(p2, {
				[tostring(p3.namedIds.users)] = { isFollowed = false, isFollowing = false }
			})
		end
	})
end