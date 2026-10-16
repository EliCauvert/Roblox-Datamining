local Players = game:GetService("Players")
local NetworkingFriendsModule = require(script:FindFirstAncestor("AppChat").Http.NetworkingFriends)

return function() --[[ Line: 7 ]]
	-- upvalues: Players (copy), NetworkingFriendsModule (copy)
	return function(p1) --[[ Line: 8 ]]
		-- upvalues: Players (upval), NetworkingFriendsModule (upval)
		if not Players.LocalPlayer then return end
		return p1:dispatch(NetworkingFriendsModule.GetFriendsCountFromUserId.API(Players.LocalPlayer.UserId))
	end
end