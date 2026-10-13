local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local url = require(parent.Http).Url
local friends = dataHydration.Friends
local myHttpRequestModule = require(friends.Networking.myHttpRequest)
local normalizeFriendRequestErrorModule = require(friends.Networking.normalizeFriendRequestError)
local fFlagEnableFriendsStoreChallengeInterceptor = require(parent.SharedFlags).FFlagEnableFriendsStoreChallengeInterceptor

return function(p1, p2)
	-- upvalues: fFlagEnableFriendsStoreChallengeInterceptor (ref), myHttpRequestModule (ref), url (ref), httpService (ref), normalizeFriendRequestErrorModule (ref)
	return (if fFlagEnableFriendsStoreChallengeInterceptor and p2 then p2 else myHttpRequestModule)(string.format("%s/contacts/%s/request-friendship", url.FRIEND_URL, tostring(p1)), "POST", { postBody = httpService:JSONEncode({}) }):andThen(function()
		return nil
	end):catch(function(p3)
		-- upvalues: normalizeFriendRequestErrorModule (copy)
		error(normalizeFriendRequestErrorModule(p3))
	end)
end