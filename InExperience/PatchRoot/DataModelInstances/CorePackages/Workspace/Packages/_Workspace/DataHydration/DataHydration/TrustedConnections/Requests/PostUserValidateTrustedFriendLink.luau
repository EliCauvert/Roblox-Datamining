local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Url = require(DataHydration.Parent.Http).Url
local MyHttpRequestModule = require(DataHydration.TrustedConnections.Networking.myHttpRequest)

return function(p1, Tokens) --[[ Line: 11 ]]
	-- upvalues: Url (copy), MyHttpRequestModule (copy), HttpService (copy)
	return MyHttpRequestModule(string.format("%s/users/%s/validate-trusted-friend-link", Url.FRIEND_URL, (tostring(p1))), "POST", { postBody = HttpService:JSONEncode({ Tokens = Tokens }) })
end