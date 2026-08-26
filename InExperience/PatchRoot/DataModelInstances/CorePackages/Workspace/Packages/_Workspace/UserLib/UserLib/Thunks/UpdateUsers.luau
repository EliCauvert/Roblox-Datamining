local userLib = script:FindFirstAncestor("UserLib")
local parent = userLib.Parent
local userModule = require(userLib.Models.User)
local addUsersModule = require(userLib.Actions.AddUsers)
local setFriendCount = require(parent.LegacyFriendsRodux).Actions.SetFriendCount

return function(p1)
	-- upvalues: userModule (ref), addUsersModule (ref), setFriendCount (ref)
	return function(p2)
		-- upvalues: p1 (ref), userModule (copy), addUsersModule (copy), setFriendCount (copy)
		local var1 = 0
		local t = {}
		
		for i, v in pairs(p1) do
			local var2 = false
			local id = v.id
			local isFriend = v.isFriend
			local var3 = 0
			assert(typeof(isFriend) == "boolean", "Expected isFriend to be a string")
			local var4 = p2:getState().Users[id]
			
			if not var4 then
				var2 = true
				var3 = if isFriend then 1 else 0
			elseif not userModule.compare(var4, v) then
				var2 = true
				
				if var4.isFriend ~= isFriend then
					var3 = if isFriend then 1 else -1
				end
			end
			if var2 then
				var1 += var3
				t[id] = v
			end
		end
		if next(t) then
			p2:dispatch(addUsersModule(t))
		end
		if var1 ~= 0 then
			p2:dispatch(setFriendCount(p2:getState().FriendCount + var1))
		end
	end
end