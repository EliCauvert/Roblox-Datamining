local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local httpModule = require(profilePlatform.Parent.Http)

return require(profilePlatform.Networking.myRoduxNetworking).GET({ Name = "CheckQRSession" }, function(p0, p1) --[[ line: 6 | named "buildUrl" ]]
	-- upvalues: httpModule (ref)
	return p0(httpModule.Url.FRIEND_URL):path("my"):path("friends"):path(tostring(p1)):path("check-qr-session")
end)