local DataHydration = script:FindFirstAncestor("DataHydration")
local Url = require(DataHydration.Parent.Http).Url
local MyHttpRequestModule = require(DataHydration.TrustedConnections.Networking.myHttpRequest)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: Url (copy), MyHttpRequestModule (copy)
	return MyHttpRequestModule(string.format("%s/users/%s/ignore-trusted-friend-request", Url.FRIEND_URL, (tostring(p1))), "POST", { postBody = {} })
end