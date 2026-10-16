local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local Url = require(Parent.Http).Url
local Friends = DataHydration.Friends
local MyHttpRequestModule = require(Friends.Networking.myHttpRequest)
local NormalizeFriendRequestErrorModule = require(Friends.Networking.normalizeFriendRequestError)
local FFlagEnableFriendsStoreChallengeInterceptor = require(Parent.SharedFlags).FFlagEnableFriendsStoreChallengeInterceptor

return function(p1, p2) --[[ Line: 20 ]]
	-- upvalues: FFlagEnableFriendsStoreChallengeInterceptor (copy), MyHttpRequestModule (copy), Url (copy), HttpService (copy), NormalizeFriendRequestErrorModule (copy)
	return (if FFlagEnableFriendsStoreChallengeInterceptor and p2 then p2 else MyHttpRequestModule)(string.format("%s/contacts/%s/request-friendship", Url.FRIEND_URL, (tostring(p1))), "POST", { postBody = HttpService:JSONEncode({}) }):andThen(function() --[[ Line: 26 ]]
		return nil
	end):catch(function(Err) --[[ Line: 29 ]]
		-- upvalues: NormalizeFriendRequestErrorModule (upval)
		error(NormalizeFriendRequestErrorModule(Err))
	end)
end