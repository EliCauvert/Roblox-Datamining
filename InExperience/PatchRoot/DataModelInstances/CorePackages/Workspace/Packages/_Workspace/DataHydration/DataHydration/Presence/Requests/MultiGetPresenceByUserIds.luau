local dataHydration = script:FindFirstAncestor("DataHydration")
local url = require(dataHydration.Parent.Http).Url
local myHttpRequestModule = require(dataHydration.Presence.Networking.myHttpRequest)

return function(p0)
	-- upvalues: url (ref), myHttpRequestModule (ref)
	return myHttpRequestModule(string.format("%s/presence/users", url.PRESENCE_URL), "POST", { postBody = { userIds = p0 } })
end