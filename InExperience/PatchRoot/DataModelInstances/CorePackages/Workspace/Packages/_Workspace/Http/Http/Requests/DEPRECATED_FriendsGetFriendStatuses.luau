local playersService = game:GetService("Players")
local urlModule = require(script:FindFirstAncestor("Http").Url)

return function(p1, p2)
	-- upvalues: playersService (ref), urlModule (ref)
	return p1(string.format("%s/users/%s/friends/statuses?userIds=%s", urlModule.FRIEND_URL, tostring(playersService.LocalPlayer.UserId), table.concat(p2, ",")), "GET")
end