local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local HttpRequest = require(Parent1.SocialLibraries).httpRequest

return (require(Parent1.RoduxNetworking).config({
	keyPath = require(Parent.Common.Constants).RODUX_KEY .. ".NetworkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: HttpRequest (copy)
			return HttpRequest.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		maxRetryCount = game:DefineFastInt("FriendRequestNicknamesMaxHttpRetries", 5)
	})
}))