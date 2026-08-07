local userLib = script:FindFirstAncestor("UserLib")
local parent = userLib.Parent
local userModule = require(userLib.Models.User)
local addUsersModule = require(userLib.Actions.AddUsers)
local setFriendCount = require(parent.LegacyFriendsRodux).Actions.SetFriendCount

return function(p0) --[[ line: 9 ]]
	-- upvalues: userModule (ref), addUsersModule (ref), setFriendCount (ref)
	return function(p1) --[[ line: 10 ]]
		-- upvalues: p0 (ref), userModule (copy), addUsersModule (copy), setFriendCount (copy)
		local var3 = 0
		local t = {}
		
		for i, v in pairs(p0) do
			local var5 = false
			local id = v.id
			local isFriend = v.isFriend
			local var6 = 0
			assert(typeof(isFriend) == "boolean", "Expected isFriend to be a string")
			local var7 = p1:getState().Users[id]
			
			if not var7 then
				var5 = true
				var6 = if isFriend then 1 else 0
			elseif not userModule.compare(var7, v) then
				var5 = true
				
				if var7.isFriend ~= isFriend then
					var6 = if isFriend then 1 else -1
				end
			end
			if var5 then
				var3 += var6
				t[id] = v
			end
		end
		if next(t) then
			p1:dispatch(addUsersModule(t))
		end
		if var3 ~= 0 then
			p1:dispatch(setFriendCount(p1:getState().FriendCount + var3))
		end
	end
end