local DataHydration = script:FindFirstAncestor("DataHydration")
local Url = require(DataHydration.Parent.Http).Url
local MyHttpRequestModule = require(DataHydration.TrustedConnections.Networking.myHttpRequest)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: Url (copy), MyHttpRequestModule (copy)
	return MyHttpRequestModule(string.format("%s/my/trusted-friends/%s/status", Url.FRIEND_URL, (tostring(p1))), "GET"):andThen(function(Result) --[[ Line: 11 ]]
		return Result and (Result.responseBody and Result.responseBody.status)
	end)
end