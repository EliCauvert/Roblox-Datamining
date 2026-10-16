local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local HttpRequest = require(Parent.LuaSocialLibrariesDeps).httpRequest

return (require(Parent.RoduxNetworking).config({
	keyPath = require(EditProfile.Common.Constants).RODUX_KEY .. ".NetworkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3) --[[ Line: 11 ]]
			-- upvalues: HttpRequest (copy)
			return HttpRequest.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		maxRetryCount = game:DefineFastInt("EditProfileMaxHttpRetries", 5)
	})
}))