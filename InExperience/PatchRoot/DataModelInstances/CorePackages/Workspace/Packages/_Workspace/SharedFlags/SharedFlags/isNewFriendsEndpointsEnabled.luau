local playersService = game:GetService("Players")
local throttleUserId = require(script:FindFirstAncestor("SharedFlags").Parent.AppCommonLib).ThrottleUserId

return function()
	-- upvalues: throttleUserId (ref), playersService (ref)
	return throttleUserId(game:DefineFastInt("LuaChatUseNewFriendsEndpointsV2", 0), playersService.LocalPlayer.UserId)
end