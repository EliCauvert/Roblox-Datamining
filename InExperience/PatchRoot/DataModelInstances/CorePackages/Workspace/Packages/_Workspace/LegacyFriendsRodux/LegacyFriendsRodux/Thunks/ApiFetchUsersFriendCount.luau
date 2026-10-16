local LegacyFriendsRodux = script:FindFirstAncestor("LegacyFriendsRodux")
local Parent = LegacyFriendsRodux.Parent
local UsersGetFriendCountFunction = require(LegacyFriendsRodux.Requests).UsersGetFriendCount
local SetFriendCountFunction = require(LegacyFriendsRodux.Actions).SetFriendCount
local IsNewFriendsEndpointsEnabledFunction = require(Parent.SharedFlags).isNewFriendsEndpointsEnabled
local FFlagRemoveUnusedFriendCountRoduxSlice = require(Parent.SharedFlags).FFlagRemoveUnusedFriendCountRoduxSlice

return function(p1) --[[ Line: 10 ]]
	-- upvalues: UsersGetFriendCountFunction (copy), FFlagRemoveUnusedFriendCountRoduxSlice (copy), IsNewFriendsEndpointsEnabledFunction (copy), SetFriendCountFunction (copy)
	return function(p2) --[[ Line: 11 ]]
		-- upvalues: UsersGetFriendCountFunction (upval), p1 (copy), FFlagRemoveUnusedFriendCountRoduxSlice (upval), IsNewFriendsEndpointsEnabledFunction (upval), SetFriendCountFunction (upval)
		return UsersGetFriendCountFunction(p1):andThen(function(Result) --[[ Line: 12 ]]
			-- upvalues: FFlagRemoveUnusedFriendCountRoduxSlice (upval), IsNewFriendsEndpointsEnabledFunction (upval), p2 (copy), SetFriendCountFunction (upval)
			local ResponseBody = Result.responseBody
			
			if not FFlagRemoveUnusedFriendCountRoduxSlice then
				if IsNewFriendsEndpointsEnabledFunction() then
					if ResponseBody.count then
						p2:dispatch(SetFriendCountFunction(ResponseBody.count))
					end
				elseif ResponseBody.success and ResponseBody.count then
					p2:dispatch(SetFriendCountFunction(ResponseBody.count))
				end
			end
			return ResponseBody.count
		end)
	end
end