local httpRequest = require(script:FindFirstAncestor("TrustedContacts").Parent.LuaSocialLibrariesDeps).httpRequest

return httpRequest.config({
	requestFunction = function(p0, p1, p2)
		-- upvalues: httpRequest (ref)
		return httpRequest.requestFunctions.RequestInternal(p0, p1, p2)
	end,
	maxRetryCount = game:DefineFastInt("TrustedContactsHttpRetryCount", 3)
})