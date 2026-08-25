local playersService = game:GetService("Players")
local urlModule = require(script:FindFirstAncestor("Http").Url)

return function(p0, p1)
	-- upvalues: playersService (ref), urlModule (ref)
	return p0(string.format("%s/users/%s/friends/statuses?userIds=%s", urlModule.FRIEND_URL, tostring(playersService.LocalPlayer.UserId), table.concat(p1, ",")), "GET")
end