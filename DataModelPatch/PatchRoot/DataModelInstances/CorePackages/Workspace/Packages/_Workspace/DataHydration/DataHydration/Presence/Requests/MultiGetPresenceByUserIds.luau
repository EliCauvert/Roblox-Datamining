local DataHydration = script:FindFirstAncestor("DataHydration")
local Url = require(DataHydration.Parent.Http).Url
local MyHttpRequestModule = require(DataHydration.Presence.Networking.myHttpRequest)

return function(UserIds)
	-- upvalues: Url (copy), MyHttpRequestModule (copy)
	return MyHttpRequestModule(string.format("%s/presence/users", Url.PRESENCE_URL), "POST", { postBody = { userIds = UserIds } })
end