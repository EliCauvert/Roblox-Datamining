local httpRequest = require(script:FindFirstAncestor("TrustedContacts").Parent.LuaSocialLibrariesDeps).httpRequest

return httpRequest.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: httpRequest (ref)
		return httpRequest.requestFunctions.RequestInternal(p1, p2, p3)
	end,
	maxRetryCount = game:DefineFastInt("TrustedContactsHttpRetryCount", 3)
})