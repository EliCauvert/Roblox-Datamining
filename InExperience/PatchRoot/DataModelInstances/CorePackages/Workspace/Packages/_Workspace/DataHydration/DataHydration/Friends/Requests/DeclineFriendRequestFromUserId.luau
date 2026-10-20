local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Url = require(DataHydration.Parent.Http).Url
local Friends = DataHydration.Friends
local MyHttpRequestModule = require(Friends.Networking.myHttpRequest)
local NormalizeFriendRequestErrorModule = require(Friends.Networking.normalizeFriendRequestError)

return function(p1)
	-- upvalues: Url (copy), MyHttpRequestModule (copy), HttpService (copy), NormalizeFriendRequestErrorModule (copy)
	return MyHttpRequestModule(string.format("%s/users/%s/decline-friend-request", Url.FRIEND_URL, (tostring(p1))), "POST", { postBody = HttpService:JSONEncode({}) }):andThen(function()
		return nil
	end):catch(function(Err)
		-- upvalues: NormalizeFriendRequestErrorModule (upval)
		error(NormalizeFriendRequestErrorModule(Err))
	end)
end