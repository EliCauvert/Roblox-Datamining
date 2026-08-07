local parent = script.Parent.Parent
local parent_1 = parent.Parent
local httpRequest = require(parent_1.SocialLibraries).httpRequest

return require(parent_1.RoduxNetworking).config({
	keyPath = require(parent.Common.Constants).RODUX_KEY .. ".NetworkStatus",
	networkImpl = httpRequest.config({
		requestFunction = function(p0, p1, p2) --[[ line: 11 ]]
			-- upvalues: httpRequest (ref)
			return httpRequest.requestFunctions.RequestInternal(p0, p1, p2)
		end,
		maxRetryCount = game:DefineFastInt("FriendRequestNicknamesMaxHttpRetries", 5)
	})
})