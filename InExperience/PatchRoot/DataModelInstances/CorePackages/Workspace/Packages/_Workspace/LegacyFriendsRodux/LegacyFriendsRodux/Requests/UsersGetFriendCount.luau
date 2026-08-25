local parent = script:FindFirstAncestor("LegacyFriendsRodux").Parent
local playersService = game:GetService("Players")
local url = require(parent.Http).Url
local isNewFriendsEndpointsEnabled = require(parent.SharedFlags).isNewFriendsEndpointsEnabled

return function(p0)
	-- upvalues: url (ref), playersService (ref), isNewFriendsEndpointsEnabled (ref)
	return p0(if isNewFriendsEndpointsEnabled() then string.format("%s/my/friends/count", url.FRIEND_URL) else string.format("%s/user/get-friendship-count?%s", url.API_URL, tostring(playersService.LocalPlayer.UserId)), "GET")
end