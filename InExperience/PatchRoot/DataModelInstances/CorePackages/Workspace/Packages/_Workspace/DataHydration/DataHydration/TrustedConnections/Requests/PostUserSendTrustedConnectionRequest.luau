local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local url = require(parent.Http).Url
local myHttpRequestModule = require(dataHydration.TrustedConnections.Networking.myHttpRequest)

return function(p0, p1) --[[ line: 10 ]]
	-- upvalues: url (ref), sharedFlagsModule (ref), myHttpRequestModule (ref)
	local formattedText = string.format("%s/users/%s/send-trusted-friend-request", url.FRIEND_URL, tostring(p0))
	
	if sharedFlagsModule.FFlagProfilePlatformTrustedConnectionsMVP and p1 ~= nil then
		formattedText ..= `?source={p1}`
	end
	return myHttpRequestModule(formattedText, "POST", { postBody = {} })
end