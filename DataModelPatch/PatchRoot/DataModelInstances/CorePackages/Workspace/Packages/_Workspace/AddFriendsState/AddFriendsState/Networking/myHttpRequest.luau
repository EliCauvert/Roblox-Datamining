local HttpRequestModule = require(script:FindFirstAncestor("AddFriendsState").Parent.HttpRequest)

return (HttpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end,
	maxRetryCount = game:DefineFastInt("AddFriendsHttpRetryCount", 3)
}))