local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local HttpModule = require(ProfilePlatform.Parent.Http)

return require(ProfilePlatform.Networking.myRoduxNetworking).GET("CheckQRSession", function(Callback, p1)
	-- upvalues: HttpModule (copy)
	return Callback(HttpModule.Url.FRIEND_URL):path("my"):path("friends"):path((tostring(p1))):path("check-qr-session")
end)