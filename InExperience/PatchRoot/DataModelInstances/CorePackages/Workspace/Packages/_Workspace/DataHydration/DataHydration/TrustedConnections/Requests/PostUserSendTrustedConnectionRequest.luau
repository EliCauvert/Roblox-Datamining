local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local url = require(parent.Http).Url
local myHttpRequestModule = require(dataHydration.TrustedConnections.Networking.myHttpRequest)

return function(p1, p2)
	-- upvalues: url (ref), sharedFlagsModule (ref), myHttpRequestModule (ref)
	local formattedText = string.format("%s/users/%s/send-trusted-friend-request", url.FRIEND_URL, tostring(p1))
	
	if sharedFlagsModule.FFlagProfilePlatformTrustedConnectionsMVP and p2 ~= nil then
		formattedText ..= `?source={p2}`
	end
	return myHttpRequestModule(formattedText, "POST", { postBody = {} })
end