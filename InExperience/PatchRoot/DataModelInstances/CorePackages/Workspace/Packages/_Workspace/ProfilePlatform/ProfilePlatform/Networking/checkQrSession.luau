local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local MyRoduxNetworkingModule = require(ProfilePlatform.Networking.myRoduxNetworking)
local HttpModule = require(ProfilePlatform.Parent.Http)

return MyRoduxNetworkingModule.GET("CheckQRSession", function(Callback, p1)
	-- upvalues: HttpModule (copy)
	return Callback(HttpModule.Url.FRIEND_URL):path("my"):path("friends"):path((tostring(p1))):path("check-qr-session")
end)