local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local UserModel = require(Parent.UserLib).Models.UserModel
local UpdateUsersFunction = require(Parent.UserLib).Thunks.UpdateUsers

local function v2(List)
	-- upvalues: UserModel (copy)
	local FromDataTableResults = {}
	
	for FriendRank, value in pairs(List) do
		value.isFriend = true
		value.friendRank = FriendRank
		local FromDataTableResult = UserModel.fromDataTable(value)
		FromDataTableResults[FromDataTableResult.id] = FromDataTableResult
	end
	return FromDataTableResults
end

return function(p1, p2)
	-- upvalues: v2 (copy), UpdateUsersFunction (copy)
	return function(p3)
		-- upvalues: v2 (upval), p1 (copy), p2 (copy), UpdateUsersFunction (upval)
		local v1 = v2(p1)
		
		if p2 and p2.mockedActions and p2.mockedActions.UpdateUsers then
			p2.mockedActions.UpdateUsers(v1)
			
			return
		else
			p3:dispatch(UpdateUsersFunction(v1))
		end
	end
end