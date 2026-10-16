local HttpRequest = require(script:FindFirstAncestor("UserSearch").Parent.LuaSocialLibrariesDeps).httpRequest
local MigrateUserSearchHttpRequestToRequestInternal = game:DefineFastFlag("MigrateUserSearchHttpRequestToRequestInternal", false)

return (HttpRequest.config({
	requestFunction = function(p1, p2, p3) --[[ Line: 10 ]]
		-- upvalues: MigrateUserSearchHttpRequestToRequestInternal (copy), HttpRequest (copy)
		return if MigrateUserSearchHttpRequestToRequestInternal then HttpRequest.requestFunctions.RequestInternal(p1, p2, p3) else HttpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	maxRetryCount = game:DefineFastInt("UserSearchHttpRetryCount", 3)
}))