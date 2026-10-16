local Players = game:GetService("Players")
local ThrottleUserIdFunction = require(script:FindFirstAncestor("SharedFlags").Parent.AppCommonLib).ThrottleUserId

return function() --[[ Line: 7 ]]
	-- upvalues: ThrottleUserIdFunction (copy), Players (copy)
	return ThrottleUserIdFunction(game:DefineFastInt("LuaChatUseNewFriendsEndpointsV2", 0), Players.LocalPlayer.UserId)
end