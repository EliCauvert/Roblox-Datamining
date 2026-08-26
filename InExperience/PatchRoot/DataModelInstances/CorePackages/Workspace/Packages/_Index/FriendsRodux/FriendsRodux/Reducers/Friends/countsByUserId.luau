local friendsRodux = script:FindFirstAncestor("FriendsRodux")
local parent = friendsRodux.Parent
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)
local _ = require(friendsRodux.roduxFriendsTypes)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), cryoModule (ref)
	return roduxModule.createReducer(t, {
		[p1.friendsNetworking.GetFriendsCountFromUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.union(p2, { [tostring(p3.namedIds.users)] = p3.responseBody.count })
		end
	})
end