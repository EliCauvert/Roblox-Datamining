local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local url = require(dataHydration.Parent.Http).Url
local friends = dataHydration.Friends
local myHttpRequestModule = require(friends.Networking.myHttpRequest)
local normalizeFriendRequestErrorModule = require(friends.Networking.normalizeFriendRequestError)

return function(p1)
	-- upvalues: url (ref), myHttpRequestModule (ref), httpService (ref), normalizeFriendRequestErrorModule (ref)
	return myHttpRequestModule(string.format("%s/users/%s/unfriend", url.FRIEND_URL, tostring(p1)), "POST", { postBody = httpService:JSONEncode({}) }):andThen(function()
		return nil
	end):catch(function(p2)
		-- upvalues: normalizeFriendRequestErrorModule (copy)
		error(normalizeFriendRequestErrorModule(p2))
	end)
end