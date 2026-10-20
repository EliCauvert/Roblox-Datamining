local UserLib = script:FindFirstAncestor("UserLib")
local Parent = UserLib.Parent
local UserModule = require(UserLib.Models.User)
local AddUsersModule = require(UserLib.Actions.AddUsers)
local SetFriendCountFunction = require(Parent.LegacyFriendsRodux).Actions.SetFriendCount
local FFlagRemoveUnusedFriendCountRoduxSlice = require(Parent.SharedFlags).FFlagRemoveUnusedFriendCountRoduxSlice

return function(p1)
	-- upvalues: UserModule (copy), AddUsersModule (copy), FFlagRemoveUnusedFriendCountRoduxSlice (copy), SetFriendCountFunction (copy)
	return function(p2)
		-- upvalues: p1 (copy), UserModule (upval), AddUsersModule (upval), FFlagRemoveUnusedFriendCountRoduxSlice (upval), SetFriendCountFunction (upval)
		local Total = 0
		local t = {}
		
		for _, value in pairs(p1) do
			local Flag = false
			local Id = value.id
			local IsFriend = value.isFriend
			local Amount = 0
			assert(typeof(IsFriend) == "boolean", "Expected isFriend to be a string")
			local User = p2:getState().Users[Id]
			
			if User then
				local CompareResult = UserModule.compare(User, value)
				
				if not CompareResult then
					Flag = true
					CompareResult = User.isFriend == IsFriend
				end
				if not CompareResult then
					Amount = if IsFriend then 1 else -1
				end
			else
				Flag = true
				Amount = if IsFriend then 1 else 0
			end
			if Flag then
				Total += Amount
				t[Id] = value
			end
		end
		if next(t) then
			p2:dispatch(AddUsersModule(t))
		end
		if not FFlagRemoveUnusedFriendCountRoduxSlice and Total ~= 0 then
			p2:dispatch(SetFriendCountFunction(p2:getState().FriendCount + Total))
		end
	end
end