local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local httpModule = require(profilePlatform.Parent.Http)

return require(profilePlatform.Networking.myRoduxNetworking).GET("CheckQRSession", function(p1, p2)
	-- upvalues: httpModule (ref)
	return p1(httpModule.Url.FRIEND_URL):path("my"):path("friends"):path(tostring(p2)):path("check-qr-session")
end)