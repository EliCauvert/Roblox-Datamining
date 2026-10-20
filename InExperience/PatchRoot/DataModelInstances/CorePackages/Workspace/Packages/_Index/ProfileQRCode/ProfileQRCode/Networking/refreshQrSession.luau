local HttpModule = require(script:FindFirstAncestor("ProfileQRCode").Parent.Http)

local function v1(Callback, _)
	-- upvalues: HttpModule (copy)
	return Callback(HttpModule.Url.FRIEND_URL):path("my"):path("friends"):path("refresh-qr-session"):body({})
end

return (function(p1)
	-- upvalues: v1 (copy)
	return p1.POST(script.Name, v1)
end)((require(script.Parent.configuredRoduxNetworking)))