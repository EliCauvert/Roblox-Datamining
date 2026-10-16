local DataHydration = script:FindFirstAncestor("DataHydration")
local Url = require(DataHydration.Parent.Http).Url
local MyHttpRequestModule = require(DataHydration.TrustedConnections.Networking.myHttpRequest)

return function() --[[ Line: 9 ]]
	-- upvalues: Url (copy), MyHttpRequestModule (copy)
	return MyHttpRequestModule(string.format("%s/user/trusted-friend-requests/count", Url.FRIEND_URL), "GET"):andThen(function(Result) --[[ Line: 12 ]]
		return Result and Result.responseBody
	end)
end