local LegacyFriendsRodux = script:FindFirstAncestor("LegacyFriendsRodux")
local UsersGetFriendCountFunction = require(LegacyFriendsRodux.Requests).UsersGetFriendCount
local SetFriendCountFunction = require(LegacyFriendsRodux.Actions).SetFriendCount
local IsNewFriendsEndpointsEnabledFunction = require(LegacyFriendsRodux.Parent.SharedFlags).isNewFriendsEndpointsEnabled

return function(p1)
	-- upvalues: UsersGetFriendCountFunction (copy), IsNewFriendsEndpointsEnabledFunction (copy), SetFriendCountFunction (copy)
	return function(p2)
		-- upvalues: UsersGetFriendCountFunction (upval), p1 (copy), IsNewFriendsEndpointsEnabledFunction (upval), SetFriendCountFunction (upval)
		return UsersGetFriendCountFunction(p1):andThen(function(Result)
			-- upvalues: IsNewFriendsEndpointsEnabledFunction (upval), p2 (copy), SetFriendCountFunction (upval)
			local ResponseBody = Result.responseBody
			
			if IsNewFriendsEndpointsEnabledFunction() then
				if ResponseBody.count then
					p2:dispatch(SetFriendCountFunction(ResponseBody.count))
				end
			elseif ResponseBody.success and ResponseBody.count then
				p2:dispatch(SetFriendCountFunction(ResponseBody.count))
			end
			return ResponseBody.count
		end)
	end
end