local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local httpRequest = require(parent.LuaSocialLibrariesDeps).httpRequest

return require(parent.RoduxNetworking).config({
	keyPath = require(editProfile.Common.Constants).RODUX_KEY .. ".NetworkStatus",
	networkImpl = httpRequest.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: httpRequest (ref)
			return httpRequest.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		maxRetryCount = game:DefineFastInt("EditProfileMaxHttpRetries", 5)
	})
})