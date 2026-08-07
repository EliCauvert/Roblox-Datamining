local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local httpRequest = require(parent.LuaSocialLibrariesDeps).httpRequest

return require(parent.RoduxNetworking).config({
	keyPath = require(editProfile.Common.Constants).RODUX_KEY .. ".NetworkStatus",
	networkImpl = httpRequest.config({
		requestFunction = function(p0, p1, p2) --[[ line: 11 ]]
			-- upvalues: httpRequest (ref)
			return httpRequest.requestFunctions.RequestInternal(p0, p1, p2)
		end,
		maxRetryCount = game:DefineFastInt("EditProfileMaxHttpRetries", 5)
	})
})