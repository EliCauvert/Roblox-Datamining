local HttpRequest = require(script:FindFirstAncestor("TrustedContacts").Parent.LuaSocialLibrariesDeps).httpRequest

return (HttpRequest.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: HttpRequest (copy)
		return HttpRequest.requestFunctions.RequestInternal(p1, p2, p3)
	end,
	maxRetryCount = game:DefineFastInt("TrustedContactsHttpRetryCount", 3)
}))