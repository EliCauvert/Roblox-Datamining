local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local Url = require(Parent.Http).Url
local MyHttpRequestModule = require(DataHydration.TrustedConnections.Networking.myHttpRequest)

return function(p1, p2)
	-- upvalues: Url (copy), SharedFlagsModule (copy), MyHttpRequestModule (copy)
	local Formatted = string.format("%s/users/%s/send-trusted-friend-request", Url.FRIEND_URL, (tostring(p1)))
	
	if SharedFlagsModule.FFlagProfilePlatformTrustedConnectionsMVP and p2 ~= nil then
		Formatted ..= `?source={p2}`
	end
	return MyHttpRequestModule(Formatted, "POST", { postBody = {} })
end