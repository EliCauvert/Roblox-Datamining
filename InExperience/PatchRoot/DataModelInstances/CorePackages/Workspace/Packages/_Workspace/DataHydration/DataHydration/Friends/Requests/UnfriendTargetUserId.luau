local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Url = require(DataHydration.Parent.Http).Url
local Friends = DataHydration.Friends
local MyHttpRequestModule = require(Friends.Networking.myHttpRequest)
local NormalizeFriendRequestErrorModule = require(Friends.Networking.normalizeFriendRequestError)

return function(p1) --[[ Line: 15 ]]
	-- upvalues: Url (copy), MyHttpRequestModule (copy), HttpService (copy), NormalizeFriendRequestErrorModule (copy)
	return MyHttpRequestModule(string.format("%s/users/%s/unfriend", Url.FRIEND_URL, (tostring(p1))), "POST", { postBody = HttpService:JSONEncode({}) }):andThen(function() --[[ Line: 18 ]]
		return nil
	end):catch(function(Err) --[[ Line: 21 ]]
		-- upvalues: NormalizeFriendRequestErrorModule (upval)
		error(NormalizeFriendRequestErrorModule(Err))
	end)
end