local Parent = script:FindFirstAncestor("LegacyFriendsRodux").Parent
local Players = game:GetService("Players")
local Url = require(Parent.Http).Url
local IsNewFriendsEndpointsEnabledFunction = require(Parent.SharedFlags).isNewFriendsEndpointsEnabled

return function(Callback)
	-- upvalues: Url (copy), Players (copy), IsNewFriendsEndpointsEnabledFunction (copy)
	return Callback(if IsNewFriendsEndpointsEnabledFunction() then string.format("%s/my/friends/count", Url.FRIEND_URL) else string.format("%s/user/get-friendship-count?%s", Url.API_URL, (tostring(Players.LocalPlayer.UserId))), "GET")
end