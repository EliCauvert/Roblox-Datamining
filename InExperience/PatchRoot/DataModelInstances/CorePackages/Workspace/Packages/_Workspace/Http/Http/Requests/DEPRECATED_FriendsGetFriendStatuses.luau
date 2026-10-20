local Players = game:GetService("Players")
local UrlModule = require(script:FindFirstAncestor("Http").Url)

return function(Callback, List)
	-- upvalues: Players (copy), UrlModule (copy)
	return Callback(string.format("%s/users/%s/friends/statuses?userIds=%s", UrlModule.FRIEND_URL, tostring(Players.LocalPlayer.UserId), (table.concat(List, ","))), "GET")
end