local FriendsRodux = script:FindFirstAncestor("FriendsRodux")
local Parent = FriendsRodux.Parent
local RoduxModule = require(Parent.Rodux)
local CryoModule = require(Parent.Cryo)
local _ = require(FriendsRodux.roduxFriendsTypes)
local t = {}

return function(p1)
	-- upvalues: RoduxModule (copy), t (copy), CryoModule (copy)
	return RoduxModule.createReducer(t, {
		[p1.friendsNetworking.GetFriendsCountFromUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: CryoModule (upval)
			return CryoModule.Dictionary.union(p2, { [tostring(p3.namedIds.users)] = p3.responseBody.count })
		end
	})
end