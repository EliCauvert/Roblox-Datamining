local httpRequest = require(script:FindFirstAncestor("UserSearch").Parent.LuaSocialLibrariesDeps).httpRequest
local migrateUserSearchHttpRequestToRequestInternal = game:DefineFastFlag("MigrateUserSearchHttpRequestToRequestInternal", false)

return httpRequest.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: migrateUserSearchHttpRequestToRequestInternal (ref), httpRequest (ref)
		return if migrateUserSearchHttpRequestToRequestInternal then httpRequest.requestFunctions.RequestInternal(p1, p2, p3) else httpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	maxRetryCount = game:DefineFastInt("UserSearchHttpRetryCount", 3)
})