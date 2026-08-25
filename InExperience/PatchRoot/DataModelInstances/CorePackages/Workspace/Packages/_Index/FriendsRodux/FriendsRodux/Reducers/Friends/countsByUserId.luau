local friendsRodux = script:FindFirstAncestor("FriendsRodux")
local parent = friendsRodux.Parent
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)
local _ = require(friendsRodux.roduxFriendsTypes)
local t = {}

return function(p0)
	-- upvalues: roduxModule (ref), t (ref), cryoModule (ref)
	return roduxModule.createReducer(t, {
		[p0.friendsNetworking.GetFriendsCountFromUserId.Succeeded.name] = function(p1, p2)
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.union(p1, { [tostring(p2.namedIds.users)] = p2.responseBody.count })
		end
	})
end