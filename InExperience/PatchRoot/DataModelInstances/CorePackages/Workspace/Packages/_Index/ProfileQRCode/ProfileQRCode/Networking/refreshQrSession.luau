local httpModule = require(script:FindFirstAncestor("ProfileQRCode").Parent.Http)

local var1 = function(p1, _)
	-- upvalues: httpModule (ref)
	return p1(httpModule.Url.FRIEND_URL):path("my"):path("friends"):path("refresh-qr-session"):body({})
end

return (function(p1)
	-- upvalues: var1 (ref)
	return p1.POST(script.Name, var1)
end)(require(script.Parent.configuredRoduxNetworking))