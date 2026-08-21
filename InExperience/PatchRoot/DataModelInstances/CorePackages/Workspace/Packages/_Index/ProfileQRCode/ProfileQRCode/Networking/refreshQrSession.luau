local httpModule = require(script:FindFirstAncestor("ProfileQRCode").Parent.Http)

local var1 = function(p0) --[[ line: 6 ]]
	-- upvalues: httpModule (ref)
	return p0(httpModule.Url.FRIEND_URL):path("my"):path("friends"):path("refresh-qr-session"):body({})
end

return (function(p1) --[[ line: 10 ]]
	-- upvalues: var1 (ref)
	return p1.POST(script.Name, var1)
end)(require(script.Parent.configuredRoduxNetworking))